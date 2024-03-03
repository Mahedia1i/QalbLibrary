using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QalbLibrary
{
    public partial class issuedetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
            {
                // User is not logged in, redirect to login page
                Response.Redirect("Login.aspx");
            }
        }
    }
}