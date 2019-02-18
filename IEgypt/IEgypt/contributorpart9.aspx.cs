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

    public partial class contributorpart9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();

                SqlDataAdapter sqlda = new SqlDataAdapter("Select * from advertisement inner join [user] u on u.id=viewer_id and event_id is null", con);
                DataTable dtb1 = new DataTable();
                sqlda.Fill(dtb1);
                table1.DataSource = dtb1;
                table1.DataBind();
                con.Close();
            }

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();

                SqlDataAdapter sqlda = new SqlDataAdapter("Select * from advertisement inner join [user] u on u.id=viewer_id inner join event e on e.id = event_id", con);
                DataTable dtb1 = new DataTable();
                sqlda.Fill(dtb1);
                table2.DataSource = dtb1;
                table2.DataBind();
                con.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("contributorpart10.aspx");
        }
    }
}
