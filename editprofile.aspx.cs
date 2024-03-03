using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace QalbLibrary
{
    public partial class editprofile : System.Web.UI.Page
    {
        public string ProfileImageUrl { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProfileImageUrl = LoadProfileImageUrlFromDatabase();

                if (Session["IsLoggedIn"] != null)
                {
                    string userID = Session["UserId"].ToString();
                    string query = "SELECT * FROM UserProfile WHERE UserID = @UserID";
                    using (SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|Qalbdb.mdf;Integrated Security=True;User Instance=True"))
                    {
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@UserID", userID);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();

                        con.Open();
                        da.Fill(dt);
                        con.Close();

                        if (dt.Rows.Count > 0)
                        {
                            btnSaveProfile.Visible = true;
                            btnInsertProfile.Visible = false;

                            txtName.Text = dt.Rows[0]["Name"].ToString();
                            txtEmail.Text = dt.Rows[0]["Email"].ToString();
                            txtPhone.Text = dt.Rows[0]["Phone"].ToString();
                        }
                        else
                        {
                            btnSaveProfile.Visible = false;
                            btnInsertProfile.Visible = true;
                        }
                    }
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }

        private string LoadProfileImageUrlFromDatabase()
        {   

            string connectionString = "YourConnectionString";
            string userID = string.Empty;

            if (Session["UserId"] != null)
            {
                userID = Session["UserId"].ToString();
            }
            else
            {
                Response.Redirect("login.aspx");
            }

            string query = "SELECT imageurl FROM UserProfile WHERE userid = @UserID";

            using (SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|Qalbdb.mdf;Integrated Security=True;User Instance=True"))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserID", userID);

                con.Open();
                string imageUrl = (string)cmd.ExecuteScalar();
                con.Close();

                if (string.IsNullOrEmpty(imageUrl))
                {
                    return "images/default_profile_picture.jpg";
                }
                else
                {
                    return "~/profileimage/" + imageUrl;
                }
            }
        }


        protected void SaveProfile_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                string fileName = Path.GetFileName(fileUpload.FileName);
                string folderPath = Server.MapPath("~/profileimage/");
                string filePath = folderPath + fileName;
                fileUpload.SaveAs(filePath);

                string userID = Session["UserID"].ToString();
                string query = "UPDATE UserProfile SET name = @Name, email = @Email, phone = @Phone, imageurl = @ProfileImageURL WHERE userid = @UserID";

                using (SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|Qalbdb.mdf;Integrated Security=True;User Instance=True"))
                {
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@ProfileImageURL", "profileimage/" + fileName);
                    cmd.Parameters.AddWithValue("@UserID", userID);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();

                    if (rowsAffected > 0)
                    {
                        Response.Redirect("profile.aspx");
                    }
                    else
                    {
                        ErrorMessageLabel.Text = "Failed to update profile.";
                    }
                }
            }
            else
            {
                // Handle case where no file is uploaded
                ErrorMessageLabel.Text = "Please select a file to upload.";
            }
        }

        protected void InsertProfile_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                string fileName = Path.GetFileName(fileUpload.FileName);
                string folderPath = Server.MapPath("~/profileimage/");
                string filePath = folderPath + fileName;
                fileUpload.SaveAs(filePath);

                string userID = Session["UserID"].ToString();
                string query = "INSERT INTO UserProfile (userid, name, email, phone, imageurl) VALUES (@UserID, @Name, @Email, @Phone, @ImageURL)";

                using (SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|Qalbdb.mdf;Integrated Security=True;User Instance=True"))
                {
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@ImageURL", "profileimage/" + fileName);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();

                    if (rowsAffected > 0)
                    {
                        Response.Redirect("profile.aspx");
                    }
                    else
                    {
                        ErrorMessageLabel.Text = "Failed to insert profile.";
                    }
                }
            }
            else
            {
                // Handle case where no file is uploaded
                ErrorMessageLabel.Text = "Please select a file to upload.";
            }
        }

    }
}
