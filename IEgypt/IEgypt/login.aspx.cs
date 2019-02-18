using System;
using System.Web;
using System.Web.UI;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace IEgypt
{

    public partial class login : System.Web.UI.Page
    {
        public void do_login_button_click(object sender, EventArgs args)
        {
            string email = login_email.Text;
            string password = login_password.Text;


            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();

            SqlCommand command;

            command = new SqlCommand("Website_User_login", cnn)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };

            command.Parameters.Add(new SqlParameter("@email", email));
            command.Parameters.Add(new SqlParameter("@password", password));

            command.Parameters.Add("@user_id", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;
            command.Parameters.Add("@userType", System.Data.SqlDbType.VarChar, 64).Direction = System.Data.ParameterDirection.Output;
            int user_id = 0;
            string userType = "";
            // execute the command
            using (SqlDataReader readder = command.ExecuteReader())
            {
                user_id = Convert.ToInt32(command.Parameters["@user_id"].Value);
                userType = Convert.ToString(command.Parameters["@userType"].Value);
            }

            cnn.Close();

            if (user_id == -1)
            {
                Response.Write("<script>alert('Please Enter a correct email and password')</script>");
                return;
            }
            else
            {
                Session["ID"] = user_id;
                Session["userType"] = userType;

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

        }

        protected void back_to_register_button_click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}
