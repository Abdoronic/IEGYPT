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

    public partial class contributorpart3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();
                SqlDataAdapter sqlda = new SqlDataAdapter("Receive_New_Requests_foranyone", con);
                sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlda.SelectCommand.Parameters.Add("@contributor_id", SqlDbType.VarChar).Value = Session["ID"];
                DataTable dtb1 = new DataTable();
                sqlda.Fill(dtb1);
                table1.DataSource = dtb1;
                table1.DataBind();
            }

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();
                SqlDataAdapter sqlda = new SqlDataAdapter("Receive_New_Requests_me", con);
                sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlda.SelectCommand.Parameters.Add("@contributor_id", SqlDbType.VarChar).Value = Session["ID"];
                DataTable dtb1 = new DataTable();
                sqlda.Fill(dtb1);
                table2.DataSource = dtb1;
                table2.DataBind();
            }
        }

        protected void linkselect_Click1(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as LinkButton).CommandArgument);

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                try
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand();
                    cmd = new SqlCommand("Respond_New_Request", con);
                    cmd.Parameters.Add("@contributor_id", SqlDbType.Int).Value = Session["ID"];
                    cmd.Parameters.Add("@accept_status", SqlDbType.Int).Value = 1;
                    cmd.Parameters.Add("@request_id", SqlDbType.Int).Value = id;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                    Label1.Text = "Operation done Successfully";
                }
                catch (Exception)
                {

                }
            }

        }



        protected void Linkselect2_Click1(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as LinkButton).CommandArgument);

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                try
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand();
                    cmd = new SqlCommand("Respond_New_Request", con);
                    cmd.Parameters.Add("@contributor_id", SqlDbType.Int).Value = Session["ID"];
                    cmd.Parameters.Add("@accept_status", SqlDbType.Int).Value = 0;
                    cmd.Parameters.Add("@request_id", SqlDbType.Int).Value = id;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                    Label1.Text = "Operation done Successfully";
                }
                catch (Exception)
                {

                }
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("contributorpart10.aspx");
        }
    }
}
