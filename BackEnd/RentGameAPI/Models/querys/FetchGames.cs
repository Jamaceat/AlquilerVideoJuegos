using NuGet.Protocol.Plugins;

namespace RentGameAPI.Models.querys
{
    public class FetchGames
    {
        public string atributo { get; set; }
        public string data { get; set; }


        FetchGames(string atributo, string data)
        {

            //Receive: ReleaseDate, title, director, protagonist
            this.atributo = atributo;


            this.data = data;
        }
    }
}
