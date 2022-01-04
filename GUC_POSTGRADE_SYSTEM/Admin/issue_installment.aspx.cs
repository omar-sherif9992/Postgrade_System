using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUC_POSTGRADE_SYSTEM.Admin
{
    public partial class issue_installment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"] == null || Session["type"].ToString() != "Admin")
            {
                Response.Redirect("/login_page.aspx");
            }
            if (!Page.IsPostBack)
            {
                date.SelectedDate = DateTime.Today;
            }
        }

        protected void IssueInstallments(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            int paymentID = Int32.Parse(paymentId.Text);
            DateTime startDate = date.SelectedDate;

            bool success = DbFunctions.IssueInstallments(paymentID, startDate);

            succ.Visible = success;
            fail.Visible = !success;
        }
    }
}