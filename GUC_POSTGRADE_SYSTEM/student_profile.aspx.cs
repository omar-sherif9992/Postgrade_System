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
    public partial class student_profile : System.Web.UI.Page
    {
        protected void viewThesis(object sender, EventArgs e)
        {
            Response.Redirect("student_thesis.aspx");


        }

        protected void addPublication(object sender, EventArgs e)
        {
            Response.Redirect("add_publication.aspx");
                
        }


        protected void addProgress(object sender, EventArgs e)
        {
            Response.Redirect("add_progress_report.aspx");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            String type = Session["type"].ToString();
            if (type.Equals( "NonGucianStudent"))
            {
                Button b = new Button();
                b.Text = "View Courses";

            }
                String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                //viewMyProfile
                int id = Int16.Parse(Session["id"].ToString());
            SqlCommand profile = new SqlCommand("viewMyProfile", conn);
                profile.CommandType = CommandType.StoredProcedure;
                profile.Parameters.Add(new SqlParameter("@studentId", id));
            conn.Open();
            SqlDataReader rdr = profile.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                Label label = new Label();

                String firstName = rdr.GetString(rdr.GetOrdinal("firstName"));
                String lastName = rdr.GetString(rdr.GetOrdinal("lastName"));
                String careerType = rdr.GetString(rdr.GetOrdinal("type"));
                String faculty = rdr.GetString(rdr.GetOrdinal("faculty"));
                String address = rdr.GetString(rdr.GetOrdinal("address"));
                String GPA = rdr.GetString(rdr.GetOrdinal("address"));
                if (type.Equals("GucianStudent"))
                {
                    String undergradID = rdr.GetString(rdr.GetOrdinal("undergradID"));
                    label.Text = undergradID;
                }



                //label.Attributes["class"]=""
                label.Text = firstName;
                label.Text = lastName;
                
                profileForm.Controls.Add(label);


            }


        }
    }



}