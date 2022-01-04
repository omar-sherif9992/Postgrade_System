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
            try{
            DateTime date = addDate.SelectedDate;
            DateTime today = DateTime.Now;
            if (DateTime.Compare(date, today) < 0)
            {
                addMessage.Attributes.CssStyle.Add("display", "visible");
                addMessage.Attributes.CssStyle.Add("color", "red");
                addMessage.Text = "Incorrect Date , choose another Present or Future date";
                return;
            }
            String serialText = addThesis.Text;
            int ssn;
            if (serialText.Length == 0)
            {
                addMessage.Attributes.CssStyle.Add("display", "visible");
                addMessage.Attributes.CssStyle.Add("color", "red");
                addMessage.Text = "Serial Number is Missing !";
                return;
            }
            try
            {
                ssn = Int16.Parse(addThesis.Text);
            }
            catch (Exception ex)
            {
                addMessage.Attributes.CssStyle.Add("display", "visible");
                addMessage.Attributes.CssStyle.Add("color", "red");
                addMessage.Text = "Serial Number is Missing !";
                return;
            }

            int id = Int16.Parse(Session["id"].ToString());

            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand login_proc = new SqlCommand("AddProgressReport", conn);
            login_proc.CommandType = CommandType.StoredProcedure;
            login_proc.Parameters.Add(new SqlParameter("@thesisSerialNo", ssn));
            login_proc.Parameters.Add(new SqlParameter("@progressReportDate", date));
            login_proc.Parameters.Add(new SqlParameter("@StdID", id));


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
                addMessage.Text = "Successfully added the Progress Report " + prg_num.Value.ToString() + " to Thesis with serial number " + ssn;


            }
            else if (success.Value.ToString() == "0")
            {
                addMessage.Attributes.CssStyle.Add("display", "visible");
                addMessage.Attributes.CssStyle.Add("color", "red");
                addMessage.Text = "This Thesis is not an ongoing Thesis";
            }
            else if (success.Value.ToString() == "-1")
            {
                addMessage.Attributes.CssStyle.Add("display", "visible");
                addMessage.Attributes.CssStyle.Add("color", "red");
                addMessage.Text = "Incorrect Thesis Serial Number";
            }
            else
            {
                addMessage.Attributes.CssStyle.Add("display", "visible");
                addMessage.Attributes.CssStyle.Add("color", "red");
                addMessage.Text = "Incorrect Thesis Serial Number";

            }


             }

                       catch (Exception ex)
                       {
                           addMessage.Attributes.CssStyle.Add("display", "visible");
                           addMessage.Attributes.CssStyle.Add("color", "red");
                           addMessage.Text = "Incorrect Information Supplied";
                           return;
                       }
                
        }


        protected void fillProgressReport(object sender, EventArgs e)
        {
             try
                {
            if (fillThesis.Text.Length == 0)
            {
                fillMessage.Attributes.CssStyle.Add("display", "visible");
                fillMessage.Attributes.CssStyle.Add("color", "red");
                fillMessage.Text = "Thesis Serial Number is Missing !!";
                return;
            }
            else if (fillState.Text.Length == 0)
            {
                fillMessage.Attributes.CssStyle.Add("display", "visible");
                fillMessage.Attributes.CssStyle.Add("color", "red");
                fillMessage.Text = "State is Missing !!";
                return;
            }
            else if (fillDescription.Text.Length == 0)
            {
                fillMessage.Attributes.CssStyle.Add("display", "visible");
                fillMessage.Attributes.CssStyle.Add("color", "red");
                fillMessage.Text = "Description is Missing !!";
                return;
            }
            else if (fillProgress.Text.Length == 0)
            {
                fillMessage.Attributes.CssStyle.Add("display", "visible");
                fillMessage.Attributes.CssStyle.Add("color", "red");
                fillMessage.Text = "Progress Number is Missing !!";
                return;
            }
            int thesis_ssn = Int16.Parse(fillThesis.Text);


            int state = Int16.Parse(fillState.Text);
            String description = fillDescription.Text;
            int progress_number = Int16.Parse(fillProgress.Text);

            int id = Int16.Parse(Session["id"].ToString());

            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand login_proc = new SqlCommand("FillProgressReport", conn);
            login_proc.CommandType = CommandType.StoredProcedure;
            login_proc.Parameters.Add(new SqlParameter("@thesisSerialNo", thesis_ssn));
            login_proc.Parameters.Add(new SqlParameter("@progressReportNo", progress_number));
            login_proc.Parameters.Add(new SqlParameter("@state", state));
            login_proc.Parameters.Add(new SqlParameter("@description", description));
            login_proc.Parameters.Add(new SqlParameter("@sid", id));



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
            else if (success.Value.ToString() == "-1")
            {
                fillMessage.Attributes.CssStyle.Add("display", "visible");
                fillMessage.Attributes.CssStyle.Add("color", "red");
                fillMessage.Text = "This Thesis Progress Report is outdated cause the Thesis duration ended";
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