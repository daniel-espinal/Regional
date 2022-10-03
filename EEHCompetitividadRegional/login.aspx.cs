using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EEHCompetitividadRegional
{
    public partial class login : System.Web.UI.Page
    {
        clases.db vConexion = new clases.db();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        protected void BtnEntrar_Click(object sender, EventArgs e)
        {
            clases.Usuarios vRespuesta = new clases.Usuarios();
            try
            {
                vRespuesta = vConexion.Usuarios(TxUsuario.Text, TxPassword.Text);
                switch (vRespuesta)
                {
                    case clases.Usuarios.ADMIN: Session["PRI"] = 1; Session["USR"] = TxUsuario.Text; break;
                    case clases.Usuarios.OTROS: Session["PRI"] = 2; Session["USR"] = TxUsuario.Text; break;
                    case clases.Usuarios.ERROR: throw new Exception("Credenciales incorrectas");
                }

                Response.Redirect("default.aspx");
            }
            catch (Exception Ex)
            {
                LbMensaje.Text = Ex.Message;
            }
        }
    }
}