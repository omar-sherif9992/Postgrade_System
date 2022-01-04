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
    public partial class Examiner_register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void non(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand login_proc = new SqlCommand("addExaminerSystem", conn);
            login_proc.CommandType = System.Data.CommandType.StoredProcedure;
            string ExName = name.Text;
            string fiel = fow.Text;
            string mail = email.Text;
            string password = pass.Text;
            login_proc.Parameters.Add(new SqlParameter("@email", mail));
            login_proc.Parameters.Add(new SqlParameter("@password", password));
            login_proc.Parameters.Add(new SqlParameter("@name", ExName));
            login_proc.Parameters.Add(new SqlParameter("@fieldofwork", fiel));
            login_proc.Parameters.Add(new SqlParameter("@isNational", 1));
            if (ExName == "" || fiel == "" || mail == "" || password == "")
            {
                error.Text = "You Have to Fill all the Information";
                error.Attributes.CssStyle.Add("color", "red");
            }
            else
            {
                SqlCommand findEmail = new SqlCommand("findEmail", conn);
                findEmail.CommandType = CommandType.StoredProcedure;
                findEmail.Parameters.Add(new SqlParameter("@email", mail));
                SqlParameter ff = findEmail.Parameters.Add(new SqlParameter("@f", SqlDbType.Int));
                ff.Direction = ParameterDirection.Output;
                conn.Open();
                findEmail.ExecuteNonQuery();
                conn.Close();
                if (ff.Value.ToString() == "0")
                {
                    error.Text = "This Email is Already Taken.Choose another One";
                    error.Attributes.CssStyle.Add("color", "red");
                }
                else
                {
                    conn.Open();
                    login_proc.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("login_page.aspx");
                }
            }
        }

        protected void National(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand login_proc = new SqlCommand("addExaminerSystem", conn);
            login_proc.CommandType = System.Data.CommandType.StoredProcedure;
            string ExName = name.Text;
            string fiel = fow.Text;
            string mail = email.Text;
            string password = pass.Text;
            login_proc.Parameters.Add(new SqlParameter("@email", mail));
            login_proc.Parameters.Add(new SqlParameter("@password", password));
            login_proc.Parameters.Add(new SqlParameter("@name", ExName));
            login_proc.Parameters.Add(new SqlParameter("@fieldofwork", fiel));
            login_proc.Parameters.Add(new SqlParameter("@isNational", 1));
            if (ExName == "" || fiel == "" || mail == "" || password == "")
            {
                error.Text = "You Have to Fill all the Information";
                error.Attributes.CssStyle.Add("color", "red");
            }
            else
            {

                SqlCommand findEmail = new SqlCommand("findEmail", conn);
                findEmail.CommandType = CommandType.StoredProcedure;
                findEmail.Parameters.Add(new SqlParameter("@email", mail));
                SqlParameter ff = findEmail.Parameters.Add(new SqlParameter("@f", SqlDbType.Int));
                ff.Direction = ParameterDirection.Output;
                conn.Open();
                findEmail.ExecuteNonQuery();
                conn.Close();
                if (ff.Value.ToString() == "0")
                {
                    error.Text = "This Email is Already Taken.Choose another One";
                    error.Attributes.CssStyle.Add("color", "red");
                }
                else
                {
                    conn.Open();
                    login_proc.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("login_page.aspx");
                }
            }
        }

    }
}