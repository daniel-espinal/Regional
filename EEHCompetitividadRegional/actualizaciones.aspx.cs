using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EEHCompetitividadRegional
{
    public partial class actualizaciones : System.Web.UI.Page
    {
        clases.db vConexion = new clases.db();
        protected void Page_Load(object sender, EventArgs e)
        {
            String vCodigo = Request.QueryString["codigo"];
            if (!Page.IsPostBack)
            {
                if (vCodigo != null)
                {
                    txCodigoCliente.Text = vCodigo;
                    txCodigoCliente.ReadOnly = true;
                    cargarDatos();
                }
            }
            
        }

        void cargarDatos()
        {
            try
            {
                Session["ESTADOVIEJO"] = "";
                DataTable vDatos = vConexion.ObtenerCaso(txCodigoCliente.Text);
                if (vDatos.Rows.Count > 0)
                {
                    for (int i = 0; i < vDatos.Rows.Count; i++)
                    {
                        txAnalisisDefensoria.Text = vDatos.Rows[i]["analisis"].ToString();
                        txDictamen.Text = vDatos.Rows[i]["dictamen"].ToString();
                        txNumeroOs.Text = vDatos.Rows[i]["os"].ToString();
                        txCameraComercio.Text = vDatos.Rows[i]["username"].ToString();
                        Session["ESTADOVIEJO"] = vDatos.Rows[i]["estado"].ToString();
                        for (int j = 0; j < SelectEstado.Items.Count; j++)
                        {
                            if (SelectEstado.Items[j].Text.Equals(vDatos.Rows[i]["estado"].ToString()))
                            {
                                SelectEstado.SelectedIndex = j;
                            }
                        }
                    }
                }

                

                
            }
            catch (Exception)
            {

                throw;
            }
        }



        void limpiar()
        {
            txCodigoCliente.Text = "";
            txCodigoCliente.ReadOnly = false;
            txCodigoCliente.Text = "";
            SelectEstado.SelectedIndex = 0;
            txNumeroOs.Text = "";
            txAnalisisDefensoria.Text = "";
            txDictamen.Text = "";
        }

        protected void BtnConsultar_Click(object sender, EventArgs e)
        {
            txCodigoCliente.ReadOnly = true;

            //String vQuery = "[EEH_EPGenerales] 2, 0";
            DataTable vDatos = vConexion.ConsultarPorCodigo(txCodigoCliente.Text);

            txDictamen.Text = vDatos.Rows[0]["dictamen"].ToString();
            txAnalisisDefensoria.Text = vDatos.Rows[0]["analisis"].ToString();
            txNumeroOs.Text = vDatos.Rows[0]["os"].ToString();

            int codEstado = 0;
            if (vDatos.Rows[0]["estado"].ToString() == "Con problemas en información")
                codEstado = 4;

            if (vDatos.Rows[0]["estado"].ToString() == "Resuelto")
                codEstado = 1;

            if (vDatos.Rows[0]["estado"].ToString() == "En proceso de resolución final")
                codEstado = 2;

            if (vDatos.Rows[0]["estado"].ToString() == "Improcedente")
                codEstado = 3;

            SelectEstado.SelectedIndex = codEstado;

        }

        protected void BtnGuardarCaso_Click(object sender, EventArgs e)
        {
            clases.Respuestas vRespuesta = new clases.Respuestas();
            try
            {
                if (txAnalisisDefensoria.Text == "")
                {
                    throw new Exception("Por favor ingrese el analisis");
                }

                if (txDictamen.Text == ""){
                    String vQuery = "[EEHCompetitividadRegionalSP] 5, '" + Session["USR"].ToString() + "'";
                    DataTable vDatos = vConexion.obtenerDataTable(vQuery);

                    if (vDatos.Rows.Count < 1){
                        throw new Exception("Por favor ingrese el dictamen");
                    }
                    
                }

                if (txNumeroOs.Text == "")
                {
                    throw new Exception("Por favor ingrese el numero de OS");
                }

                vRespuesta = vConexion.ActualizarEstado(txCodigoCliente.Text, SelectEstado.Items[SelectEstado.SelectedIndex].Text, txNumeroOs.Text, txAnalisisDefensoria.Text, txDictamen.Text, Convert.ToString(Session["ESTADOVIEJO"]) );

                if (vRespuesta == clases.Respuestas.SUCCESS)
                {
                    limpiar();
                    LbMensaje.Text = "Actualizado con exito!";
                }
                else if (vRespuesta == clases.Respuestas.ERROR)
                {
                    throw new Exception("Se ha producido un error en el sistema");
                }
            }
            catch (Exception Ex)
            {
                LbMensaje.Text = Ex.Message;
            }
        }

        protected void BtnCancelarCaso_Click(object sender, EventArgs e)
        {
            limpiar();
        }
    }
}