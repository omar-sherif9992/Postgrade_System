using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUC_POSTGRADE_SYSTEM
{
    public partial class supervisor_register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void registerSup(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand reg = new SqlCommand("SupervisorRegister", conn);
            reg.CommandType = System.Data.CommandType.StoredProcedure;
            string firstname = FirstName.Text;
            string secondname = SecondName.Text;
            string email = EMAIL.Text;
            string pass = Password.Text;
            string fac = Faculty.Text;
            if (firstname == "" || secondname == "" || email == "" || pass == "" || fac == "")
            {
                Response.Write("You must fill all the information");
            }
            else
            {
                reg.Parameters.Add(new SqlParameter("@first_name", firstname));
                reg.Parameters.Add(new SqlParameter("@last_name", secondname));
                reg.Parameters.Add(new SqlParameter("@password", pass));
                reg.Parameters.Add(new SqlParameter("@faculty", fac));
                reg.Parameters.Add(new SqlParameter("@email", email));
                conn.Open();
                reg.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("login_page.aspx");
            }
        }
    }
}