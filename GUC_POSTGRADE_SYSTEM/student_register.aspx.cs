﻿using System;
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
    public partial class StudentRegister : System.Web.UI.Page
    {
        bool clicked = false;
        bool isGUC = false;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void NonGUC(object sender, EventArgs e)
        {
            string firstname = FirstName.Text;
            string secondname = SecondName.Text;
            string email = EMAIL.Text;
            string pass = Password.Text;
            string faculty = Faculty.Text;
            string address = Address.Text;

            if (firstname == "" || secondname == "" || email == "" || pass == "" || faculty == "" || address == "")
            {
                Response.Write("You Must Fill all the Information");
            }
            else
            {
                String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand register = new SqlCommand("StudentRegister", conn);
                register.CommandType = CommandType.StoredProcedure;
                register.Parameters.Add(new SqlParameter("@first_name", firstname));
                register.Parameters.Add(new SqlParameter("@last_name", secondname));
                register.Parameters.Add(new SqlParameter("@password", pass));
                register.Parameters.Add(new SqlParameter("@faculty", faculty));
                register.Parameters.Add(new SqlParameter("@email", email));
                register.Parameters.Add(new SqlParameter("@address", address));
                register.Parameters.Add(new SqlParameter("@Gucian", 1));

                conn.Open();
                register.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("login_page.aspx");
            }
        }

        protected void GucIan(object sender, EventArgs e)
        {
            string firstname = FirstName.Text;
            string secondname = SecondName.Text;
            string email = EMAIL.Text;
            string pass = Password.Text;
            string faculty = Faculty.Text;
            string address = Address.Text;

            if (firstname == "" || secondname == "" || email == "" || pass == "" || faculty == "" || address == "")
            {
                Response.Write("You Must Fill all the Information");
            }
            else
            {
                String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand register = new SqlCommand("StudentRegister", conn);
                register.CommandType = CommandType.StoredProcedure;
                register.Parameters.Add(new SqlParameter("@first_name", firstname));
                register.Parameters.Add(new SqlParameter("@last_name", secondname));
                register.Parameters.Add(new SqlParameter("@password", pass));
                register.Parameters.Add(new SqlParameter("@faculty", faculty));
                register.Parameters.Add(new SqlParameter("@email", email));
                register.Parameters.Add(new SqlParameter("@address", address));
                register.Parameters.Add(new SqlParameter("@Gucian", 1));

                conn.Open();
                register.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("login_page.aspx");
            }
        }
    }
}