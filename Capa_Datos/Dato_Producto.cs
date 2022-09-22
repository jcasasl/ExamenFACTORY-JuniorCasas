using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Capa_Datos
{
   public class Dato_Producto
    {
        public DataTable ListarProducto(string cadena)
        {

            DataTable table = new DataTable();

            SqlDataReader myReader;
            using (SqlConnection myCon = new SqlConnection(cadena))
            {
                myCon.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_listar_producto";
                    cmd.Connection = myCon;

                    myReader = cmd.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                    myCon.Close();
                }
            }

            return table;
        }

        public bool RegitrarProducto(string CodBarra, string DesProducto, decimal Precio, int Stock, string cadena)
        {
            bool Resultado = false;

            SqlTransaction transaction;
            using (SqlConnection conexion = new SqlConnection(cadena))
            {
                SqlDataReader reader = null;
                conexion.Open();
                transaction = conexion.BeginTransaction();
                using (SqlCommand cmd = new SqlCommand("sp_guardar_producto", conexion, transaction))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 0;
                    cmd.Parameters.Add(new SqlParameter("@Codigo", SqlDbType.VarChar, 100)).Value = CodBarra;
                    cmd.Parameters.Add(new SqlParameter("@Descripcion", SqlDbType.VarChar, 100)).Value = DesProducto;
                    cmd.Parameters.Add(new SqlParameter("@Precio", SqlDbType.Decimal)).Value = Precio;
                    cmd.Parameters.Add(new SqlParameter("@stock", SqlDbType.Int)).Value = Stock;

                    try
                    {

                        cmd.ExecuteNonQuery();

                        Resultado = true;

                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        Resultado = false;

                        transaction.Rollback();
                    }
                    finally
                    {
                        cmd.Dispose();
                        if (reader != null)
                        {
                            reader.Close();
                            reader.Dispose();
                        }
                        if (conexion.State == ConnectionState.Open)
                        {
                            conexion.Close();
                            conexion.Dispose();
                        }
                    }
                }
            }
            return Resultado;
        }

        public bool ActualizarProducto(int IdProducto,string CodBarra, string DesProducto, decimal Precio, int Stock, string cadena)
        {
            bool Resultado = false;

            SqlTransaction transaction;
            using (SqlConnection conexion = new SqlConnection(cadena))
            {
                SqlDataReader reader = null;
                conexion.Open();
                transaction = conexion.BeginTransaction();
                using (SqlCommand cmd = new SqlCommand("sp_editar_producto", conexion, transaction))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 0;
                    cmd.Parameters.Add(new SqlParameter("@IdProducto", SqlDbType.Int)).Value = IdProducto;
                    cmd.Parameters.Add(new SqlParameter("@Codigo", SqlDbType.VarChar, 100)).Value = CodBarra;
                    cmd.Parameters.Add(new SqlParameter("@Descripcion", SqlDbType.VarChar, 100)).Value = DesProducto;
                    cmd.Parameters.Add(new SqlParameter("@Precio", SqlDbType.Decimal)).Value = Precio;
                    cmd.Parameters.Add(new SqlParameter("@stock", SqlDbType.Int)).Value = Stock;

                    try
                    {

                        cmd.ExecuteNonQuery();

                        Resultado = true;

                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        Resultado = false;

                        transaction.Rollback();
                    }
                    finally
                    {
                        cmd.Dispose();
                        if (reader != null)
                        {
                            reader.Close();
                            reader.Dispose();
                        }
                        if (conexion.State == ConnectionState.Open)
                        {
                            conexion.Close();
                            conexion.Dispose();
                        }
                    }
                }
            }
            return Resultado;
        }

    }
}
