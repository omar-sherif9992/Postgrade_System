using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUC_POSTGRADE_SYSTEM
{
    public partial class add_mobile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["type"] == null || (Session["type"].ToString() != "GucianStudent" && Session["type"].ToString() != "NonGucianStudent"))
            {
                Response.Redirect("/login_page.aspx");
            }
        }
        protected void AddMobileNumber(object sender, EventArgs e)
        {
            int sid = Int32.Parse(Session["id"].ToString());
            String mobileNum = mobileNumber.Text;
            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand addMobile_proc = new SqlCommand("addMobile", conn);
            addMobile_proc.CommandType = CommandType.StoredProcedure;

            addMobile_proc.Parameters.Add(new SqlParameter("@ID", sid));
            addMobile_proc.Parameters.Add(new SqlParameter("@mobile_number", mobileNum));

            SqlParameter success = addMobile_proc.Parameters.Add("@Success_bit", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            conn.Open();
            addMobile_proc.ExecuteNonQuery();
            failM.Visible = false;
            succ.Visible = false;
            failI.Visible = false;
            if((int)success.Value == 0)
            {
                failM.Visible = true;
            }
            else if((int)success.Value == 1)
            {
                succ.Visible = true;
            }
            else
            {
                failI.Visible = true;
            }
        }
    }
}