using Capa_Datos;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Api_Examen_JuniorCasas.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : Controller
    {
        private readonly IConfiguration _configuration;
        public UsuarioController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        //Metodo Get Listar Usuario
        [HttpGet]
        public JsonResult ListarUsuario()
        {

            DataTable table = new DataTable();

            Dato_Usuario data = new Dato_Usuario();
            //Recupero la Conexion del appseting
            string sqlDataSource = _configuration.GetConnectionString("con").ToString();
            //obtengo la informacion del metodo listar  de la capa de datos
            table = data.ListarUsuario(sqlDataSource);



            return new JsonResult(table);
        }

        [HttpPost]
        public JsonResult RegitrarUsuario(string nombre, string correo, string clave)
        {
            bool Resultado = false;

            Dato_Usuario data = new Dato_Usuario();
            //Recupero la Conexion del appseting
            string sqlDataSource = _configuration.GetConnectionString("con").ToString();
            //obtengo la informacion del metodo registrar de la capa de datos
            Resultado = data.RegitrarUsuario(nombre, correo, clave, sqlDataSource);

            return new JsonResult(Resultado);
        }
        
    }
}
