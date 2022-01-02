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
        protected void addMobile(object sender, EventArgs e)
        {
            Response.Redirect("add_mobile.aspx");
        }

        protected void viewCourses(object sender, EventArgs e)
        {
            Response.Redirect("student_courses.aspx");
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            String type = Session["type"].ToString();

            if (type.ToString().Equals("NonGucianStudent"))
            {

                courses.Attributes.CssStyle.Add("display", "visible");


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

                Decimal GPADB = 0;
                if (!rdr.IsDBNull(rdr.GetOrdinal("GPA")))
                {
                    GPADB = rdr.GetDecimal(rdr.GetOrdinal("GPA"));
                    gpa.Text = GPADB.ToString();

                }
                else
                {

                    gpa.Text = "Not Specified";

                }
                String typeDP = "Not Specified";


                if (!rdr.IsDBNull(rdr.GetOrdinal("type")))
                {
                    typeDP = rdr.GetString(rdr.GetOrdinal("type"));
                    typeCell.Text = typeDP.ToString();


                }
                fname.Text = "Not Specified";
                if (!rdr.IsDBNull(rdr.GetOrdinal("firstName")))
                {
                    String firstNameDB = rdr.GetString(rdr.GetOrdinal("firstName"));
                    fname.Text = firstNameDB.ToString();

                }
                lname.Text = "Not Specified";
                if (!rdr.IsDBNull(rdr.GetOrdinal("lastName")))
                {
                    String lastNameDB = rdr.GetString(rdr.GetOrdinal("lastName"));
                    lname.Text = lastNameDB.ToString();

                }
                faculty.Text = "Not Specified";
                if (!rdr.IsDBNull(rdr.GetOrdinal("faculty")))
                {
                    String facultyDB = rdr.GetString(rdr.GetOrdinal("faculty"));
                    faculty.Text = facultyDB.ToString();

                }
                address.Text = "Not Specified";
                if (!rdr.IsDBNull(rdr.GetOrdinal("address")))
                {
                    String addressDB = rdr.GetString(rdr.GetOrdinal("address"));
                    address.Text = addressDB.ToString();
                }


                idk.Text = id.ToString();




                if (type.ToString().Equals("GucianStudent"))
                {
                    underGradeIDRow.Attributes.CssStyle.Add("display", "visible");

                    String undergradID = "Not Specified";

                    if (!rdr.IsDBNull(rdr.GetOrdinal("undergradID")))
                    {
                        undergradID = rdr.GetString(rdr.GetOrdinal("undergradID"));
                        underGradeID.Text = undergradID.ToString();

                    }


                }





            }


        }
    }



}