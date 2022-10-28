﻿using System;
using System.Collections.Generic;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RentGameAPI.DBContext;
using RentGameAPI.Models;

namespace RentGameAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClientsController : ControllerBase
    {
        private readonly AppDbContext _context;

        public ClientsController(AppDbContext context)
        {
            _context = context;
        }





        // GET: api/Clients
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Client>>> GetClients()
        {
         
            return await _context.Clients.ToListAsync();
        }

        // GET: api/Clients/Best
        [HttpGet("Best")]
        public async Task<ActionResult> GetBest()
        {
            var clientes = _context.Clients;
            
            var usuarios = _context.Users;
            var rentas = _context.Rents;
            var query = await (from rentados in (from u in (from b in 
                                       (from r in rentas group r by r.IdUser into grp select new {IdUser=grp.Key,Rentas=grp.Count()}) 
                                   orderby b.Rentas descending select(b)
                                   ) 
                        join us in usuarios on u.IdUser equals us.IdUser
                        select new {u.IdUser,u.Rentas,us.IdClient})
                        join cli in clientes on rentados.IdClient equals cli.IdClient select new {rentados.IdUser,cli.FirstName,cli.LastName,cli.Email,cli.Age,cli.Address,cli.Birthday,rentados.Rentas}).FirstAsync()
                        ;
            
            return Ok(query);
        }


        // GET: api/Clients/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Client>> GetClient(int id)
        {
            var client = await _context.Clients.FindAsync(id);

            if (client == null)
            {
                return NotFound();
            }

            return client;
        }

        // PUT: api/Clients/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutClient(int id, Client client)
        {
            if (id != client.IdClient)
            {
                return BadRequest();
            }

            _context.Entry(client).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ClientExists(id))
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

        // POST: api/Clients
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Client>> PostClient(Client client)
        {
            _context.Clients.Add(client);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetClient", new { id = client.IdClient }, client);
        }

        // DELETE: api/Clients/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteClient(int id)
        {
            var client = await _context.Clients.FindAsync(id);
            if (client == null)
            {
                return NotFound();
            }

            _context.Clients.Remove(client);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ClientExists(int id)
        {
            return _context.Clients.Any(e => e.IdClient == id);
        }
    }
}
