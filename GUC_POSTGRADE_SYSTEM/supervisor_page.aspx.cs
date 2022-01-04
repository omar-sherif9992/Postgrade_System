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
    public partial class supervisor_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Label name = new Label();
            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand vw = new SqlCommand("SupViewProfile", conn);
            vw.CommandType = System.Data.CommandType.StoredProcedure;
            vw.Parameters.Add(new SqlParameter("@supervisorID", (Session["id"])));
            conn.Open();
            SqlDataReader rdr = vw.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                int id = rdr.GetInt32(rdr.GetOrdinal("id"));
                string name = rdr.GetString(rdr.GetOrdinal("name"));
                string faculty = rdr.GetString(rdr.GetOrdinal("faculty"));
                id1.Text = id.ToString();
                name1.Text = name;
                faculty1.Text = faculty;
            }
        }

        
    }
}