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
    public partial class contributorpart7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();

                SqlDataAdapter sqlda = new SqlDataAdapter("select * from event e inner join  announcement a on e.notification_object_id = a. notification_object_id and a.notified_person_id=@given;", con);
                sqlda.SelectCommand.Parameters.Add("@given", SqlDbType.Int).Value = Session["ID"];

                DataTable dtb1 = new DataTable();
                sqlda.Fill(dtb1);
                table1.DataSource = dtb1;
                table1.DataBind();
            }

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();

                SqlDataAdapter sqlda = new SqlDataAdapter("select * from new_request e inner join  announcement a on e.notif_obj_id = a. notification_object_id and a.notified_person_id=@given inner join [user] u on u.id=viewer_id ;", con);
                sqlda.SelectCommand.Parameters.Add("@given", SqlDbType.Int).Value = Session["ID"];

                DataTable dtb1 = new DataTable();
                sqlda.Fill(dtb1);
                table2.DataSource = dtb1;
                table2.DataBind();
            }

        }






        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("contributorpart10.aspx");
        }
    }
}
