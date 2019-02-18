using System;
using System.Web;
using System.Web.UI;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace IEgypt
{

    public partial class Register : System.Web.UI.Page
    {
        public void do_register_button_click(object sender, EventArgs args)
        {
            string userType = register_userType.SelectedValue;
            string email = register_email.Text;
            string password = register_password.Text;
            string firstname = register_firstname.Text;
            string middlename = register_middlename.Text;
            string lastname = register_lastname.Text;
            string birth_year = register_birth_year.Text;
            string birth_month = register_birth_month.Text;
            string birth_day = register_birth_day.Text;
            string working_place_name = register_working_place_name.Text;
            string working_place_type = register_working_place_type.Text;
            string wokring_place_description = register_wokring_place_description.Text;
            string specilization = register_specilization.Text;
            string portofolio_link = register_portofolio_link.Text;
            string years_experience = register_years_experience.Text;
            string hire_year = register_hire_year.Text;
            string hire_month = register_hire_month.Text;
            string hire_day = register_hire_day.Text;
            string working_hours = register_working_hours.Text;
            string payment_rate = register_payment_rate.Text;

            bool valid = true;

            if (userType.Equals("-1") || email == null || password == null)
                valid = false;
            if (firstname == null || middlename == null || lastname == null)
                valid = false;
            if (birth_day == null || !int.TryParse(birth_day, out int o))
                valid = false;
            if (birth_month == null || !int.TryParse(birth_month, out o))
                valid = false;
            if (birth_year == null || !int.TryParse(birth_year, out o))
                valid = false;

            if(userType == "Viewer")
            {
                if (working_place_name == null || working_place_type == null || wokring_place_description == null)
                    valid = false;
            } else if(userType == "Contributor")
            {
                if (specilization == null || portofolio_link == null)
                    valid = false;
                if (years_experience == null || !int.TryParse(years_experience, out o))
                    valid = false;
            }
            else
            {
                if (hire_day == null || !int.TryParse(hire_day, out o))
                    valid = false;
                if (hire_month == null || !int.TryParse(hire_month, out o))
                    valid = false;
                if (hire_year == null || !int.TryParse(hire_year, out o))
                    valid = false;
                if (working_hours == null || !int.TryParse(working_hours, out o))
                    valid = false;
                if (payment_rate == null || !double.TryParse(payment_rate, out double d))
                    valid = false;
            }

            if (!valid)
            {
                Response.Write("<script>alert('Please Fill in the all fields Correctly ')</script>");
                return;
            }

            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();

            SqlCommand command;

            command = new SqlCommand("Website_Register_User", cnn)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };

            command.Parameters.Add(new SqlParameter("@usertype", userType));
            command.Parameters.Add(new SqlParameter("@email", email));
            command.Parameters.Add(new SqlParameter("@password", password));
            command.Parameters.Add(new SqlParameter("@firstname", firstname));
            command.Parameters.Add(new SqlParameter("@middlename", middlename));
            command.Parameters.Add(new SqlParameter("@lastname", lastname));
            command.Parameters.Add(new SqlParameter("@birth_date", Convert.ToDateTime(birth_year + "-" + birth_month + "-" + birth_day)));
            command.Parameters.Add(new SqlParameter("@working_place_name", working_place_name));
            command.Parameters.Add(new SqlParameter("@working_place_type", working_place_type));
            command.Parameters.Add(new SqlParameter("@wokring_place_description", wokring_place_description));
            command.Parameters.Add(new SqlParameter("@specilization", specilization));
            command.Parameters.Add(new SqlParameter("@portofolio_link", portofolio_link));
            command.Parameters.Add(new SqlParameter("@years_experience", years_experience));
            if(userType != "Viewer" && userType != "Contributor")
                command.Parameters.Add(new SqlParameter("@hire_date", Convert.ToDateTime(hire_year + "-" + hire_month + "-" + hire_day)));
            else
                command.Parameters.Add(new SqlParameter("@hire_date", Convert.ToDateTime("1900" + "-" + "1" + "-" + "1")));
            command.Parameters.Add(new SqlParameter("@working_hours", working_hours));
            command.Parameters.Add(new SqlParameter("@payment_rate", payment_rate));

            command.Parameters.Add("@user_id", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;
            int user_id = 0;
            // execute the command
            using (SqlDataReader readder = command.ExecuteReader())
            {
                user_id = Convert.ToInt32(command.Parameters["@user_id"].Value);
            }

            cnn.Close();

            if(user_id == -1)
            {
                Response.Write("<script>alert('Please Enter a unique Email')</script>");
                return;
            }
            else
            {
                Session["ID"] = user_id;
                Session["userType"] = userType;

                if (userType.Equals("Viewer"))
                {
                    Response.Redirect("Viewer.aspx");

                } else if(userType.Equals("Contributor"))
                {
                    Response.Redirect("contributorpart10.aspx");
                }
                else
                {
                    Response.Redirect("Staff.aspx");
                }
            }

        }

        protected void back_to_login_button_click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }


        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }


    }
}
