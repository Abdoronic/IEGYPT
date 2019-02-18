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

    public partial class Adevertisment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Create_Ads", con);
                int Viewer_id = (int)Session["ID"];
                try
                {
                    SqlCommand AD = new SqlCommand("Create_Ads", con);
                    AD.CommandType = CommandType.StoredProcedure;
                    AD.Parameters.AddWithValue("@viewer_id", Viewer_id);
                    AD.Parameters.AddWithValue("@description", Description.Text);
                    AD.Parameters.Add("@location", Location.Text);
                    AD.ExecuteNonQuery();
                }
                catch
                {

                }
            }

            //Response.Redirect("Default.aspx?e_id=" + e_id);
        }


    }
}
