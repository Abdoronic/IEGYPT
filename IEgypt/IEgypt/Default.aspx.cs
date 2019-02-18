using System;
using System.Web;
using System.Web.UI;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace IEgypt
{
    public partial class Default : System.Web.UI.Page
    {
        public void register_button_click(object sender, EventArgs args)
        {
            Response.Redirect("Register.aspx");
        }

        public void login_button_click(object sender, EventArgs args)
        {
            Response.Redirect("login.aspx");
        }

        public void deactivate_button_click(object sender, EventArgs args)
        {
            Response.Redirect("deactivate.aspx");
        }

        public void view_button_click(object sender, EventArgs args)
        {
            Response.Redirect("ViewProfile.aspx");
        }

        public void edit_button_click(object sender, EventArgs args)
        {
            Response.Redirect("EditProfile.aspx");
        }


        public void search_content_button_click(object sender, EventArgs args)
        {
            string type = search_content_type.Text;
            string category = search_content_category.Text;

            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();


            SqlCommand command;
            SqlDataReader reader;

            command = new SqlCommand("Website_Original_Content_Search", cnn)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };

            command.Parameters.Add(new SqlParameter("@typename", type));
            command.Parameters.Add(new SqlParameter("@categoryname", category));

            reader = command.ExecuteReader();
            
            DataTable searchResults = new DataTable();
            searchResults.Load(reader);
            search_content_label.Text = "There are " + searchResults.Rows.Count + " search results";
            search_content_results.DataSource = searchResults;
            search_content_results.DataBind();

            reader.Close();
            cnn.Close();
        }

        public void search_contributors_button_click(object sender, EventArgs args)
        {
            string name = search_contributors_name.Text;

            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();

            SqlCommand command;
            SqlDataReader reader;

            command = new SqlCommand("Website_Contributor_Search", cnn)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };

            command.Parameters.Add(new SqlParameter("@fullname", name));

            reader = command.ExecuteReader();

            DataTable searchResults = new DataTable();
            searchResults.Load(reader);
            search_contributors_label.Text = "There are " + searchResults.Rows.Count + " search results";
            search_contributors_results.DataSource = searchResults;
            search_contributors_results.DataBind();
            reader.Close();
            cnn.Close();
        }

        public void Show_contributors_button_click(object sender, EventArgs args)
        {

            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();

            SqlCommand command;
            SqlDataReader reader;

            command = new SqlCommand("Website_Order_Contributor", cnn)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };


            reader = command.ExecuteReader();

            DataTable searchResults = new DataTable();
            searchResults.Load(reader);
            show_contributors_label.Text = "There are " + searchResults.Rows.Count + "results";
            show_contributors_results.DataSource = searchResults;
            show_contributors_results.DataBind();
            reader.Close();
            cnn.Close();
        }

        public void show_original_content_button_click(object sender, EventArgs args)
        {
            string email = show_original_content.Text;

            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();


            SqlCommand command;
            SqlDataReader reader;

            command = new SqlCommand("Website_Show_Original_Content", cnn)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };

            if(!email.Equals(""))
                command.Parameters.Add(new SqlParameter("@contributor_email", email));
            else
                command.Parameters.Add(new SqlParameter("@contributor_email", DBNull.Value));

            reader = command.ExecuteReader();

            DataTable searchResults = new DataTable();
            searchResults.Load(reader);
            show_original_content_label.Text = "There are " + searchResults.Rows.Count + "results";
            show_original_content_results.DataSource = searchResults;
            show_original_content_results.DataBind();

            reader.Close();
            cnn.Close();
        }
    }

}
