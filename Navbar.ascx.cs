using System;

namespace QalbLibrary
{
    public partial class Navbar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is logged in
            if (Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"])
            {
                // User is logged in, show logout button
                loginBtn.Text = "Logout";
            }
            else
            {
                // User is not logged in, show login button
                loginBtn.Text = "Login";
            }
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"])
            {
                // User is logged in, so log them out
                Session.Clear(); // Clear all session variables
                Session.Abandon(); // Abandon the session
                Response.Redirect("Logout.aspx"); // Redirect to the home page or any other appropriate page
            }
            else
            {
                // User is not logged in, redirect them to the login page
                Response.Redirect("Login.aspx");
            }
            // Toggle button text between "Login" and "Logout"
            loginBtn.Text = (Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"]) ? "Logout" : "Login";
        }

    }
}
