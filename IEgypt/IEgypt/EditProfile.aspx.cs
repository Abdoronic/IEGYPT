using System;
using System.Web;
using System.Web.UI;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


namespace IEgypt
{

    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String user = Convert.ToString(Session["ID"]);
            if(!int.TryParse(user, out int o))
            {
                Response.Redirect("login.aspx");
                return;
            }
           
        }

        public void do_edit_button_click(object sender, EventArgs args)
        {
            string email = edit_email.Text;
            string password = edit_password.Text;
            string firstname = edit_firstname.Text;
            string middlename = edit_middlename.Text;
            string lastname = edit_lastname.Text;
            string birth_year = edit_birth_year.Text;
            string birth_month = edit_birth_month.Text;
            string birth_day = edit_birth_day.Text;
            string working_place_name = edit_working_place_name.Text;
            string working_place_type = edit_working_place_type.Text;
            string wokring_place_description = edit_wokring_place_description.Text;
            string specilization = edit_specilization.Text;
            string portofolio_link = edit_portofolio_link.Text;
            string years_experience = edit_years_experience.Text;
            string hire_year = edit_hire_year.Text;
            string hire_month = edit_hire_month.Text;
            string hire_day = edit_hire_day.Text;
            string working_hours = edit_working_hours.Text;
            string payment_rate = edit_payment_rate.Text;


            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();

            SqlCommand command;

            command = new SqlCommand("Website_Edit_Profile", cnn)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };

            command.Parameters.Clear();

            command.Parameters.Add(new SqlParameter("@user_id", Convert.ToInt32(Session["ID"])));

            if (!email.Equals(""))
                command.Parameters.Add(new SqlParameter("@email", email));
            else
                command.Parameters.Add(new SqlParameter("@email", DBNull.Value));

            if (!password.Equals(""))
                command.Parameters.Add(new SqlParameter("@password", password));
            else
                command.Parameters.Add(new SqlParameter("@password", DBNull.Value));

            if (!firstname.Equals(""))
                command.Parameters.Add(new SqlParameter("@first_name", firstname));
            else
                command.Parameters.Add(new SqlParameter("@first_name", DBNull.Value));

            if (!middlename.Equals(""))
                command.Parameters.Add(new SqlParameter("@middle_name", middlename));
            else
                command.Parameters.Add(new SqlParameter("@middle_name", DBNull.Value));

            if (!lastname.Equals(""))
                command.Parameters.Add(new SqlParameter("@last_name", lastname));
            else
                command.Parameters.Add(new SqlParameter("@last_name", DBNull.Value));

            if (!birth_year.Equals("") || !birth_month.Equals("") || !birth_day.Equals(""))
                command.Parameters.Add(new SqlParameter("@birth_date", Convert.ToDateTime(birth_year + "-" + birth_month + "-" + birth_day)));
            else
                command.Parameters.Add(new SqlParameter("@birth_date", DBNull.Value));

            if (!working_place_name.Equals(""))
                command.Parameters.Add(new SqlParameter("@working_place_name", working_place_name));
            else
                command.Parameters.Add(new SqlParameter("@working_place_name", DBNull.Value));

            if (!working_place_type.Equals(""))
                command.Parameters.Add(new SqlParameter("@working_place_type", working_place_type));
            else
                command.Parameters.Add(new SqlParameter("@working_place_type", DBNull.Value));

            if (!wokring_place_description.Equals(""))
                command.Parameters.Add(new SqlParameter("@working_place_description", wokring_place_description));
            else
                command.Parameters.Add(new SqlParameter("@working_place_description", DBNull.Value));

            if (!specilization.Equals(""))
                command.Parameters.Add(new SqlParameter("@specialization", specilization));
            else
                command.Parameters.Add(new SqlParameter("@specialization", DBNull.Value));

            if (!portofolio_link.Equals(""))
                command.Parameters.Add(new SqlParameter("@portfolio_link", portofolio_link));
            else
                command.Parameters.Add(new SqlParameter("@portfolio_link", DBNull.Value));

            if (!years_experience.Equals(""))
                command.Parameters.Add(new SqlParameter("@years_of_experience", years_experience));
            else
                command.Parameters.Add(new SqlParameter("@years_of_experience", DBNull.Value));

            if (!hire_year.Equals("") || !hire_month.Equals("") || !hire_day.Equals(""))
                command.Parameters.Add(new SqlParameter("@hire_date", Convert.ToDateTime(hire_year + "-" + hire_month + "-" + hire_day)));
            else
                command.Parameters.Add(new SqlParameter("@hire_date", DBNull.Value));

            if (!working_hours.Equals(""))
                command.Parameters.Add(new SqlParameter("@working_hours", working_hours));
            else
                command.Parameters.Add(new SqlParameter("@working_hours", DBNull.Value));

            if (!payment_rate.Equals(""))
                command.Parameters.Add(new SqlParameter("@payment_rate", payment_rate));
            else
                command.Parameters.Add(new SqlParameter("@payment_rate", DBNull.Value));


            command.ExecuteNonQuery();

            Response.Write("<script>alert('Profile updated Successfully')</script>");

            cnn.Close();
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}
