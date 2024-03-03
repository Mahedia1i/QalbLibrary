using System.Data.SqlClient;
using System;
using System.Data;
using System.Web.UI.WebControls;
namespace QalbLibrary.profileimage
{
    public partial class books : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBookData();
            }
        }

        private void BindBookData()
        {
            string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|Qalbdb.mdf;Integrated Security=True;User Instance=True";
            string query = "SELECT bookid, bookname, author, description, imageurl FROM bookmaster";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    BookRepeater.DataSource = dataTable;
                    BookRepeater.DataBind();
                }
            }
        }

        protected void IssueButton_Click(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
            {
                // User is not logged in, redirect to login page
                Response.Redirect("Login.aspx");
            }
            else
            {
                Button btn = (Button)sender;
                string bookid = btn.CommandArgument;
                string userId = Session["UserId"].ToString();
                string status = "issue";

                string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|Qalbdb.mdf;Integrated Security=True;User Instance=True";
                string query = "INSERT INTO issuemaster (bookid, userid, status) VALUES (@BookId, @UserId, @Status)";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@BookId", bookid);
                        command.Parameters.AddWithValue("@UserId", userId);
                        command.Parameters.AddWithValue("@Status", status);
                        try
                        {
                            connection.Open();
                            int rowsAffected = command.ExecuteNonQuery();
                            if (rowsAffected > 0)
                            {
                                Response.Redirect("issue.aspx");
                            }
                            else
                            {
                                Response.Write("error");
                            }
                        }
                        catch (Exception ex)
                        {
                            // Handle the exception
                        }
                    }
                }
            }
        }

    }
}
