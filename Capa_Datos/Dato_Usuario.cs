using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Capa_Datos
{
   public class Dato_Usuario
    {
        public DataTable ListarUsuario(string cadena)
        {

            DataTable table = new DataTable();

            SqlDataReader myReader;
            using (SqlConnection myCon = new SqlConnection(cadena))
            {
                myCon.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "sp_listar_usuario";
                    cmd.Connection = myCon;

                    myReader = cmd.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                    myCon.Close();
                }
            }

            return table;
        }

        public  bool RegitrarUsuario(string nombre,string correo,string clave,string cadena)
        {
            bool Resultado = false;
           
            SqlTransaction transaction;
            using (SqlConnection conexion = new SqlConnection(cadena))
            {
                SqlDataReader reader = null;
                conexion.Open();
                transaction = conexion.BeginTransaction();
                using (SqlCommand cmd = new SqlCommand("sp_guardar_usuario", conexion, transaction))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 0;
                    cmd.Parameters.Add(new SqlParameter("@Nombre", SqlDbType.VarChar,50)).Value = nombre;
                    cmd.Parameters.Add(new SqlParameter("@Correo", SqlDbType.VarChar,50)).Value = correo;
                    cmd.Parameters.Add(new SqlParameter("@Clave", SqlDbType.VarChar,50)).Value = clave;
             

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
