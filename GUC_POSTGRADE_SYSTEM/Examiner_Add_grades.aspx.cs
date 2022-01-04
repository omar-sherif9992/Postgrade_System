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
    public partial class Examiner_Add_grades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void AddGrade(object sender, EventArgs e)

        {
            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int ThesisSerialNo = Int32.Parse(serialnumber.Text);
            DateTime defensedate = date.SelectedDate;
            int newgrade = Int32.Parse(newGrade.Text);
            SqlCommand AddGrade_proc = new SqlCommand("AddDefenseGrade", conn);

            AddGrade_proc.CommandType = CommandType.StoredProcedure;
            AddGrade_proc.Parameters.Add(new SqlParameter("@grade", newgrade));
            AddGrade_proc.Parameters.Add(new SqlParameter("@ThesisSerialNo", ThesisSerialNo));
            AddGrade_proc.Parameters.Add(new SqlParameter("@DefenseDate", defensedate));


            SqlParameter succ1 = AddGrade_proc.Parameters.Add("@success1", SqlDbType.Bit);
            SqlParameter succ2 = AddGrade_proc.Parameters.Add("@success2", SqlDbType.Bit);
            succ1.Direction = ParameterDirection.Output;
            succ2.Direction = ParameterDirection.Output;
            conn.Open();
            AddGrade_proc.ExecuteNonQuery();
            conn.Close();


            Label1.Visible = (bool)succ1.Value & (bool)succ2.Value;
            Label2.Visible = !((bool)succ1.Value & (bool)succ2.Value);





        }




    }
}