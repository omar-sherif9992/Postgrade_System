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
    public partial class all_thesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //try{
            String type = Session["type"].ToString();

            if (type.ToString().Equals("NonGucianStudent"))
            {

                courses.Attributes.CssStyle.Add("display", "visible");
            }

            String username = Session["user"].ToString();
            pageTitle.Text = "Thesises";

            TableHeaderRow tableHeaderRow = new TableHeaderRow();
            TableHeaderCell headerCell = new TableHeaderCell();
            headerCell.Text = "Serial Number";
            tableHeaderRow.Cells.Add(headerCell);
            headerCell = new TableHeaderCell();
            headerCell.Text = "Title";
            tableHeaderRow.Cells.Add(headerCell);
            headerCell = new TableHeaderCell();
            headerCell.Text = "Field";
            tableHeaderRow.Cells.Add(headerCell);
            headerCell = new TableHeaderCell();
            headerCell.Text = "Type";
            tableHeaderRow.Cells.Add(headerCell);

            headerCell = new TableHeaderCell();
            headerCell.Text = "Start Date";
            tableHeaderRow.Cells.Add(headerCell);
            headerCell = new TableHeaderCell();
            headerCell.Text = "End Date";
            tableHeaderRow.Cells.Add(headerCell);
            headerCell = new TableHeaderCell();
            headerCell.Text = "Defence Date";
            tableHeaderRow.Cells.Add(headerCell);
            headerCell = new TableHeaderCell();
            headerCell.Text = "Years";
            tableHeaderRow.Cells.Add(headerCell);
            headerCell = new TableHeaderCell();
            headerCell.Text = "grade";
            tableHeaderRow.Cells.Add(headerCell);
            headerCell = new TableHeaderCell();
            headerCell.Text = "No Of Extensions";
            tableHeaderRow.Cells.Add(headerCell);

            mainTable.Rows.Add(tableHeaderRow);




            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            //viewMyProfile
            int id = Int16.Parse(Session["id"].ToString());
            SqlCommand studentViewThesis = new SqlCommand("STUDENTVIEWTHESIS", conn);
            studentViewThesis.CommandType = CommandType.StoredProcedure;
            studentViewThesis.Parameters.Add(new SqlParameter("@SID", id));



            conn.Open();
            SqlDataReader rdr = studentViewThesis.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {

                TableRow tableRow = new TableRow();

                TableCell cell = new TableCell();
                cell.Text = "Not Specified";
                if (!rdr.IsDBNull(rdr.GetOrdinal("serialNumber")))
                {
                    Int32 serialNumberDB = rdr.GetInt32(rdr.GetOrdinal("serialNumber"));
                    cell.Text = serialNumberDB.ToString();
                }
                tableRow.Cells.Add(cell);


                cell = new TableCell();
                cell.Text = "Not Specified";
                if (!rdr.IsDBNull(rdr.GetOrdinal("title")))
                {
                    String titleDB = rdr.GetString(rdr.GetOrdinal("title"));
                    cell.Text = titleDB;
                }
                tableRow.Cells.Add(cell);

                cell = new TableCell();
                cell.Text = "Not Specified";
                if (!rdr.IsDBNull(rdr.GetOrdinal("field")))
                {
                    String fieldDB = rdr.GetString(rdr.GetOrdinal("field"));
                    cell.Text = fieldDB.ToString();
                }
                tableRow.Cells.Add(cell);

                cell = new TableCell();
                cell.Text = "Not Specified";
                if (!rdr.IsDBNull(rdr.GetOrdinal("type")))
                {
                    String typeDB = rdr.GetString(rdr.GetOrdinal("type"));
                    cell.Text = typeDB;
                }
                tableRow.Cells.Add(cell);

                cell = new TableCell();
                cell.Text = "Not Specified";
                if (!rdr.IsDBNull(rdr.GetOrdinal("startDate")))
                {
                    DateTime startDateDB = rdr.GetDateTime(rdr.GetOrdinal("startDate"));
                    cell.Text = startDateDB.ToString();
                }
                tableRow.Cells.Add(cell);


                cell = new TableCell();
                cell.Text = "Not Specified";
                if (!rdr.IsDBNull(rdr.GetOrdinal("endDate")))
                {

                    DateTime endDateDB = rdr.GetDateTime(rdr.GetOrdinal("endDate"));
                    cell.Text = endDateDB.ToString();
                }
                tableRow.Cells.Add(cell);



                cell = new TableCell();
                cell.Text = "Not Specified";
                if (!rdr.IsDBNull(rdr.GetOrdinal("defenceDate")))
                {
                    DateTime defenceDateDB = rdr.GetDateTime(rdr.GetOrdinal("defenceDate"));

                    cell.Text = defenceDateDB.ToString();
                }

                tableRow.Cells.Add(cell);


                cell = new TableCell();
                cell.Text = "Not Specified";
                if (!rdr.IsDBNull(rdr.GetOrdinal("years")))
                {
                    Int32 yearsDB = rdr.GetInt32(rdr.GetOrdinal("years"));
                    cell.Text = yearsDB.ToString();
                }
                tableRow.Cells.Add(cell);

                cell = new TableCell();
                cell.Text = "Not Specified";
                if (!rdr.IsDBNull(rdr.GetOrdinal("grade")))
                {
                    Decimal gradeDB = rdr.GetDecimal(rdr.GetOrdinal("grade"));

                    if (gradeDB.ToString().Equals("-1"))
                    {
                        cell.Text = "Not Specified";
                    }
                    else
                    {
                        cell.Text = gradeDB.ToString();
                    }
                }
                tableRow.Cells.Add(cell);


                cell = new TableCell();
                cell.Text = "Not Specified";
                if (!rdr.IsDBNull(rdr.GetOrdinal("noExtension")))
                {
                    Int32 noExtensionsDB = rdr.GetInt32(rdr.GetOrdinal("noExtension"));
                    cell.Text = noExtensionsDB.ToString();
                }
                tableRow.Cells.Add(cell);

                mainTable.Rows.Add(tableRow);




            }



            /*}
             catch(Exception ex){}*/


        }



    }
}