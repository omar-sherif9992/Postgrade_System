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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String type = Session["type"].ToString();

            if (type.ToString().Equals("NonGucianStudent"))
            {

                courses1.Attributes.CssStyle.Add("display", "visible");
            }

            String username = Session["user"].ToString();

            TableHeaderRow tableHeaderRow = new TableHeaderRow();
            TableHeaderCell headerCell = new TableHeaderCell();
            headerCell.Text = "My Phone Numbers";
            tableHeaderRow.Cells.Add(headerCell);
          
            mainTable.Rows.Add(tableHeaderRow);



            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            //viewMyProfile
            int id = Int16.Parse(Session["id"].ToString());
            SqlCommand studentViewThesis = new SqlCommand("ViewMyPhone", conn);
            studentViewThesis.CommandType = CommandType.StoredProcedure;
            studentViewThesis.Parameters.Add(new SqlParameter("@Sid", id));



            conn.Open();
            SqlDataReader rdr = studentViewThesis.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {

                TableRow tableRow = new TableRow();

                TableCell cell = new TableCell();
                if (!rdr.IsDBNull(rdr.GetOrdinal("phone"))) {

                    String serialNumberDB = rdr.GetString(rdr.GetOrdinal("phone")); ;
                    cell.Text = serialNumberDB.ToString();
                    tableRow.Cells.Add(cell);
                }
                else {
                    cell.Text ="Not Specified";
                    tableRow.Cells.Add(cell);
                }

                mainTable.Rows.Add(tableRow);


            }


        }
        }
}