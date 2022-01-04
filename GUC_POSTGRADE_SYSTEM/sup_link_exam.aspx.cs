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
    public partial class sup_link_exam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("supervisor_page.aspx");
        }

        protected void submit(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand linkExm = new SqlCommand("AddExaminerDefense", conn);
            linkExm.CommandType = System.Data.CommandType.StoredProcedure;
            string exmID = ExxaminerID.Text;
            string serialNUmmmber = serrialNumber.Text;
            DateTime DefenseDate = Calendar.SelectedDate;
            if (exmID == "" || serialNUmmmber == "" || Calendar.SelectedDate.Date == DateTime.MinValue.Date)
            {
                lb.Text = "All Information are required";
                lb.Attributes.CssStyle.Add("color", "red");
            }
            else
            {
                int ExaminerID = Int32.Parse(exmID);
                int serialNumber = Int32.Parse(serialNUmmmber);
                linkExm.Parameters.Add(new SqlParameter("@SupID", Session["id"]));
                linkExm.Parameters.Add(new SqlParameter("@ThesisSerialNo", serialNumber));
                linkExm.Parameters.Add(new SqlParameter("@DefenseDate", DefenseDate));
                linkExm.Parameters.Add(new SqlParameter("@ExaminerID", ExaminerID));
                SqlCommand ENNDDATE = new SqlCommand("getThesisEnd", conn);
                ENNDDATE.CommandType = System.Data.CommandType.StoredProcedure;
                ENNDDATE.Parameters.Add(new SqlParameter("@serial", serialNumber));
                ENNDDATE.Parameters.Add(new SqlParameter("@inDate", DateTime.Now));
                SqlParameter outdated = ENNDDATE.Parameters.Add("@x", System.Data.SqlDbType.Int);
                outdated.Direction = System.Data.ParameterDirection.Output;
                conn.Open();
                ENNDDATE.ExecuteNonQuery();
                conn.Close();
                if (outdated.Value.ToString() == "1")
                {
                    lb.Text = "You Cant Operate on OutDated Thesis";
                    lb.Attributes.CssStyle.Add("color", "red");
                }
                else
                {
                    SqlParameter SuccessThesis = linkExm.Parameters.Add("@SuccessThesis", System.Data.SqlDbType.Int);
                    SuccessThesis.Direction = System.Data.ParameterDirection.Output;
                    SqlParameter SuccessDate = linkExm.Parameters.Add("@SuccessDate", System.Data.SqlDbType.Int);
                    SuccessDate.Direction = System.Data.ParameterDirection.Output;
                    SqlParameter Success = linkExm.Parameters.Add("@Success", System.Data.SqlDbType.Int);
                    Success.Direction = System.Data.ParameterDirection.Output;
                    conn.Open();
                    linkExm.ExecuteNonQuery();
                    conn.Close();
                    if (Success.Value.ToString() == "0")
                    {
                        lb.Text = "The Examiner Doesn't Exist in The System";
                        lb.Attributes.CssStyle.Add("color", "red");
                    }
                    else
                    {
                        if (SuccessThesis.Value.ToString() == "0")
                        {
                            lb.Text = "No Thesis under your supervision Has this Serial Number";
                            lb.Attributes.CssStyle.Add("color", "red");
                        }
                        else
                        {
                            if (outdated.Value.ToString() == "1")
                            {
                                lb.Text = "You Can not Operate on OutDated Thesis";
                                lb.Attributes.CssStyle.Add("color", "red");
                            }
                            else if (SuccessDate.Value.ToString() == "0")
                            {
                                lb.Text = "The Thesis Inserted Doesn't have Defense With this Date." +
                                    "Enter another Date";
                                lb.Attributes.CssStyle.Add("color", "red");
                            }
                            else
                            {
                                lb.Text = "Examiner is Linked to the Defense Successfully";
                                lb.Attributes.CssStyle.Add("color", "green");
                            }
                        }
                    }
                }


            }
        }
    }
}