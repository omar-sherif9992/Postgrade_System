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
            while(rdr.Read())
            {
                string name = rdr.GetString(rdr.GetOrdinal("Student Name"));
                int years = rdr.GetInt32(rdr.GetOrdinal("years spent"));
                Label x = new Label();
                Label y = new Label();
                x.Text = name;
                y.Text = years.ToString();
                form1.Controls.Add(x);
                form1.Controls.Add(y);
            }
        }

    }
}