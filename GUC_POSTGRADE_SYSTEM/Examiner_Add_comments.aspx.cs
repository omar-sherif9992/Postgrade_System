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
    public partial class Examiner_Add_comments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void AddComments(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int ThesisSerialNo = Int32.Parse(serialnumber.Text);
            DateTime defensedate = date.SelectedDate;
            String comments = newComment.Text;
            SqlCommand AddComment_proc = new SqlCommand("AddCommentsGrade", conn);

            AddComment_proc.CommandType = CommandType.StoredProcedure;
            AddComment_proc.Parameters.Add(new SqlParameter("@comments", comments));
            AddComment_proc.Parameters.Add(new SqlParameter("@ThesisSerialNo", ThesisSerialNo));
            AddComment_proc.Parameters.Add(new SqlParameter("@DefenseDate", defensedate));


            SqlParameter succ1 = AddComment_proc.Parameters.Add("@success1", SqlDbType.Bit);
            SqlParameter succ2 = AddComment_proc.Parameters.Add("@success2", SqlDbType.Bit);
            succ1.Direction = ParameterDirection.Output;
            succ2.Direction = ParameterDirection.Output;

            conn.Open();
            AddComment_proc.ExecuteNonQuery();
            conn.Close();
            Label1.Visible = (bool)succ1.Value & (bool)succ2.Value;
            Label2.Visible = !((bool)succ1.Value & (bool)succ2.Value);





        }
    }
}