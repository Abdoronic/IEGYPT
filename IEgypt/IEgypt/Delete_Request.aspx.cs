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

    public partial class Delete_Request : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();
                int Viewer_id = (int)Session["ID"];
                SqlDataAdapter sqlda = new SqlDataAdapter("Select information from new_request NR Where NR.viewer_id = Viewer_id AND NR.accept_status is null", con);//viewer id is not correctly defined in this scope (as an integer value it cannot be used in a string)
                DataTable dtb1 = new DataTable();
                sqlda.Fill(dtb1);
                table1.DataBind();
                con.Close();
            }

        }


        protected void linkselect_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Delete_New_Request", con);
                    int Viewer_id = (int)Session["ID"];
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@request_id", Convert.ToInt32(sender));
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
