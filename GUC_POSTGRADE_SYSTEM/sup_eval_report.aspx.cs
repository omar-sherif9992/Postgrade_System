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
    public partial class sup_eval_report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OnSubmit(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand eval = new SqlCommand("EvaluateProgressReport", conn);
            eval.CommandType = System.Data.CommandType.StoredProcedure;
            string SSSNUM = ThesisSerialNumber.Text;
            string RRRPORT = Report.Text;
            string GGGRADE = grade.Text;
            if (SSSNUM == "" || RRRPORT == "" || GGGRADE == "")
            {
                se7s.Text = "All fields are Required";
                se7s.Attributes.CssStyle.Add("color", "red");
            }
            else
            {
                int thesisNum = Int32.Parse(SSSNUM);
                int reportNum = Int16.Parse(RRRPORT);
                int evaluation = Int16.Parse(GGGRADE);
                eval.Parameters.Add(new SqlParameter("@supervisorID", Session["id"]));
                eval.Parameters.Add(new SqlParameter("@thesisSerialNo", thesisNum));
                eval.Parameters.Add(new SqlParameter("@progressReportNo", reportNum));
                eval.Parameters.Add(new SqlParameter("@evaluation", evaluation));
                SqlParameter success = eval.Parameters.Add("@Success", System.Data.SqlDbType.Int);
                success.Direction = System.Data.ParameterDirection.Output;

                SqlCommand check = new SqlCommand("findThesisInSup", conn);
                check.CommandType = System.Data.CommandType.StoredProcedure;
                check.Parameters.Add(new SqlParameter("@ThesisSerialNumber", thesisNum));
                check.Parameters.Add(new SqlParameter("@SupID", Session["id"]));
                SqlParameter found = check.Parameters.Add(new SqlParameter("@Success", System.Data.SqlDbType.Int));
                found.Direction = System.Data.ParameterDirection.Output;

                conn.Open();
                check.ExecuteNonQuery();
                conn.Close();

                if (found.Value.ToString() == "0")
                {
                    se7s.Text = "Thesis is not Found under your Supervision";
                    se7s.Attributes.CssStyle.Add("color", "red");
                }
                else
                {
                    conn.Open();
                    eval.ExecuteNonQuery();
                    conn.Close();
                    if (success.Value.ToString() == "0")
                    {
                        se7s.Text = "The Thesis Doesn't Have progress report with this Number";
                        se7s.Attributes.CssStyle.Add("color", "red");
                    }
                    else
                    {
                        se7s.Text = "Evaluation is Added Successfully";
                        se7s.Attributes.CssStyle.Add("color", "green");
                    }
                }
            }
        }

        protected void OnHome(object sender, EventArgs e)
        {
            Response.Redirect("supervisor_page.aspx");
        }

        protected void Minus1(object sender, EventArgs e)
        {
            if (grade.Text != "0")
            {
                grade.Text = (Int16.Parse(grade.Text) - 1).ToString();
            }
        }

        protected void Plus1(object sender, EventArgs e)
        {
            if (grade.Text != "3")
            {
                grade.Text = (Int16.Parse(grade.Text) + 1).ToString();
            }
        }

    }
}