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

    public partial class contributorpart10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();

                con.Close();
            }

        }
       
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("contributorpart1.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("contributorpart2.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("contributorpart3.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("contributorpart4.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("contributorpart5.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("contributorpart6.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("contributorpart7.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("contributorpart8.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("contributorpart9.aspx");
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}
