using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace IEgypt
{

    public partial class Edit_and_Delete_Comments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();
                int Viewer_id = (int)Session["ID"];
                SqlDataAdapter sqlda = new SqlDataAdapter("select text From comment C inner join viewer V on C.viewer_id = V.id", con);
                DataTable dtb1 = new DataTable();
                sqlda.Fill(dtb1);
                table1.DataBind();
                con.Close();


            }
        }
        int ItemID = 0;
        protected void linkselect_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();
                ItemID = Convert.ToInt32(sender);
                con.Close();
            }

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {

                con.Open();
                ItemID = Convert.ToInt32(sender);
                con.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                {
                    con.Open();
                    int Viewer_id = (int)Session["ID"];
                    SqlCommand cms = new SqlCommand("Comment_Time", con);
                    cms.CommandType = CommandType.StoredProcedure;
                    cms.Parameters.AddWithValue("@viewer_id", Viewer_id);
                    cms.Parameters.AddWithValue("@original_content_id", ItemID);
                    cms.Parameters.Add("@date", SqlDbType.DateTime).Direction = ParameterDirection.Output;
                    cms.Parameters.Add("@text", SqlDbType.Text).Direction = ParameterDirection.Output;
                    cms.ExecuteNonQuery();
                    DateTime date = DateTime.Now;
                    using (SqlDataReader rdr = cms.ExecuteReader())
                    {
                        date = Convert.ToDateTime(cms.Parameters["@date"].Value);
                    }
                    SqlCommand cmd = new SqlCommand("Delete_Comment", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@viewer_id", Viewer_id);
                    cmd.Parameters.AddWithValue("@original_content_id", ItemID);
                    cmd.Parameters.AddWithValue("@written_time", date);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                {
                    con.Open();
                    int Viewer_id = (int)Session["ID"];
                    SqlCommand cms = new SqlCommand("Comment_Time", con);
                    cms.CommandType = CommandType.StoredProcedure;
                    cms.Parameters.AddWithValue("@viewer_id", Viewer_id);
                    cms.Parameters.AddWithValue("@original_content_id", ItemID);
                    cms.Parameters.Add("@date", SqlDbType.DateTime).Direction = ParameterDirection.Output;
                    cms.Parameters.Add("@text", SqlDbType.Text).Direction = ParameterDirection.Output;
                    cms.ExecuteNonQuery();
                    String text = " ";
                    DateTime date = DateTime.Now;
                    using (SqlDataReader rdr = cms.ExecuteReader())
                    {
                        text = Convert.ToString(cms.Parameters["@text"].Value);
                        date = Convert.ToDateTime(cms.Parameters["@date"].Value);
                    }
                    SqlCommand cmd = new SqlCommand("Edit_Comment", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@comment_text", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@viewer_id", Viewer_id);
                    cmd.Parameters.AddWithValue("@orginal_content_id", ItemID);
                    cmd.Parameters.AddWithValue("@last_written_time", date);
                    cmd.Parameters.AddWithValue("@updated_written_time", DateTime.Now);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Default.aspx?e_id=" + e_id);

        }
    }
}
