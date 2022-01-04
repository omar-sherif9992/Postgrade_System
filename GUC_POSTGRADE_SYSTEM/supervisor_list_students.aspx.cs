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
    public partial class supervisor_list_students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand list = new SqlCommand("ViewSupStudentsYears", conn);
            list.CommandType = System.Data.CommandType.StoredProcedure;
            list.Parameters.Add(new SqlParameter("@supervisorID", Session["id"]));
            conn.Open();
            SqlDataReader rdr = list.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string name = rdr.GetString(rdr.GetOrdinal("Student Name"));
                int years = rdr.GetInt32(rdr.GetOrdinal("years spent"));
                Label x = new Label();
                Label y = new Label();
                x.Text = name;
                y.Text = years.ToString();
                TableRow tr = new TableRow();
                Table1.Controls.Add(tr);
                TableCell tcName = new TableCell();
                tcName.Text = name;
                TableCell tcyears = new TableCell();
                tcyears.Text = years.ToString();
                tcName.Attributes.CssStyle.Add("border", "2px solid black");
                tcName.Attributes.CssStyle.Add("padding", "10px");
                tcName.Attributes.CssStyle.Add("text-align", "left");
                tcyears.Attributes.CssStyle.Add("border", "2px solid black");
                tcyears.Attributes.CssStyle.Add("padding", "10px");
                tcyears.Attributes.CssStyle.Add("text-align", "left");
                tcyears.Attributes.CssStyle.Add("position", "center");
                tcyears.Attributes.CssStyle.Add("margin", "auto");
                tcName.Attributes.CssStyle.Add("position", "center");
                tcName.Attributes.CssStyle.Add("margin", "auto");
                tr.Controls.Add(tcName);
                tr.Controls.Add(tcyears);
            }
        }

    }
}