using System;
using System.Configuration;
using System.Data.SqlClient;

namespace QalbLibrary
{
    public partial class signup : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|Qalbdb.mdf;Integrated Security=True;User Instance=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignUpButton_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO loginsignup (username, email, password, cpassword) VALUES (@Username, @Email, @Password, @CPassword)", con);
            cmd.Parameters.AddWithValue("@Username", username.Text);
            cmd.Parameters.AddWithValue("@Email", email.Text);
            cmd.Parameters.AddWithValue("@Password", password.Text);
            cmd.Parameters.AddWithValue("@CPassword", confirmPassword.Text);

            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();

            if (i > 0)
            {
                con.Open();
                cmd = new SqlCommand("Select * from loginsignup where email=@Email AND password=@Password", con);
                cmd.Parameters.AddWithValue("@Email", email.Text);
                cmd.Parameters.AddWithValue("@Password", password.Text);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    Session["IsLoggedIn"] = true;
                    Session["UserId"] = reader["userid"];
                    Response.Redirect("index.aspx");
                }
                else
                {
                    ErrorMessageLabel.Text = "Signup failed";
                }

                con.Close();
            }
            else
            {
                ErrorMessageLabel.Text = "Signup failed";
            }
        }

    }
}
