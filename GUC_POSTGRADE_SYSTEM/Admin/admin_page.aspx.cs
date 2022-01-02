using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUC_POSTGRADE_SYSTEM.Admin
{
    public partial class admin_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"] == null || Session["type"].ToString() != "Admin")
            {
                Response.Redirect("/login_page.aspx");
            }
            if (!Session["user"].ToString().Equals("-1"))
            {
                email.Text = Session["user"].ToString();
            }
        }
    }
}