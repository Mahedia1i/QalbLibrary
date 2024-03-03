using System;
using System.IO;
using System.Data.SqlClient;
using System.IO;

namespace QalbLibrary
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is logged in
            if (Session["IsLoggedIn"] == null || (bool)Session["IsLoggedIn"] == false)
            {
                // Redirect to login page if not logged in
                Response.Redirect("login.aspx");
            }
            else
            {
                // If logged in, load profile data
                LoadProfileData();
            }
        }

        private void LoadProfileData()
        {
            string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Qalbdb.mdf;Integrated Security=True;User Instance=True";

            // Assuming the user ID is stored in session
            string userID = Session["UserId"].ToString();

            string query = "SELECT userid, name, email, phone, imageurl FROM UserProfile WHERE userid = @UserID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@UserID", userID);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        lblName.Text = reader["name"].ToString();
                        lblEmail.Text = reader["email"].ToString();
                        lblPhone.Text = reader["phone"].ToString();

                        // Assuming the image URL is stored in the imageurl column
                        string imageUrl = reader["imageurl"].ToString();
                        profileImage.Attributes["src"] = imageUrl;

                    }

                    reader.Close();
                }
                catch (Exception ex)
                {
                    // Handle exceptions
                    // For example: Log the exception, display an error message, etc.
                    Console.WriteLine("An error occurred: " + ex.Message);
                }
            }
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("editprofile.aspx");
        }

        protected void btndload_Click(object sender, EventArgs e)
        {
          
        }

    }
}
