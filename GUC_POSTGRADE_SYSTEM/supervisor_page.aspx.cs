using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUC_POSTGRADE_SYSTEM
{
    public partial class supervisor_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(Session["user"]);
        }

        protected void ListThesis(object sender, EventArgs e)
        {
            Response.Redirect("supervisor_list_students.aspx");
        }

        protected void ViewPub(object sender, EventArgs e)
        {

        }

        protected void AddDefense(object sender, EventArgs e)
        {

        }

        protected void AddExaminer(object sender, EventArgs e)
        {

        }

        protected void EvaluateReport(object sender, EventArgs e)
        {

        }

        protected void CancelThesis(object sender, EventArgs e)
        {

        }
    }
}