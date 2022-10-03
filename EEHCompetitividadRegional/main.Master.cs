using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EEHCompetitividadRegional
{
    public partial class main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Convert.ToBoolean(Session["PRI"]))
                Response.Redirect("/login.aspx");


            if (Convert.ToInt32(Session["PRI"]) == 1)
                LitMenu.Visible = true;
          
        }
    }
}