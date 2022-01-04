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
    public partial class Examiner_List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int Eid = Int32.Parse(Session["id"].ToString());
            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand List = new SqlCommand("ListAll", conn);
            List.CommandType = CommandType.StoredProcedure;
            List.Parameters.Add(new SqlParameter("@ExaminerID", Eid));





            DataTable list = new DataTable();

            conn.Open();
            list.Load(List.ExecuteReader());
            conn.Close();
            ListTable.DataSource = list;
            ListTable.DataBind();


        }
    }
}