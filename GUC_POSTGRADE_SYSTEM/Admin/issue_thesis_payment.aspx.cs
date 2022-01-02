using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUC_POSTGRADE_SYSTEM.Admin
{
    public partial class issue_thesis_payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"] == null || Session["type"].ToString() != "Admin")
            {
                Response.Redirect("/login_page.aspx");
            }
        }
        public void SubmitButtonClicked(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            int serialNumber = Int32.Parse(serialNo.Text);
            decimal amount = Decimal.Parse(amnt.Text);
            int installments = Int32.Parse(noInstallments.Text);
            decimal fundPercentage = Decimal.Parse(fundPerc.Text);


            bool success = DbFunctions.IssueThesisPayment(serialNumber, amount, installments, fundPercentage);

            succ.Visible = success;
            fail.Visible = !success;
            //FormPanel.Visible = false;
        }
    }
}