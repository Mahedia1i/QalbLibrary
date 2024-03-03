using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace QalbLibrary
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|Qalbdb.mdf;Integrated Security=True;User Instance=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from loginsignup where email=@Email AND password=@Password", con);
            cmd.Parameters.AddWithValue("@Email", username.Text);
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
                ErrorMessageLabel.Text = "Invalid username or password";
            }

            con.Close();
        }
    }
}
