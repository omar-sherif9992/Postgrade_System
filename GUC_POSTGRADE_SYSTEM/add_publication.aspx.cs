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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String type = Session["type"].ToString();

            if (type.ToString().Equals("NonGucianStudent"))
            {

                courses.Attributes.CssStyle.Add("display", "visible");
            }

        }
        protected void addAccepted(object sender, EventArgs e)
        {
            addPublication(1);
        }
        protected void addNotAccepted(object sender, EventArgs e)
        {
            addPublication(0);
        }
        protected void addPublication(int acceptence)
        {
            try
            {

                String title = addTitle.Text;
                String host = addHost.Text;
                String place = addPlace.Text;
                DateTime date = addDate.SelectedDate;
                DateTime today = DateTime.Now;
            
                if (DateTime.Compare(date, today) < 0)
                {
                    addMessage.Attributes.CssStyle.Add("display", "visible");
                    addMessage.Attributes.CssStyle.Add("color", "red");
                    addMessage.Text = "Incorrect Date , choose another Present or Future date";
                    return;
                }

                String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand login_proc = new SqlCommand("addPublication", conn);
                login_proc.CommandType = CommandType.StoredProcedure;
                login_proc.Parameters.Add(new SqlParameter("@title", title));
                login_proc.Parameters.Add(new SqlParameter("@pubDate", date));
                login_proc.Parameters.Add(new SqlParameter("@host", host));
            login_proc.Parameters.Add(new SqlParameter("@place", place));
            login_proc.Parameters.Add(new SqlParameter("@accepted", acceptence));


                SqlParameter success = login_proc.Parameters.Add("@Success_bit", SqlDbType.Int);
                success.Direction = System.Data.ParameterDirection.Output;

                SqlParameter pub_id = login_proc.Parameters.Add("@pub_id", SqlDbType.Int);
                pub_id.Direction = System.Data.ParameterDirection.Output;

                conn.Open();
                login_proc.ExecuteNonQuery();
                conn.Close();

                if (success.Value.ToString() == "1")
                {
                    addMessage.Attributes.CssStyle.Add("display", "visible");
                    addMessage.Attributes.CssStyle.Add("color", "green");
                    addMessage.Text = "Successfully Added " + title + " Publication with id " + pub_id.Value.ToString();
                }
                else
                {
                    addMessage.Attributes.CssStyle.Add("display", "visible");
                    addMessage.Attributes.CssStyle.Add("color", "red");
                    addMessage.Text = "Incorrect Information Supplied";
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

        protected void linkPublication(object sender, EventArgs e)
        {
            try
            {
                int pub_id = Int16.Parse(linkPub.Text);
                int thesis_ssn = Int16.Parse(linkThesis.Text);


                String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand login_proc = new SqlCommand("linkPubThesis", conn);
                login_proc.CommandType = CommandType.StoredProcedure;
                login_proc.Parameters.Add(new SqlParameter("@thesisSerialNo", thesis_ssn));
                login_proc.Parameters.Add(new SqlParameter("@PubID", pub_id));


                SqlParameter success = login_proc.Parameters.Add("@Success_bit", SqlDbType.Int);
                success.Direction = System.Data.ParameterDirection.Output;

                SqlParameter thesis_title = login_proc.Parameters.Add("@thesis_title", SqlDbType.VarChar, 50);
                thesis_title.Direction = System.Data.ParameterDirection.Output;

                SqlParameter pub_title = login_proc.Parameters.Add("@publication_title", SqlDbType.VarChar, 50);
                pub_title.Direction = System.Data.ParameterDirection.Output;

                conn.Open();
                login_proc.ExecuteNonQuery();
                conn.Close();

                if (success.Value.ToString() == "1")
                {
                    linkMessage.Attributes.CssStyle.Add("display", "visible");
                    linkMessage.Attributes.CssStyle.Add("color", "green");
                    linkMessage.Text = "Successfully Added thesis " + thesis_title.Value.ToString() + " to Publication " + pub_title.Value.ToString();
                }
                else
                {
                    linkMessage.Attributes.CssStyle.Add("display", "visible");
                    linkMessage.Attributes.CssStyle.Add("color", "red");
                    linkMessage.Text = "Incorrect Thesis Serial Number/Progress Report";
                }


            }

            catch (Exception ex)
            {
                linkMessage.Attributes.CssStyle.Add("display", "visible");
                linkMessage.Attributes.CssStyle.Add("color", "red");
                linkMessage.Text = "Incorrect Information Supplied";
                return;
            }

                
        }


    }
}