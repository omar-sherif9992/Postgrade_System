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
            if (Session["type"] == null) {
                Response.Redirect("login_page.aspx");
            }

            String type = Session["type"].ToString();
            if (type == "NonGucianStudent")
            {

                courses1.Attributes.CssStyle.Add("display", "visible");




                pageTitle.Text = "Courses";

                String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                int id = Int16.Parse(Session["id"].ToString());

                TableHeaderRow tableHeaderRow = new TableHeaderRow();

                TableHeaderCell headerCell = new TableHeaderCell();
                headerCell.Text = "Course Code";
                tableHeaderRow.Cells.Add(headerCell);

                headerCell = new TableHeaderCell();
                headerCell.Text = "Grade";
                tableHeaderRow.Cells.Add(headerCell);


                headerCell = new TableHeaderCell();
                headerCell.Text = "Course Credit Hours";
                tableHeaderRow.Cells.Add(headerCell);

                mainTable.Rows.Add(tableHeaderRow);





                SqlCommand courses = new SqlCommand("ViewCoursesGrades", conn);
                courses.CommandType = CommandType.StoredProcedure;
                courses.Parameters.Add(new SqlParameter("@studentID", id));
                conn.Open();
                SqlDataReader rdr = courses.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {

                    TableRow tableRow = new TableRow();

                    TableCell cell = new TableCell();

                    cell.Text = "Not Specified";
                    if (!rdr.IsDBNull(rdr.GetOrdinal("Course_Code")))
                    {
                        String courseCode = rdr.GetString(rdr.GetOrdinal("Course_Code"));
                        cell.Text = courseCode.ToString();
                    }
                    tableRow.Cells.Add(cell);



                    cell = new TableCell();
                    if (!rdr.IsDBNull(rdr.GetOrdinal("Grade")))
                    {
                        Decimal courseGrade = rdr.GetDecimal(rdr.GetOrdinal("Grade"));

                        if (courseGrade.ToString().Equals("-1"))
                        {
                            cell.Text = "Not Specified";
                        }
                        else
                        {
                            cell.Text = courseGrade.ToString();

                        }

                    }
                    else
                    {
                        cell.Text = "Not Specified";

                    }

                    tableRow.Cells.Add(cell);



                    cell = new TableCell();
                    cell.Text = "Not Specified";
                    if (!rdr.IsDBNull(rdr.GetOrdinal("creditHours")))
                    {
                        Int32 creditHours = rdr.GetInt32(rdr.GetOrdinal("creditHours"));
                        cell.Text = creditHours.ToString();
                    }
                    tableRow.Cells.Add(cell);

                    mainTable.Rows.Add(tableRow);


                }




            }

        }
    }
}