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
    public partial class all_courses : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            //ViewCoursesGrades
            String type =Session["type"].ToString();
            if (type == "NonGucianStudent")
            {
                String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                int id = Int16.Parse(Session["id"].ToString());


                SqlCommand courses = new SqlCommand("ViewCoursesGrades", conn);
                courses.CommandType = CommandType.StoredProcedure;
                conn.Open();
                SqlDataReader rdr = courses.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    String courseCode = rdr.GetString(rdr.GetOrdinal("Course_Code"));
                    String courseGrade = rdr.GetString(rdr.GetOrdinal("Grade"));
                    Label label = new Label();
                    label.Text = courseCode;
                    label.Text = courseGrade;
                    courseForm.Controls.Add(label);

                }




            }

        }
    }
}