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
            if (Session["type"] == null || (Session["type"] != "GucianStudent" && Session["type"] != "NonGucianStudent"))
            {
                return;
            }
            Response.Redirect("/login_page.aspx");
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

            SqlParameter successM = addMobile_proc.Parameters.Add("@Success_bitM", SqlDbType.Bit);
            SqlParameter successI = addMobile_proc.Parameters.Add("@Success_bitI", SqlDbType.Bit);
            successM.Direction = ParameterDirection.Output;
            successI.Direction = ParameterDirection.Output;
            conn.Open();
            addMobile_proc.ExecuteNonQuery();
            succ.Visible = (bool)successM.Value && (bool)successI.Value;
            failM.Visible = !(bool)successM.Value && (bool)successI.Value;
            failI.Visible = (bool)successM.Value && !(bool)successI.Value;
        }
    }
}