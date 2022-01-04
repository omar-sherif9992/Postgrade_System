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
            if (Session["type"] == null)
            {
                Response.Redirect("login_page.aspx");
           
            }


            String type = Session["type"].ToString();

            if (type.ToString().Equals("NonGucianStudent"))
            {

                courses.Attributes.CssStyle.Add("display", "visible");
            }

        }

        protected void closePublications(object sender, EventArgs e)
        {
            viewPublications1.Attributes.CssStyle.Add("display", "none");
            viewPublications2.Attributes.CssStyle.Add("display", "none");

        }
        protected void showPublications(object sender, EventArgs e)
        {
            viewPublications1.Attributes.CssStyle.Add("display", "visible");
            viewPublications2.Attributes.CssStyle.Add("display", "visible");

            mainTable.Attributes.CssStyle.Add("display", "visible");
            TableHeaderRow tableHeaderRow = new TableHeaderRow();
            TableHeaderCell headerCell = new TableHeaderCell();
            headerCell.Text = "ID";
            tableHeaderRow.Cells.Add(headerCell);
            headerCell = new TableHeaderCell();
            headerCell.Text = "Title";
            tableHeaderRow.Cells.Add(headerCell);

            headerCell = new TableHeaderCell();
            headerCell.Text = "Host";
            tableHeaderRow.Cells.Add(headerCell);


            headerCell = new TableHeaderCell();
            headerCell.Text = "Date";
            tableHeaderRow.Cells.Add(headerCell);
            headerCell = new TableHeaderCell();
            headerCell.Text = "place";
            tableHeaderRow.Cells.Add(headerCell);

            headerCell = new TableHeaderCell();
            headerCell.Text = "Accepted";
            tableHeaderRow.Cells.Add(headerCell);

            mainTable.Rows.Add(tableHeaderRow);
            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            //viewMyProfile
            int id = Int16.Parse(Session["id"].ToString());
            SqlCommand studentViewThesis = new SqlCommand("viewAllPublications", conn);
            studentViewThesis.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader rdr = studentViewThesis.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {

                TableRow tableRow = new TableRow();

                TableCell cell = new TableCell();
                cell.Text = "Not Specified";
                if (!rdr.IsDBNull(rdr.GetOrdinal("id")))
                {
                    Int32 idDB = rdr.GetInt32(rdr.GetOrdinal("id"));
                    cell.Text = idDB.ToString();
                }
                tableRow.Cells.Add(cell);


                cell = new TableCell();
                if (!rdr.IsDBNull(rdr.GetOrdinal("title")))
                {
                    String titleDB = rdr.GetString(rdr.GetOrdinal("title"));
                    if (titleDB != "-1")
                        cell.Text = titleDB;
                    else
                        cell.Text = "Not Specified";


                }
                else
                {
                    cell.Text = "Not Specified";
                }
                tableRow.Cells.Add(cell);



                cell = new TableCell();
                if (!rdr.IsDBNull(rdr.GetOrdinal("host")))
                {
                    String hostDB = rdr.GetString(rdr.GetOrdinal("host"));
                    if (hostDB != "-1")
                        cell.Text = hostDB;
                    else
                        cell.Text = "Not Specified";
                }
                else
                {
                    cell.Text = "Not Specified";
                }
                tableRow.Cells.Add(cell);





                cell = new TableCell();
                cell.Text = "Not Specified";
                if (!rdr.IsDBNull(rdr.GetOrdinal("date")))
                {
                    DateTime startDateDB = rdr.GetDateTime(rdr.GetOrdinal("date"));
                    cell.Text = startDateDB.ToString();
                }
                tableRow.Cells.Add(cell);


                cell = new TableCell();
                cell.Text = "Not Specified";
                if (!rdr.IsDBNull(rdr.GetOrdinal("place")))
                {
                    String placeDB = rdr.GetString(rdr.GetOrdinal("place"));
                    cell.Text = placeDB;
                }
                tableRow.Cells.Add(cell);

                cell = new TableCell();
                cell.Text = "Not Specified";
                if (!rdr.IsDBNull(rdr.GetOrdinal("accepted")))
                {

                    bool acceptedDB = rdr.GetBoolean(rdr.GetOrdinal("accepted"));
                    if (acceptedDB)
                    {
                        cell.Text = "Accepted";

                    }

                    else
                    {
                        cell.Text = "Not Accepted";
                    }
                }
                tableRow.Cells.Add(cell);




                mainTable.Rows.Add(tableRow);




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
                if (host.Length < 1)
                {
                    addMessage.Attributes.CssStyle.Add("display", "visible");
                    addMessage.Attributes.CssStyle.Add("color", "red");
                    addMessage.Text = "Host is Missing !!";
                    return;
                }
                else if (place.Length < 1)
                {
                    addMessage.Attributes.CssStyle.Add("display", "visible");
                    addMessage.Attributes.CssStyle.Add("color", "red");
                    addMessage.Text = "Place is Missing !!";
                    return;
                }
                else if (date == null)
                {
                    addMessage.Attributes.CssStyle.Add("display", "visible");
                    addMessage.Attributes.CssStyle.Add("color", "red");
                    addMessage.Text = "Date is Missing !!";
                    return;
                }

                else if (DateTime.Compare(date, today) < 0)
                {
                    addMessage.Attributes.CssStyle.Add("display", "visible");
                    addMessage.Attributes.CssStyle.Add("color", "red");
                    addMessage.Text = "Incorrect Date , choose another Present or Future date";
                    return;
                }
                else if (title.Length < 1)
                {
                    addMessage.Attributes.CssStyle.Add("display", "visible");
                    addMessage.Attributes.CssStyle.Add("color", "red");
                    addMessage.Text = "Title is Missing !!";
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
            if (linkPub.Text.Length == 0)
            {
                linkMessage.Attributes.CssStyle.Add("display", "visible");
                linkMessage.Attributes.CssStyle.Add("color", "red");
                linkMessage.Text = "Publication ID is Missing !!";
                return;

            }
            if (linkThesis.Text.Length == 0)
            {
                linkMessage.Attributes.CssStyle.Add("display", "visible");
                linkMessage.Attributes.CssStyle.Add("color", "red");
                linkMessage.Text = "Thesis Serial Number is Missing !!";
                return;
            }


            int pub_id = Int16.Parse(linkPub.Text);
            int thesis_ssn = Int16.Parse(linkThesis.Text);


            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int id = Int16.Parse(Session["id"].ToString());

            SqlCommand login_proc = new SqlCommand("linkPubThesis", conn);
            login_proc.CommandType = CommandType.StoredProcedure;
            login_proc.Parameters.Add(new SqlParameter("@thesisSerialNo", thesis_ssn));
            login_proc.Parameters.Add(new SqlParameter("@PubID", pub_id));
            login_proc.Parameters.Add(new SqlParameter("@sid", id));



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
            else if (success.Value.ToString() == "100")
            {
                linkMessage.Attributes.CssStyle.Add("display", "visible");
                linkMessage.Attributes.CssStyle.Add("color", "red");
                linkMessage.Text = "Incorrect Thesis Serial Number !! ";

            }
            else if (success.Value.ToString() == "200")
            {
                linkMessage.Attributes.CssStyle.Add("display", "visible");
                linkMessage.Attributes.CssStyle.Add("color", "red");
                linkMessage.Text = "This Thesis Was linked Before to this Publication !!";

            }
            else if (success.Value.ToString() == "0")
            {
                linkMessage.Attributes.CssStyle.Add("display", "visible");
                linkMessage.Attributes.CssStyle.Add("color", "red");
                linkMessage.Text = "Publication Doesn't Exist !! ";


            }
            else if (success.Value.ToString() == "-2")
            {
                linkMessage.Attributes.CssStyle.Add("display", "visible");
                linkMessage.Attributes.CssStyle.Add("color", "red");
                linkMessage.Text = "Thesis doesn't Exists";

            }
            else if (success.Value.ToString() == "-1")
            {
                linkMessage.Attributes.CssStyle.Add("display", "visible");
                linkMessage.Attributes.CssStyle.Add("color", "red");
                linkMessage.Text = "Outdated Thesis can't be linked !!";
            }
            else
            {
                linkMessage.Attributes.CssStyle.Add("display", "visible");
                linkMessage.Attributes.CssStyle.Add("color", "red");
                linkMessage.Text = "Incorrect Thesis Serial Number";
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