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

    public partial class Rate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();
                int Viewer_id = (int)Session["ID"];
                SqlCommand cmd = new SqlCommand("Select C.subcategory_name, C.[type], C.uploaded_at From original_content OC inner join content C on OC.id = C.id ", con);
                SqlDataReader sql = cmd.ExecuteReader();
                var dataTable = new DataTable();
                dataTable.Load(sql);
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
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
                    SqlCommand cmd = new SqlCommand("", con);
                    int Viewer_id = (int)Session["ID"];
                    cmd.CommandType = CommandType.StoredProcedure;
                    //cmd.Parameters.AddWithValue("@city", City.Text);
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {



        }
    }
}
