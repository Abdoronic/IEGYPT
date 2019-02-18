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

    public partial class Existing_Request : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();
                int Viewer_id = (int)Session["ID"];
                SqlCommand cmd = new SqlCommand("Apply_Existing_Request", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter sqlda = new SqlDataAdapter("select category_type,subcategory_name, type,uploaded_at from (existing_request ER inner join original_content OC on ER.original_content_id = OC.id)  inner join content C on C.id = OC.id Where OC.rating = 4 OR OC.rating = 5", con);
                DataTable dtb1 = new DataTable();
                sqlda.Fill(dtb1);
                Table1.DataBind();
                cmd.Parameters.AddWithValue("@original_content_id", ItemID);
                cmd.Parameters.AddWithValue("@viewer_id", Viewer_id);
                con.Close();


            }
        }


        public int ItemID = 0;
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
