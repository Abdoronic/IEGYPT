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

    public partial class contributorpart5 : System.Web.UI.Page
    {
        public static int rid;
        public static string contenttype;
        public static string subcat;
        public static string cat;
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();

                SqlDataAdapter sqlda = new SqlDataAdapter("Select * from new_request nr inner join [user] u on u.id = nr.viewer_id where contributer_id = @given and NOT EXISTS (SELECT * FROM new_content nc WHERE nc.new_request_id = nr.id)", con);
                sqlda.SelectCommand.Parameters.AddWithValue("@given", Session["ID"]);
                DataTable dtb1 = new DataTable();
                sqlda.Fill(dtb1);
                table1.DataSource = dtb1;
                table1.DataBind();
            }

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();
                SqlDataAdapter sqlda0 = new SqlDataAdapter("Select * from content_type", con);
                DataTable dtb0 = new DataTable();
                sqlda0.Fill(dtb0);
                table2.DataSource = dtb0;
                table2.DataBind();

                SqlDataAdapter sqlda2 = new SqlDataAdapter("Select * from sub_category", con);
                DataTable dtb2 = new DataTable();
                sqlda2.Fill(dtb2);
                table3.DataSource = dtb2;
                table3.DataBind();

                SqlDataAdapter sqlda3 = new SqlDataAdapter("Select * from category", con);
                DataTable dtb3 = new DataTable();
                sqlda3.Fill(dtb3);
                table4.DataSource = dtb3;
                table4.DataBind();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            try
            {
                con.Open();

                SqlCommand cmd2 = new SqlCommand();
                cmd2 = new SqlCommand("Upload_New_Content", con);
                cmd2.Parameters.Add("@new_request_id", SqlDbType.Int).Value = rid;
                cmd2.Parameters.Add("@contributor_id", SqlDbType.Int).Value = Session["ID"];
                cmd2.Parameters.Add("@subcategory_name", SqlDbType.VarChar).Value = subcat;
                cmd2.Parameters.Add("@category_id", SqlDbType.VarChar).Value = cat;
                cmd2.Parameters.Add("@link", SqlDbType.VarChar).Value = TextBox4.Text;
                if (TextBox4.Text != "")
                {
                    cmd2.CommandType = CommandType.StoredProcedure;

                    cmd2.ExecuteNonQuery();
                    Label1.Text = "Operation done Successfully";
                }
                else
                {
                    Label1.Text = "please fill the URL box";
                }
                con.Close();
            }
            catch (Exception)
            {
                Label1.Text = "please subcategory matched with the category";
            }
        }



        protected void linkselect_Click(object sender, EventArgs e)
        {
            rid = Convert.ToInt32((sender as LinkButton).CommandArgument);

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                try
                {

                    Label2.Text = rid.ToString();
                }
                catch (Exception)
                {
                    Label2.Text = "please enter valid input";
                }
            }

        }

        protected void linkselect1_Click(object sender, EventArgs e)
        {
            contenttype = ((sender as LinkButton).CommandArgument);
        }

        protected void linkselect2_Click(object sender, EventArgs e)
        {

            subcat = ((sender as LinkButton).CommandArgument);


        }

        protected void linkselect3_Click(object sender, EventArgs e)
        {
            cat = ((sender as LinkButton).CommandArgument);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("contributorpart10.aspx");
        }
    }
}
