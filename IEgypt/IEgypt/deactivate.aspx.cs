using System;
using System.Web;
using System.Web.UI;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace IEgypt
{

    public partial class deactivate : System.Web.UI.Page
    {
        public void do_deactivate_button_click(object sender, EventArgs args)
        {
            string email = deactivate_email.Text;
            string password = deactivate_password.Text;


            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();

            SqlCommand command;

            command = new SqlCommand("Website_Deactivate_Profile", cnn)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };

            command.Parameters.Add(new SqlParameter("@email", email));
            command.Parameters.Add(new SqlParameter("@password", password));

            command.Parameters.Add("@verdict", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

            int verdict = 0;
            // execute the command
            using (SqlDataReader readder = command.ExecuteReader())
            {
                verdict = Convert.ToInt32(command.Parameters["@verdict"].Value);
            }

            cnn.Close();

            if (verdict == 0)
            {
                Response.Write("<script>alert('Please Enter a correct email and password')</script>");
                return;
            }
            else
            {
                Session["ID"] = "";
                Session["userType"] = "";
                Response.Redirect("Default.aspx");
            }

        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}
