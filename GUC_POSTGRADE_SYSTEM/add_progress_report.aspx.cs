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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String type = Session["type"].ToString();

            if (type.ToString().Equals("NonGucianStudent"))
            {

                courses.Attributes.CssStyle.Add("display", "visible");


            }
        }

        protected void addProgressReport(object sender, EventArgs e)
        {
            DateTime date = addDate.SelectedDate;
            DateTime today=DateTime.Now;
            if (DateTime.Compare(date,today)<0) {
                addMessage.Attributes.CssStyle.Add("display", "visible");
                addMessage.Attributes.CssStyle.Add("color", "red");
                addMessage.Text = "Incorrect Date , choose another Present or Future date";
                return;
            }

            int ssn=Int16.Parse(addThesis.Text);

            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand login_proc = new SqlCommand("AddProgressReport", conn);
            login_proc.CommandType = CommandType.StoredProcedure;
            login_proc.Parameters.Add(new SqlParameter("@thesisSerialNo", ssn));
            login_proc.Parameters.Add(new SqlParameter("@progressReportDate", date));

            SqlParameter success = login_proc.Parameters.Add("@Success_bit", SqlDbType.Int);
            SqlParameter prg_num = login_proc.Parameters.Add("@progress_num", SqlDbType.Int);

            success.Direction = System.Data.ParameterDirection.Output;
            prg_num.Direction = System.Data.ParameterDirection.Output;
            
   


            conn.Open();
            login_proc.ExecuteNonQuery();
            conn.Close();
  
            if (success.Value.ToString() == "1")
            {
                addMessage.Attributes.CssStyle.Add("display", "visible");
                addMessage.Attributes.CssStyle.Add("color", "green");
                addMessage.Text = "Successfully added the Progress Report "+prg_num.Value.ToString()+" to Thesis with serial number "+ssn;


            }
            else
            {
                addMessage.Attributes.CssStyle.Add("display", "visible");
                addMessage.Attributes.CssStyle.Add("color", "red");
                addMessage.Text = "Incorrect Thesis Serial Number";

            }




        }


        protected void fillProgressReport(object sender, EventArgs e)
        {
            try
            {
                int thesis_ssn = Int16.Parse(fillThesis.Text);
                int state = Int16.Parse(fillState.Text);
                String description = fillDescription.Text;
                int progress_number = Int16.Parse(fillProgress.Text);


            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand login_proc = new SqlCommand("FillProgressReport", conn);
            login_proc.CommandType = CommandType.StoredProcedure;
            login_proc.Parameters.Add(new SqlParameter("@thesisSerialNo", thesis_ssn));
            login_proc.Parameters.Add(new SqlParameter("@progressReportNo", progress_number));
            login_proc.Parameters.Add(new SqlParameter("@state", state));
            login_proc.Parameters.Add(new SqlParameter("@description", description));


            SqlParameter success = login_proc.Parameters.Add("@Success_bit", SqlDbType.Int);
                success.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            login_proc.ExecuteNonQuery();
            conn.Close();

            if (success.Value.ToString() == "1")
            {
                fillMessage.Attributes.CssStyle.Add("display", "visible");
                fillMessage.Attributes.CssStyle.Add("color", "green");
                fillMessage.Text = "Successfully filled Progress Report number " + progress_number.ToString() + " of Thesis with Serial Number " + thesis_ssn;
            }
            else
            {
                fillMessage.Attributes.CssStyle.Add("display", "visible");
                fillMessage.Attributes.CssStyle.Add("color", "red");
                fillMessage.Text = "Incorrect Thesis Serial Number/Progress Report";
            }


        }

            catch (Exception ex)
            {
                fillMessage.Attributes.CssStyle.Add("display", "visible");
                fillMessage.Attributes.CssStyle.Add("color", "red");
                fillMessage.Text = "Incorrect Information Supplied";
                return;
            }


        }
    }
}