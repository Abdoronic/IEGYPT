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

    public partial class Create_Event : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Confirm_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Viewer_Create_Event", con);
                    int Viewer_id = (int)Session["ID"];
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@city", City.Text);
                    cmd.Parameters.AddWithValue("@description", Description.Text);
                    cmd.Parameters.AddWithValue("@time", Time.Text);
                    cmd.Parameters.AddWithValue("@entertainer", Entertainer.Text);
                    cmd.Parameters.AddWithValue("@viewer_id", Viewer_id);
                    cmd.Parameters.AddWithValue("@location", Location.Text);
                    cmd.Parameters.Add("@event_id", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.ExecuteNonQuery();
                    int contractID = 0;
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        contractID = Convert.ToInt32(cmd.Parameters["@event_id"].Value);
                    }

                    if (!Photo.Text.Equals(""))
                    {
                        SqlCommand PL = new SqlCommand("Viewer_Create_Event_Photos", con);
                        PL.CommandType = CommandType.StoredProcedure;
                        PL.Parameters.AddWithValue("@Event_ID", contractID);
                        PL.Parameters.AddWithValue("@Link", Photo.Text);
                        PL.ExecuteNonQuery();
                    }
                    if (!Video.Text.Equals(""))
                    {
                        SqlCommand VL = new SqlCommand("Viewer_Create_Event_Video", con);
                        VL.CommandType = CommandType.StoredProcedure;
                        VL.Parameters.AddWithValue("@Event_ID", contractID);
                        VL.Parameters.AddWithValue("@Link", Video.Text);
                        VL.ExecuteNonQuery();
                    }
                    if (CheckBoxAD.Checked)
                    {
                        SqlCommand AD = new SqlCommand("Create_Ads", con);
                        AD.CommandType = CommandType.StoredProcedure;
                        AD.Parameters.AddWithValue("@viewer_id", Viewer_id);
                        AD.Parameters.AddWithValue("@description", Description.Text);
                        AD.Parameters.AddWithValue("@location", Location.Text);
                        AD.ExecuteNonQuery();
                    }
                    con.Close();
                    //Response.Redirect("Default.aspx?e_id=" + e_id);
                }
                catch (Exception)
                {

                }
            }

        }
    }
}
