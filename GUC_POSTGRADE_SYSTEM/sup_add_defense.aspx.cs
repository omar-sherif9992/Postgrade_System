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
    public partial class sup_add_defense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Add(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand addGUC = new SqlCommand("AddDefenseGucian", conn);
            SqlCommand addNONGUC = new SqlCommand("AddDefenseNonGucian", conn);
            SqlCommand checkHas = new SqlCommand("hasDefense", conn);
            SqlCommand checkThesis = new SqlCommand("findThesisInSup", conn);
            checkThesis.CommandType = System.Data.CommandType.StoredProcedure;
            checkHas.CommandType = System.Data.CommandType.StoredProcedure;
            addGUC.CommandType = System.Data.CommandType.StoredProcedure;
            addNONGUC.CommandType = System.Data.CommandType.StoredProcedure;
            DateTime dd = Calendar.SelectedDate;
            string loc = DefenseLocation.Text;
            string SSS = ThesisSerial.Text;
            if (loc == "" || SSS == "" || Calendar.SelectedDate.Date == DateTime.MinValue.Date)
            {
                kalam.Text = "All information are Required";
                kalam.Attributes.CssStyle.Add("color", "red");
            }
            else
            {
                int serial = Int32.Parse(SSS);
                checkThesis.Parameters.Add(new SqlParameter("@SupID", Session["id"]));
                checkThesis.Parameters.Add(new SqlParameter("@ThesisSerialNumber", serial));
                SqlParameter FoundThesis = checkThesis.Parameters.Add(new SqlParameter("@Success", System.Data.SqlDbType.Int));
                FoundThesis.Direction = System.Data.ParameterDirection.Output;
                addGUC.Parameters.Add(new SqlParameter("@ThesisSerialNo", serial));
                addGUC.Parameters.Add(new SqlParameter("@DefenseDate", dd));
                addGUC.Parameters.Add(new SqlParameter("@DefenseLocation", loc));
                addNONGUC.Parameters.Add(new SqlParameter("@ThesisSerialNo", serial));
                addNONGUC.Parameters.Add(new SqlParameter("@DefenseDate", dd));
                addNONGUC.Parameters.Add(new SqlParameter("@DefenseLocation", loc));
                checkHas.Parameters.Add(new SqlParameter("@ThesisSerial", serial));
                SqlParameter CCheck = checkHas.Parameters.Add(new SqlParameter("@success", System.Data.SqlDbType.Int));
                SqlParameter successGUC = addGUC.Parameters.Add("@Success", System.Data.SqlDbType.Int);
                SqlParameter successNONGUC = addNONGUC.Parameters.Add("@Success", System.Data.SqlDbType.Int);
                SqlParameter success50 = addNONGUC.Parameters.Add("@Success50", System.Data.SqlDbType.Int);
                successGUC.Direction = System.Data.ParameterDirection.Output;
                successNONGUC.Direction = System.Data.ParameterDirection.Output;
                success50.Direction = System.Data.ParameterDirection.Output;
                CCheck.Direction = System.Data.ParameterDirection.Output;
                SqlCommand ENNDDATE = new SqlCommand("getThesisEnd", conn);
                ENNDDATE.CommandType = System.Data.CommandType.StoredProcedure;
                ENNDDATE.Parameters.Add(new SqlParameter("@serial", serial));
                ENNDDATE.Parameters.Add(new SqlParameter("@inDate", DateTime.Now));
                SqlParameter outdated = ENNDDATE.Parameters.Add("@x", System.Data.SqlDbType.Int);
                outdated.Direction = System.Data.ParameterDirection.Output;
                conn.Open();
                checkHas.ExecuteNonQuery();
                checkThesis.ExecuteNonQuery();
                ENNDDATE.ExecuteNonQuery();
                conn.Close();
                if (FoundThesis.Value.ToString() == "0")
                {
                    kalam.Text = "Thesis Serial Number is not under your supervision. Enter another one";
                    kalam.Attributes.CssStyle.Add("color", "red");
                }
                else
                {
                    if (outdated.Value.ToString() == "1")
                    {
                        kalam.Text = "You Can not Operate on OutDated Thesis";
                        kalam.Attributes.CssStyle.Add("color", "red");
                    }
                    else if (CCheck.Value.ToString() == "0")
                    {
                        kalam.Text = "You Can not add a Defense for a Thesis That already has a Defense";
                        kalam.Attributes.CssStyle.Add("color", "red");
                    }
                    else
                    {
                        if (dd < DateTime.Now)
                        {
                            kalam.Text = "You Can not Choose a Date which was in the past.";
                            kalam.Attributes.CssStyle.Add("color", "red");
                        }
                        else
                        {
                            conn.Open();
                            addGUC.ExecuteNonQuery();
                            addNONGUC.ExecuteNonQuery();
                            if (success50.Value.ToString() == "0")
                            {
                                kalam.Text = "You Can't Add the defense becuase this Thesis has grade less than 50";
                                kalam.Attributes.CssStyle.Add("color", "red");
                            }
                            else
                            {



                                kalam.Text = "Defense Added Successfuly";
                                kalam.Attributes.CssStyle.Add("color", "green");

                            }
                        }
                    }
                }
                /*if (CCheck.Value.ToString() == "0")
                {
                    kalam.Text = "You Can not add a Defense for a Thesis That already has a Defense";
                    kalam.Attributes.CssStyle.Add("color","red");
                }
                else
                {
                    conn.Open();
                    addGUC.ExecuteNonQuery();
                    addNONGUC.ExecuteNonQuery();
                    conn.Close();
                    if (success50.Value.ToString() == "0")
                    {
                        kalam.Text = "You Can't Add the defense becuase this Thesis has grade less than 50";
                        kalam.Attributes.CssStyle.Add("color", "red");
                    }
                    else
                    {
                        if (successGUC.Value.ToString() == "0" && successNONGUC.Value.ToString() == "0")
                        {
                            kalam.Text = "Thesis Serial Number is not under your supervision. Enter another one";
                            kalam.Attributes.CssStyle.Add("color", "red");
                        }
                        else
                        {
                            kalam.Text = "Defense Added Successfuly";
                            kalam.Attributes.CssStyle.Add("color", "green");
                        }

                    }
                }*/
            }

        }

        protected void home(object sender, EventArgs e)
        {
            Response.Redirect("supervisor_page.aspx");
        }
    }
}