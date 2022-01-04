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
    public partial class all_login_page : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();


        }
        protected void login(object sender, EventArgs e)
        {
            try
            {
                String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                String username = email.Text;
                String pass = password.Text;

                if (username.Length < 1)
                {

                    userDoesnotExist.Attributes.CssStyle.Add("display", "visible");
                    userDoesnotExist.Text = "Please Enter Your Username !!";

                    return;
                }
                else if (pass.Length < 1)
                {
                    userDoesnotExist.Attributes.CssStyle.Add("display", "visible");
                    userDoesnotExist.Text = "Please Enter Your Password !!";


                    return;
                }



                SqlCommand login_proc = new SqlCommand("userLogin", conn);
                login_proc.CommandType = CommandType.StoredProcedure;
                login_proc.Parameters.Add(new SqlParameter("@email", username));
                login_proc.Parameters.Add(new SqlParameter("@password", pass));

                SqlParameter success = login_proc.Parameters.Add("@Success_bit", SqlDbType.Int);
                SqlParameter id = login_proc.Parameters.Add("@id", SqlDbType.Int);

                SqlParameter type = login_proc.Parameters.Add("@TYPE", SqlDbType.VarChar, 40);
                success.Direction = System.Data.ParameterDirection.Output;
                id.Direction = System.Data.ParameterDirection.Output;
                type.Direction = System.Data.ParameterDirection.Output;

                conn.Open();
                login_proc.ExecuteNonQuery();
                conn.Close();
                if (success.Value.ToString() == "1")
                {
                    Session["user"] = username;
                    Session["type"] = type.Value.ToString();
                    Session["id"] = Int16.Parse(id.Value.ToString());

                }

                if (success.Value.ToString() == "1" && type.Value.ToString() == "Admin")
                {
                    Response.Redirect("Admin/admin_page.aspx");

                }
                else if (success.Value.ToString() == "1" && type.Value.ToString() == "Supervisor")
                {
                    Response.Redirect("supervisor_page.aspx");
                }
                else if (success.Value.ToString() == "1" && type.Value.ToString() == "GucianStudent")
                {
                    Response.Redirect("student_profile.aspx");
                }
                else if (success.Value.ToString() == "1" && type.Value.ToString() == "NonGucianStudent")
                {
                    Response.Redirect("student_profile.aspx");
                }
                else if (success.Value.ToString() == "1" && type.Value.ToString() == "Examiner")
                {
                    Response.Redirect("Examiner_page.aspx");

                }
                else
                {

                    userDoesnotExist.Attributes.CssStyle.Add("display", "visible");

                    userDoesnotExist.Text = "Incorrect Username/Password";
                }
            }
            catch (Exception ex)
            {
                userDoesnotExist.Attributes.CssStyle.Add("display", "visible");


            }

        }

        protected void StudentRegister(object sender, EventArgs e)
        {
            Response.Redirect("student_register.aspx");
        }

        protected void SupervisorRegister(object sender, EventArgs e)
        {
            Response.Redirect("supervisor_register.aspx");
        }

        protected void ExaminerRegister(object sender, EventArgs e)
        {
            Response.Redirect("Examiner_register.aspx");
        }


    }
}