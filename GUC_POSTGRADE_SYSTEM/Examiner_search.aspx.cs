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
    public partial class Examiner_search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void search(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String title = searchT.Text;
            SqlCommand search_proc = new SqlCommand("SearchThesis", conn);
            search_proc.CommandType = CommandType.StoredProcedure;
            search_proc.Parameters.Add(new SqlParameter("@word", title));

            DataTable list1 = new DataTable();
            conn.Open();
            list1.Load(search_proc.ExecuteReader());

            conn.Close();
            SearchTable.DataSource = list1;
            SearchTable.DataBind();
        }
    }
}