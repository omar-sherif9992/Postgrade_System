using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUC_POSTGRADE_SYSTEM.Admin
{
    public partial class update_number_of_extensions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"] == null || Session["type"].ToString() != "Admin")
            {
                Response.Redirect("/login_page.aspx");
            }
        }

        protected void UpdateNumberOfExtensions(object sender,EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            int serialNumber = Int32.Parse(serialNo.Text);

            bool success = DbFunctions.UpdateNumberOfExtensions(serialNumber);

            succ.Visible = success;
            fail.Visible = !success;
        }
    }
}