using System;
using System.Web.UI;

namespace QalbLibrary
{
    public partial class Logout : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear session variables or perform any other necessary logout actions
            Session.Clear(); // Clear all session variables

            // Redirect to the login page
            Response.Redirect("index.aspx");
        }
    }
}
