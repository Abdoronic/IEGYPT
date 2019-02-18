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

    public partial class contributorpart8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();

                SqlDataAdapter sqlda = new SqlDataAdapter("Select * from event", con);
                DataTable dtb1 = new DataTable();
                sqlda.Fill(dtb1);
                table1.DataSource = dtb1;
                table1.DataBind();
            }
        }





        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("contributorpart10.aspx");
        }
    }
}
