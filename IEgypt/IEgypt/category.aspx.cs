using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IEgypt
{

    public partial class category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String x = TextBox1.Text;
            String y = TextBox2.Text;

            String s = Request.QueryString["e_id"];

            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            SqlCommand cmd = new SqlCommand("Staff_Create_Category", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@category_name", x));
            SqlDataReader rdr = cmd.ExecuteReader();
            cnn.Close();

        }
        public void button2Clicked(object sender, EventArgs args)
        {

            String x = TextBox1.Text;
            String y = TextBox2.Text;

            String s = Request.QueryString["e_id"];

            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            SqlCommand cmd = new SqlCommand("Staff_Create_Subcategory", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@category_name", x));
            cmd.Parameters.Add(new SqlParameter("@subcategory_name", y));
            SqlDataReader rdr = cmd.ExecuteReader();
            cnn.Close();
            Response.Redirect("Default.aspx");

        }
    }
}
