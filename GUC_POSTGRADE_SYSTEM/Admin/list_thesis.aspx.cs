using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUC_POSTGRADE_SYSTEM.Admin
{
    public partial class list_thesis : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"] == null || Session["type"].ToString() != "Admin")
            {
                Response.Redirect("/login_page.aspx");
            }
            thesisGrid.DataSource = DbFunctions.GetAllTheses();
            thesisGrid.DataBind();
            thesesCount.Text = "On Going Theses: " + DbFunctions.GetOnGoingTheses();
            
        }
    }
}