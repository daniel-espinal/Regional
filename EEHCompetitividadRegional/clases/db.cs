using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace EEHCompetitividadRegional.clases
{
    public enum Respuestas
    {
        SUCCESS = 1,
        FAILED = 2,
        ERROR = 3
    }

    public enum Usuarios
    {
        ADMIN = 1,
        OTROS = 2,
        ERROR = 3
    }
    public class db
    {
        SqlConnection vConexion;
        public db()
        {
            vConexion = new SqlConnection(ConfigurationManager.AppSettings["SqlServer"]);
        }

        public Respuestas InsertarRegistro(String vCodigoCliente, String vNombreCliente, String vTelefono, String vReclamo, String vIdentidad, String vCorreo, String vUser)
        {
            DataTable vData = new DataTable();
            Respuestas vRespuesta = new Respuestas();
            try
            {
                String vQuery = "[EEHCompetitividadRegionalSP] 1, '" + vCodigoCliente 
                    + "','" + vNombreCliente 
                    + "','" + vTelefono 
                    + "','" + vReclamo 
                    + "','" + vIdentidad
                    + "','" + vCorreo 
                    + "','" + vUser + "'";
                SqlDataAdapter vDataAdapter = new SqlDataAdapter(vQuery, vConexion);
                vDataAdapter.Fill(vData);

                if (vData.Rows.Count > 0)
                {
                    if (vData.Rows[0][0].ToString().Equals("1"))
                        vRespuesta = Respuestas.SUCCESS;
                    else
                        vRespuesta = Respuestas.FAILED;
                }
                else
                    vRespuesta = Respuestas.FAILED;
            }
            catch 
            {
                vRespuesta = Respuestas.ERROR;
            }
            return vRespuesta;
        }

        public DataTable ConsultarPorCodigo(String vCodigoCliente)
        {
            DataTable vData = new DataTable();
            try
            {
                String vQuery = "[EEHCompetitividadRegionalSP] 2, '" + vCodigoCliente + "'";
                SqlDataAdapter vDataAdapter = new SqlDataAdapter(vQuery, vConexion);
                vDataAdapter.Fill(vData);
            }
            catch
            {
                vData = new DataTable();
            }
            return vData;
        }

        public DataTable ConsultarPorCodigo2(String vCodigoCliente){
            DataTable vData = new DataTable();
            try{
                String vQuery = "[EEHCompetitividadRegionalSP] 4, '" + vCodigoCliente + "'";
                SqlDataAdapter vDataAdapter = new SqlDataAdapter(vQuery, vConexion);
                vDataAdapter.Fill(vData);
            }catch{
                vData = new DataTable();
            }
            return vData;
        }

        public Respuestas ActualizarEstado(String vCodigoCliente,String vEstado, String vOs, String vAnalisis, String vDictamen, String vEstadoViejo)
        {
            DataTable vData = new DataTable();
            Respuestas vRespuesta = new Respuestas();
            try
            {
                String vQuery = "[EEHCompetitividadRegionalSP] 3, '" + vCodigoCliente + "','" + vEstado + "'," + vOs + ",'" + vAnalisis + "','" + vDictamen + "','" + vEstadoViejo + "'";
                SqlDataAdapter vDataAdapter = new SqlDataAdapter(vQuery, vConexion);
                vDataAdapter.Fill(vData);

                if (vData.Rows.Count > 0)
                {
                    if (vData.Rows[0][0].ToString().Equals("1"))
                        vRespuesta = Respuestas.SUCCESS;
                    else
                        vRespuesta = Respuestas.FAILED;
                }
                else
                    vRespuesta = Respuestas.FAILED;
            }
            catch
            {
                vRespuesta = Respuestas.ERROR;
            }
            return vRespuesta;
        }

        public Usuarios Usuarios(String vUsername, String vPassword)
        {
            DataTable vData = new DataTable();
            Usuarios vRespuesta = new Usuarios();
            try
            {
                String vQuery = "[EEHCompetitividadRegional_Users] 1, '" + vUsername + "','" + vPassword + "'";
                SqlDataAdapter vDataAdapter = new SqlDataAdapter(vQuery, vConexion);
                vDataAdapter.Fill(vData);

                if (vData.Rows.Count > 0)
                {
                    if (vData.Rows[0][0].ToString().Equals("0"))
                    {
                        vRespuesta = clases.Usuarios.ERROR;
                    }
                    else
                    {
                        if(vData.Rows[0][0].ToString().Equals("True"))
                            vRespuesta = clases.Usuarios.ADMIN;
                        else
                            vRespuesta = clases.Usuarios.OTROS;
                    }
                }
                else
                    vRespuesta = clases.Usuarios.ERROR;
            }
            catch
            {
                vRespuesta = clases.Usuarios.ERROR;
            }
            return vRespuesta;
        }

        public DataTable ObtenerCaso(String vCodigoCliente)
        {
            DataTable vDatos = new DataTable();
            try
            {
                String vQuery = "[EEHCompetitividadRegional_Datos] 1," + vCodigoCliente;
                SqlDataAdapter vDataAdapter = new SqlDataAdapter(vQuery, vConexion);
                vDataAdapter.Fill(vDatos);
            }
            catch {}
            return vDatos;
        }

        public DataTable obtenerDataTable(String vQuery){
            DataTable vDatos = new DataTable();
            try{
                SqlDataAdapter vDataAdapter = new SqlDataAdapter(vQuery, vConexion);
                vDataAdapter.SelectCommand.CommandTimeout = 25000;
                vDataAdapter.Fill(vDatos);
            }catch{
                throw;
            }
            return vDatos;
        }
    }
}