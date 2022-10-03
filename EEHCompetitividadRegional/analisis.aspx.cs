using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EEHCompetitividadRegional
{
    public partial class analisis : System.Web.UI.Page
    {
        clases.db vConexion = new clases.db();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
            }
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (txCodigoCliente.Text == "")
                {
                    throw new Exception("Por favor ingrese el codigo del cliente.");
                }
                if (txTelefonoCliente.Text == "")
                {
                    throw new Exception("Por favor ingrese el telefono del cliente.");
                }
                if (txNombreCliente.Text == "")
                {
                    throw new Exception("Por favor ingrese el nombre del cliente.");
                }
                if (txIdentidad.Text == "")
                {
                    throw new Exception("Por favor ingrese la identidad del cliente.");
                }

                clases.Respuestas vRespuesta = new clases.Respuestas();

                vRespuesta = vConexion.InsertarRegistro(txCodigoCliente.Text, txNombreCliente.Text, txTelefonoCliente.Text, txReclamoCliente.Text, txIdentidad.Text, txCorreo.Text, Convert.ToString(Session["USR"]));

                if (vRespuesta == clases.Respuestas.SUCCESS)
                {
                    limpiar();
                    LbMensaje.Text = "Ingresado con exito!";
                }
                else if(vRespuesta == clases.Respuestas.ERROR) 
                {
                    throw new Exception("Se ha producido un error en el sistema");
                }
                
            }
            catch (Exception Ex)
            {
                LbMensaje.Text = Ex.Message;
            }
        }

        protected void BtnCancelar_Click(object sender, EventArgs e)
        {
            limpiar();
        }

        void limpiar()
        {
            txCodigoCliente.Text = "";
            txTelefonoCliente.Text = "";
            txNombreCliente.Text = "";
            txIdentidad.Text = "";
            txCorreo.Text = "";
            txReclamoCliente.Text = "";
            LbMensaje.Text = "";
        }
    }
}