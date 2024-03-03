using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace QalbLibrary
{
    public partial class issues : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("login.aspx"); // Redirect to login page if userid session is not present
            }
            else
            {
                if (!IsPostBack)
                {
                    BindBookData();
                }
            }
        }

        protected void ReturnButton_Click(object sender, EventArgs e)
        {
            // Retrieve the issue id from the CommandArgument
            int issueId = Convert.ToInt32((sender as Button).CommandArgument);

            // Update the status in the IssueMaster table to "return"
            string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Qalbdb.mdf;Integrated Security=True;User Instance=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE IssueMaster SET Status = 'return' WHERE IssueId = @IssueId", con);
                cmd.Parameters.AddWithValue("@IssueId", issueId);
                cmd.ExecuteNonQuery();
            }

            // Rebind the data after updating status
            BindBookData();
        }

        private void BindBookData()
        {
            int userId = Convert.ToInt32(Session["userid"]);

            string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Qalbdb.mdf;Integrated Security=True;User Instance=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT IssueMaster.IssueId, BookMaster.BookName, BookMaster.Author, BookMaster.Description, BookMaster.ImageUrl FROM IssueMaster INNER JOIN BookMaster ON IssueMaster.BookId = BookMaster.BookId WHERE IssueMaster.UserId = @UserId AND IssueMaster.Status = 'issue'", con);
                cmd.Parameters.AddWithValue("@UserId", userId);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                BookRepeater.DataSource = dt;
                BookRepeater.DataBind();
            }
        }
    }
}
