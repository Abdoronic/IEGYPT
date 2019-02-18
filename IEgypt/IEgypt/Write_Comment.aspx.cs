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

    public partial class Write_Comment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("Write_Comment", con);
                int Viewer_id = (int)Session["ID"];
                SqlDataAdapter sqlda = new SqlDataAdapter("Select subcategory_name, category_type, type, uploaded_at From original_content OC inner join content C on OC.id = C.id  ", con);
                DataTable dtb1 = new DataTable();
                sqlda.Fill(dtb1);
                table1.DataBind();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@comment_text", comment.Text);
                cmd.Parameters.AddWithValue("@viewer_id", Viewer_id);
                cmd.Parameters.AddWithValue("@original_conent_id", ItemID);
                cmd.Parameters.AddWithValue("@in1", SqlDbType.DateTime).Value = DateTime.Now;
                DateTime Time = Convert.ToDateTime(cmd.Parameters["@in1"].Value);
                cmd.Parameters.AddWithValue("@written_time", Time);

            }
        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        int ItemID = 0;
        protected void linkselect_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                {
                    con.Open();
                    ItemID = Convert.ToInt32(sender);
                    con.Close();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Default.aspx?e_id=" + e_id);

        }
    }
}
