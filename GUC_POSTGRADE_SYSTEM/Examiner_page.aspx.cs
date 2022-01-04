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
    public partial class Examiner_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {




        }




        protected void Edit(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String name = newName.Text;
            String Fieldofwork = newFieldOfWork.Text;
            int examinerID = Int32.Parse(Session["id"].ToString());


            SqlCommand Edit_proc = new SqlCommand("Update_Examiner", conn);
            Edit_proc.CommandType = CommandType.StoredProcedure;
            Edit_proc.Parameters.Add(new SqlParameter("@ExaminerName", name));
            Edit_proc.Parameters.Add(new SqlParameter("@fieldOfWork", Fieldofwork));
            Edit_proc.Parameters.Add(new SqlParameter("@ExaminerID", examinerID));

            SqlParameter succ = Edit_proc.Parameters.Add("@success", SqlDbType.Bit);

            succ.Direction = ParameterDirection.Output;



            conn.Open();
            Edit_proc.ExecuteNonQuery();

            conn.Close();

            Success.Visible = (bool)succ.Value;

            Fail.Visible = !(bool)succ.Value;




        }
    }
}