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

    public partial class Apply_New_Request : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Confirm_Click(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();
                int contributor_id = 0;
                if (!email.Text.Equals(""))
                {
                    SqlCommand cms = new SqlCommand("Contributorid_Extractor", con);
                    cms.Parameters.AddWithValue("@contributor_email", email.Text);
                    cms.Parameters.Add("@contid", SqlDbType.Int).Direction = ParameterDirection.Output;
                    using (SqlDataReader rdr = cms.ExecuteReader())
                    {
                        contributor_id = Convert.ToInt32(cms.Parameters["@contid"].Value);
                    }
                    int Viewer_id = (int)Session["ID"];
                    SqlCommand cmd = new SqlCommand("Apply_New_Request", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@information", info.Text);
                    cmd.Parameters.AddWithValue("@contributor_id", contributor_id);
                    cmd.Parameters.AddWithValue("@Viewer_id", Viewer_id);
                    cmd.ExecuteNonQuery();
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("Apply_New_Request", con);
                    int Viewer_id = (int)Session["ID"];
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@information", info.Text);
                    cmd.Parameters.AddWithValue("@contributor_id", null);
                    cmd.Parameters.AddWithValue("@Viewer_id", Viewer_id);
                    cmd.ExecuteNonQuery();
                }
                con.Close();
                //Response.Redirect("Default.aspx?e_id=" + e_id);


            }
                       
        }
    }
}
