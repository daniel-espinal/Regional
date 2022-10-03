using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Xml;
//using Excel;

namespace EEHCompetitividadRegional
{
    public partial class consultas : System.Web.UI.Page
    {
        clases.db vConexion = new clases.db();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
            ExportXls.Visible = false;
        }

        protected void BtnConsultar_Click(object sender, EventArgs e)
        {
            try{
                ExportXls.Visible = true;
                //DataTable vDatos = vConexion.ConsultarPorCodigo(txCodigoCliente.Text);
                DataTable vDatos = vConexion.ConsultarPorCodigo2(txCodigoCliente.Text);
                Session["DATACLAVE"] = vDatos;
                GridViewConsulta.DataSource = vDatos;
                GridViewConsulta.DataBind();

                DataTable vDatos2 = (DataTable)GridViewConsulta.DataSource;
                Session["DATOSGRID"] = vDatos2;
            }
            catch (Exception Ex){
                LbMensaje.Text = Ex.Message;
            }
        }

        protected void BtnCancelar_Click(object sender, EventArgs e)
        {
            limpiar();
        }

        void limpiar()
        {
            GridViewConsulta.DataSource = null;
            GridViewConsulta.DataBind();
            txCodigoCliente.Text = "";
        }

        protected void GridViewConsulta_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (Convert.ToInt32(Session["PRI"]) == 1)
                {
                    if (e.CommandName == "Edit")
                    {
                        Response.Redirect("actualizaciones.aspx?codigo=" + GridViewConsulta.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].Text);
                    }
                }
                else
                    throw new Exception("No tienes privilegios para modificar este caso.");
            }
            catch (Exception Ex)
            {
                LbMensaje.Text = Ex.Message;
            }
        }

        protected void GridViewConsulta_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewConsulta.PageIndex = e.NewPageIndex;
            GridViewConsulta.DataSource = (DataTable)Session["DATACLAVE"];
            GridViewConsulta.DataBind();
        }

        protected void ExportXls_Click(object sender, EventArgs e){
            ExportXls.Visible = true;
            
            try{
                DataTable dt0 = (DataTable)Session["DATOSGRID"];
                DataTable dt = new DataTable();

                dt.Columns.Add("codigoCliente");
                dt.Columns.Add("nombre");
                dt.Columns.Add("telefono");
                dt.Columns.Add("reclamo");
                dt.Columns.Add("dictamen");
                dt.Columns.Add("os");
                dt.Columns.Add("fechaIngreso");
                dt.Columns.Add("fechaResolucion");
                dt.Columns.Add("sector");
                dt.Columns.Add("username");
                dt.Columns.Add("estado");

                for (int i = 0; i < dt0.Rows.Count; i++){
                    dt.Rows.Add(dt0.Rows[i][1], dt0.Rows[i][2], dt0.Rows[i][3], dt0.Rows[i][6], dt0.Rows[i][8], dt0.Rows[i][9], dt0.Rows[i][10], dt0.Rows[i][11], dt0.Rows[i][16], dt0.Rows[i][13], dt0.Rows[i][12]);
                }

                int cant = dt.Rows.Count;

                StreamWriter wr = new StreamWriter(@"C:\\htdocs_eehApps\EEHRegional\doc\Libro1.xls");
                for (int i = 0; i < dt.Columns.Count; i++){
                    wr.Write(dt.Columns[i].ToString().ToUpper() + "\t");
                }

                wr.WriteLine();

                for (int i = 0; i < (dt.Rows.Count); i++){
                    for (int j = 0; j < dt.Columns.Count; j++){
                        if (dt.Rows[i][j] != null){
                            string aver = Convert.ToString(dt.Rows[i][j]);
                            wr.Write(Convert.ToString(dt.Rows[i][j]) + "\t");
                        }else{
                            wr.Write("\t");
                        }
                    }
                    wr.WriteLine();
                }
                wr.Close();
                ExportXls.Visible = true;
                Response.Redirect("doc/Libro1.xls");
                

            }
            catch (Exception ex){

            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        }

    }
}