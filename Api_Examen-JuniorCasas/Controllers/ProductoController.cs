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
    public class ProductoController : Controller
    {
        private readonly IConfiguration _configuration;
        public ProductoController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        //Metodo Get para Listar Producto

        [HttpGet]
        public JsonResult ListarProducto()
        {

            DataTable table = new DataTable();

            Dato_Producto data = new Dato_Producto();
            //Recupero la Conexion del appseting
            string sqlDataSource = _configuration.GetConnectionString("con").ToString();
            //obtengo la informacion del metodo listar  de la capa de datos
            table = data.ListarProducto(sqlDataSource);



            return new JsonResult(table);
        }

        //Metodo Post para Registrar Producto
        [HttpPost]
        public JsonResult RegistrarProducto(string CodBarra, string DesProducto, decimal Precio, int Stock)
        {
            bool Resultado = false;

            Dato_Producto data = new Dato_Producto();
            //Recupero la Conexion del appseting
            string sqlDataSource = _configuration.GetConnectionString("con").ToString();
            //obtengo la informacion del metodo registrar de la capa de datos
            Resultado = data.RegitrarProducto(CodBarra, DesProducto, Precio, Stock, sqlDataSource);

            return new JsonResult(Resultado);
        }

        //Metodo Post para Actualizar Producto
        [HttpPut]
        public JsonResult ActualizarProducto(int idProducto,string CodBarra, string DesProducto, decimal Precio, int Stock)
        {
            bool Resultado = false;

            Dato_Producto data = new Dato_Producto();
            //Recupero la Conexion del appseting
            string sqlDataSource = _configuration.GetConnectionString("con").ToString();
            //obtengo la informacion del metodo registrar de la capa de datos
            Resultado = data.ActualizarProducto(idProducto,CodBarra, DesProducto, Precio, Stock, sqlDataSource);

            return new JsonResult(Resultado);
        }

   

    }
}
