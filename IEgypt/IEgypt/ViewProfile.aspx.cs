using System;
using System.Web;
using System.Web.UI;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace IEgypt
{

    public partial class ViewProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String user = Convert.ToString(Session["ID"]);
            if (!int.TryParse(user, out int o))
            {
                Response.Redirect("login.aspx");
                return;
            }


            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();

            SqlCommand command;
            SqlDataReader reader;

            command = new SqlCommand("Website_Show_Profile", cnn)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };

            command.Parameters.Add(new SqlParameter("@user_id", user));

            string userType = Convert.ToString(Session["userType"]);
            // execute the command
            reader = command.ExecuteReader();

            DataTable searchResults = new DataTable();
            searchResults.Load(reader);
            userType_label.Text = "User Type : " + userType;
            view_results.DataSource = searchResults;
            view_results.DataBind();

            reader.Close();
            cnn.Close();
        }

        protected void show_more_button_click(object sender, EventArgs e)
        {
            string userType = Convert.ToString(Session["userType"]);
            if (userType.Equals("Viewer"))
            {
                Response.Redirect("Viewer.aspx");

            }
            else if (userType.Equals("Contributor"))
            {
                Response.Redirect("contributorpart10.aspx");
            }
            else
            {
                Response.Redirect("Staff.aspx");
            }
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}
