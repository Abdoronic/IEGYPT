using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace IEgypt
{

    public partial class contributorpart6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();

                SqlDataAdapter sqlda = new SqlDataAdapter("Select * from content c inner join original_content o on c.id = o.id where contributer_id = @given and review_status is null and filter_status is null ", con);
                sqlda.SelectCommand.Parameters.AddWithValue("@given", Session["ID"]);
                DataTable dtb1 = new DataTable();
                sqlda.Fill(dtb1);
                table1.DataSource = dtb1;
                table1.DataBind();
                con.Close();
            }

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();
                SqlDataAdapter sqlda2 = new SqlDataAdapter("Select * from content c inner join new_content  o on c.id = o.id where contributer_id = @given ", con);
                sqlda2.SelectCommand.Parameters.AddWithValue("@given", Session["ID"]);
                DataTable dtb2 = new DataTable();
                sqlda2.Fill(dtb2);
                table2.DataSource = dtb2;
                table2.DataBind();

                con.Close();
            }







        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();
                //here change el 7
                String insert = "Select * from content where contributer_id=@g";
                SqlCommand cmd = new SqlCommand(insert, con);
                cmd.Parameters.Add("@g", SqlDbType.Int).Value = Session["ID"];

                SqlDataReader reader = cmd.ExecuteReader();

                String tempo = "";

                while (reader.Read())
                {
                    tempo += reader["id"].ToString() + " ";
                    tempo += reader["link"].ToString() + " ";
                    tempo += reader["uploaded_at"].ToString() + " ";
                    tempo += reader["contributer_id"].ToString() + " ";
                    tempo += reader["category_type"].ToString() + " ";
                    tempo += reader["subcategory_name"].ToString() + " ";
                    tempo += "<br/>";
                }
                Label1.Text = tempo;
                con.Close();
            }
        }



        protected void linkselect_Click(object sender, EventArgs e)
        {
            Int32 did = Convert.ToInt32((sender as LinkButton).CommandArgument);

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd2 = new SqlCommand();
                    cmd2 = new SqlCommand("Delete_Content_m", con);
                    cmd2.Parameters.Add("@content_id", SqlDbType.Int).Value = did;
                    cmd2.CommandType = CommandType.StoredProcedure;

                    cmd2.ExecuteNonQuery();

                    Label3.Text = "Deleted Successfully";
                    con.Close();
                }
                catch (Exception)
                {
                    Label2.Text = "please enter valid input";
                }
            }

        }





        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("contributorpart10.aspx");
        }
    }
}
