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
    public partial class sup_cancel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand fill = new SqlCommand("", conn);
            fill.CommandType = System.Data.CommandType.StoredProcedure;
            fill.Parameters.Add(new SqlParameter("@SupId", Session["id"]));

        }

        protected void Cancel(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cancel = new SqlCommand("CancelThesisSol", conn);
            SqlCommand check = new SqlCommand("findThesisInSup", conn);
            cancel.CommandType = System.Data.CommandType.StoredProcedure;
            check.CommandType = CommandType.StoredProcedure;
            String SSS = serial.Text;
            if (SSS == "")
            {
                lb.Text = "All Infromation are Required";
                lb.Attributes.CssStyle.Add("color", "red");
            }
            else
            {
                int serialNum = Int16.Parse(SSS);
                cancel.Parameters.Add(new SqlParameter("@ThesisSerialNo", serialNum));
                check.Parameters.Add(new SqlParameter("@SupID", Session["id"]));
                check.Parameters.Add(new SqlParameter("@ThesisSerialNumber", serialNum));
                SqlParameter successCheck = check.Parameters.Add(new SqlParameter("@Success", SqlDbType.Int));
                SqlParameter success = cancel.Parameters.Add(new SqlParameter("@Success", SqlDbType.Int));
                success.Direction = ParameterDirection.Output;
                successCheck.Direction = ParameterDirection.Output;
                conn.Open();
                check.ExecuteNonQuery();
                conn.Close();
                if (successCheck.Value.ToString() == "0")
                {
                    lb.Text = "Thesis is not Under you Supervision.Insert another Serial Number";
                    lb.Attributes.CssStyle.Add("color", "red");
                }
                else
                {
                    conn.Open();
                    cancel.ExecuteNonQuery();
                    conn.Close();
                    if (success.Value.ToString() == "0")
                    {
                        lb.Text = "You Can not Cancel a Thesis with Latest Progress Report Evaluation not ZERO";
                        lb.Attributes.CssStyle.Add("color", "red");
                    }
                    else
                    {
                        lb.Text = "Thesis is Cancelled Succesfully";
                        lb.Attributes.CssStyle.Add("color", "green");
                    }
                }
            }
        }

        protected void OnHome(object sender, EventArgs e)
        {
            Response.Redirect("supervisor_page.aspx");
        }
    }
}