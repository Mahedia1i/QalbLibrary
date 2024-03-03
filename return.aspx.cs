using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace QalbLibrary
{
    public partial class _return : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindReturnedBooks();
            }
        }

        private void BindReturnedBooks()
        {
            if (Session["IsLoggedIn"] == null || !(bool)Session["IsLoggedIn"])
            {
                // User is not logged in, redirect to login page or handle as appropriate
                Response.Redirect("Login.aspx");
                return;
            }

            string userId = Session["UserId"].ToString(); // Retrieve userid from session

            string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Qalbdb.mdf;Integrated Security=True;User Instance=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT BookMaster.BookName, BookMaster.Author, BookMaster.Description, BookMaster.ImageUrl FROM IssueMaster INNER JOIN BookMaster ON IssueMaster.BookId = BookMaster.BookId WHERE IssueMaster.Status = 'return' AND IssueMaster.UserId = @UserId", con);
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
