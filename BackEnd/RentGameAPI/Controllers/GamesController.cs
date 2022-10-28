using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using NuGet.Protocol;
using RentGameAPI.DBContext;
using RentGameAPI.Models;
using RentGameAPI.Models.querys;
using System.Data;
using Newtonsoft.Json;
using Microsoft.CodeAnalysis.VisualBasic.Syntax;
using RentGameAPI.Models.querys;
using System.Drawing.Drawing2D;

namespace RentGameAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GamesController : ControllerBase
    {
        private readonly AppDbContext _context;

        public GamesController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Games
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Game>>> GetGames()
        {
            return await _context.Games.ToListAsync();
        }

        // GET: api/Games/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Game>> GetGame(int id)
        {
            var game = await _context.Games.FindAsync(id);

            if (game == null)
            {
                return NotFound();
            }

            return game;
        }

        //***********************************************************
        //GET api/Games/FetchGames

        [HttpGet("InfoGames/{atributo}/{data}")]
        public async Task<ActionResult> GetInfoGames(string atributo, string data)
        {
            var juegos = _context.Games;
            switch (atributo)
            {
                case "ReleaseDate":
                    var query = await juegos.Where(x => x.ReleaseYear == Int32.Parse(data)).ToListAsync();
                    if (query == null) { return NotFound(); }
                    return Ok(query);
                    break;
                case "title":
                    var query2 = await juegos.Where(x => x.Name.Contains(data) ).ToListAsync();
                    if (query2 == null) { return NotFound(); }
                    return Ok(query2);
                    break;
                case "director":
                    var query3 = await juegos.Where(x => x.Director.Contains(data)).ToListAsync();
                    if (query3 == null) { return NotFound(); }
                    return Ok(query3);
                    break;
                case "protagonist":
                    var query4 = await juegos.Where(x => x.Protagonist.Contains(data)).ToListAsync();
                    if (query4 == null) { return NotFound(); }
                    return Ok(query4);
                    break;
                default:
                    return BadRequest();
                    break;

            }

        }

        // GET: api/Games/MenosRentado
        [HttpGet("MenosRentado")]
        public async Task<ActionResult> GetMenosRentado()
        {
            var clientes = _context.Clients;
            var juegos = _context.Games;
            var usuarios = _context.Users;
            var rentas = _context.Rents;
            var primerquery = from c in clientes join us in usuarios on c.IdClient equals us.IdClient select new { IdClient = c.IdClient, IdUser = us.IdUser, age = c.Age };
            var segundoquery = from r in rentas join pr in primerquery on r.IdUser equals pr.IdUser select new { Age = pr.age, IdGame = r.IdGame };
            var tercerquery = await (from g in juegos join se in segundoquery on g.IdGame equals se.IdGame select new { age = se.Age, name = g.Name, rango = (se.Age / 10) * 10 }).OrderBy(x => x.rango).ToArrayAsync();
            //List<MenosRentado> mr =await (Task<List<MenosRentado>>)tercerquery.Select(x => new MenosRentado(x.name, x.rango, x.age)).ToListAsync();
            if (tercerquery.Length == 0)
                return NoContent();
            //var primero = new MenosRentado(quin.title, quin.rango, quin.frecuencia);
            List<MenosRentado> resultado = new List<MenosRentado>() ;
            
            for (var i = 0; i < 12; i++)
            {
                var auxiliarList = (from x in (tercerquery.Where(x => x.rango == i*10)) group x by x.name into grp select new { title = grp.Key, frecuencia = grp.Count(),rango=i*10 }).OrderBy(x => x.frecuencia);
                if (auxiliarList.Count() != 0)
                {
                    var auxiliar = auxiliarList.First();
                    MenosRentado transformar = new MenosRentado(auxiliar.title, auxiliar.rango, auxiliar.frecuencia);
                    resultado.Add(transformar);
                }
            }
            var aLista = resultado.ToList();
            if (aLista == null) { return NotFound(); }
            return Ok(aLista);
            }

        [HttpGet("MasRentado")]
        public async Task<ActionResult> GetMasRentado()
        {
            var juegos = _context.Games;
            var rentas = _context.Rents;
            var query =await (from ord in (from r in 
                (from r in rentas group r by r.IdGame into grp select new { IdGame = grp.Key, Rentados = grp.Count() })
                join g in juegos on r.IdGame equals g.IdGame select new { Titulo = g.Name,r.IdGame,frecuencia=r.Rentados}) 
                              orderby ord.frecuencia descending select(ord)).FirstAsync()
                ;
            if(query == null) return NoContent();

            return Ok(query);
        }

        // PUT: api/Games/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutGame(int id, Game game)
        {
            if (id != game.IdGame)
            {
                return BadRequest();
            }

            _context.Entry(game).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!GameExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        //// PUT: api/Games/5
        //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("Precio")]
        public async Task<IActionResult> PutGame(CambioPrecio cambio)
        {
        
            try
            {
                var juegos = _context.Games;
               var cambiar=await juegos.Where(x=>x.IdGame == cambio.IdGame).FirstOrDefaultAsync();
                cambiar.RentalPrice = cambio.RentalPrice;
                juegos.Update(cambiar);
                
                //_context.Entry(cambiar).State = EntityState.Modified;

            }
            catch (Exception e)
            {
                return BadRequest();
            }
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!GameExists(cambio.IdGame))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }



        // POST: api/Games
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Game>> PostGame(Game game)
        {
            _context.Games.Add(game);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetGame", new { id = game.IdGame }, game);
        }

        // DELETE: api/Games/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteGame(int id)
        {
            var game = await _context.Games.FindAsync(id);
            if (game == null)
            {
                return NotFound();
            }

            _context.Games.Remove(game);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool GameExists(int id)
        {
            return _context.Games.Any(e => e.IdGame == id);
        }
    }
}
