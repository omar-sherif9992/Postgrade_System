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
    public partial class sup_view_pub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void view(object sender, EventArgs e)
        {
            Table t = new Table();
            t.Attributes.CssStyle.Add("width", "700px");
            t.Attributes.CssStyle.Add("border-collapse", "collapse");
            t.Attributes.CssStyle.Add("position", "center");
            t.Attributes.CssStyle.Add("margin", "auto");
            t.Attributes.CssStyle.Add("border", "2px solid black");
            String connStr = WebConfigurationManager.ConnectionStrings["GUC_POSTGRADE"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand vw = new SqlCommand("ViewAStudentPublications", conn);
            vw.CommandType = System.Data.CommandType.StoredProcedure;
            string idStr = student_id.Text;
            if (idStr == "")
            {
                Label lb = new Label();
                lb.Text = "All Fields of Inputs are required";
                lb.Attributes.CssStyle.Add("color", "red");
                Form.Controls.Add(lb);
            }
            else
            {
                int id = Int16.Parse(idStr);
                vw.Parameters.Add(new SqlParameter("@StudentID", id));
                vw.Parameters.Add(new SqlParameter("@SupID", Session["id"]));
                TableHeaderRow tr = new TableHeaderRow();
                TableHeaderCell tc1 = new TableHeaderCell();
                tc1.Text = "Publication ID";
                TableHeaderCell tc2 = new TableHeaderCell();
                tc2.Text = "Title";
                TableHeaderCell tc3 = new TableHeaderCell();
                tc3.Text = "Date";
                TableHeaderCell tc4 = new TableHeaderCell();
                tc4.Text = "Place";
                TableHeaderCell tc5 = new TableHeaderCell();
                tc5.Text = "Accepted";
                TableHeaderCell tc6 = new TableHeaderCell();
                tc6.Text = "Host";
                SqlParameter success = vw.Parameters.Add("@Success", System.Data.SqlDbType.Int);
                success.Direction = System.Data.ParameterDirection.Output;
                //tc1.Attributes.Add("border", "2px solid black"); tc1.Attributes.Add("padding", "10px"); tc1.Attributes.Add("text-align", "left"); tc1.Attributes.Add("color", "black"); tc1.Attributes.Add("font-size", "150px"); tc1.Attributes.Add("position", "center"); tc1.Attributes.Add("margin", "auto");
                //tc2.Attributes.Add("border", "2px solid black"); tc2.Attributes.Add("padding", "10px"); tc2.Attributes.Add("text-align", "left"); tc2.Attributes.Add("color", "black"); tc2.Attributes.Add("font-size", "150px"); tc2.Attributes.Add("position", "center"); tc2.Attributes.Add("margin", "auto");
                //tc3.Attributes.Add("border", "2px solid black"); tc3.Attributes.Add("padding", "10px"); tc3.Attributes.Add("text-align", "left"); tc3.Attributes.Add("color", "black"); tc3.Attributes.Add("font-size", "150px"); tc3.Attributes.Add("position", "center"); tc3.Attributes.Add("margin", "auto");
                //tc4.Attributes.Add("border", "2px solid black"); tc4.Attributes.Add("padding", "10px"); tc4.Attributes.Add("text-align", "left"); tc4.Attributes.Add("color", "black"); tc4.Attributes.Add("font-size", "150px"); tc4.Attributes.Add("position", "center"); tc4.Attributes.Add("margin", "auto");
                //tc5.Attributes.Add("border", "2px solid black"); tc5.Attributes.Add("padding", "10px"); tc5.Attributes.Add("text-align", "left"); tc5.Attributes.Add("color", "black"); tc5.Attributes.Add("font-size", "150px"); tc5.Attributes.Add("position", "center"); tc5.Attributes.Add("margin", "auto");
                //tc6.Attributes.Add("border", "2px solid black"); tc6.Attributes.Add("padding", "10px"); tc6.Attributes.Add("text-align", "left"); tc6.Attributes.Add("color", "black"); tc6.Attributes.Add("font-size", "150px"); tc6.Attributes.Add("position", "center"); tc6.Attributes.Add("margin", "auto");
                tr.Controls.Add(tc1); tr.Controls.Add(tc2); tr.Controls.Add(tc3); tr.Controls.Add(tc4); tr.Controls.Add(tc5); tr.Controls.Add(tc6);
                t.Controls.Add(tr);
                conn.Open();
                SqlDataReader rdr = vw.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                int rd = 0;
                while (rdr.Read())
                {
                    rd++;
                    TableRow r = new TableRow();
                    int pubid = rdr.GetInt32(rdr.GetOrdinal("id"));
                    string title = rdr.GetString(rdr.GetOrdinal("title"));
                    DateTime date = rdr.GetDateTime(rdr.GetOrdinal("date"));
                    string place = rdr.GetString(rdr.GetOrdinal("place"));
                    Boolean accepted = rdr.GetBoolean(rdr.GetOrdinal("accepted"));
                    string host = rdr.GetString(rdr.GetOrdinal("host"));
                    string acc = "";
                    if (accepted == true) acc = "Accepted";
                    else acc = "Not Accepted";
                    TableCell x1 = new TableCell(); TableCell x2 = new TableCell(); TableCell x3 = new TableCell(); TableCell x4 = new TableCell(); TableCell x5 = new TableCell(); TableCell x6 = new TableCell();
                    x1.Text = pubid.ToString(); x2.Text = title; x3.Text = date.ToString(); x4.Text = place; x5.Text = acc; x6.Text = host;
                    //x1.Attributes.Add("border", "2px solid black"); x1.Attributes.Add("padding", "10px"); x1.Attributes.Add("text-align", "left"); x1.Attributes.Add("color", "black"); x1.Attributes.Add("font-size", "150px"); x1.Attributes.Add("position", "center"); x1.Attributes.Add("margin", "auto");
                    //x2.Attributes.Add("border", "2px solid black"); x2.Attributes.Add("padding", "10px"); x2.Attributes.Add("text-align", "left"); x2.Attributes.Add("color", "black"); x2.Attributes.Add("font-size", "150px"); x2.Attributes.Add("position", "center"); x2.Attributes.Add("margin", "auto");
                    //x3.Attributes.Add("border", "2px solid black"); x3.Attributes.Add("padding", "10px"); x3.Attributes.Add("text-align", "left"); x3.Attributes.Add("color", "black"); x3.Attributes.Add("font-size", "150px"); x3.Attributes.Add("position", "center"); x3.Attributes.Add("margin", "auto");
                    //x4.Attributes.Add("border", "2px solid black"); x4.Attributes.Add("padding", "10px"); x4.Attributes.Add("text-align", "left"); x4.Attributes.Add("color", "black"); x4.Attributes.Add("font-size", "150px"); x4.Attributes.Add("position", "center"); x4.Attributes.Add("margin", "auto");
                    //x5.Attributes.Add("border", "2px solid black"); x5.Attributes.Add("padding", "10px"); x5.Attributes.Add("text-align", "left"); x5.Attributes.Add("color", "black"); x5.Attributes.Add("font-size", "150px"); x5.Attributes.Add("position", "center"); x5.Attributes.Add("margin", "auto");
                    //x6.Attributes.Add("border", "2px solid black"); x6.Attributes.Add("padding", "10px"); x6.Attributes.Add("text-align", "left"); x6.Attributes.Add("color", "black"); x6.Attributes.Add("font-size", "150px"); x6.Attributes.Add("position", "center"); x6.Attributes.Add("margin", "auto");
                    r.Controls.Add(x1); r.Controls.Add(x2); r.Controls.Add(x3); r.Controls.Add(x4); r.Controls.Add(x5); r.Controls.Add(x6);
                    t.Controls.Add(r);
                }
                if (success.Value == null)
                {
                    Form.Controls.Add(t);
                    Label lb = new Label();
                    lb.Text = "This Student Doesnt Have any Publications Yet";
                    lb.Attributes.CssStyle.Add("color", "Blue");
                    if (rd == 0) Form.Controls.Add(lb);
                }
                else
                {
                    Label lb = new Label();
                    lb.Text = "This Student is Not Under your Supervision,Enter Another ID";
                    lb.Attributes.CssStyle.Add("color", "red");
                    Form.Controls.Add(lb);
                    Form.Controls.Remove(t);
                }
            }
        }
    }
}