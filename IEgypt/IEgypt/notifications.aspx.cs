using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IEgypt
{

    public partial class notifications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String s = Request.QueryString["e_id"];
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            string id = Convert.ToString(Session["ID"]);
            string m = "select * from announcement a inner join event e on a.notification_object_id=e.notification_object_id inner join staff s on s.notified_id = a.notified_person_id where s.id=" + id;
            SqlCommand r = new SqlCommand(m, cnn);
            grid.DataSource = r.ExecuteReader();
            grid.DataBind();

            grid.EmptyDataText = "THE TABLE IS EMPTY";
            cnn.Close();


            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            SqlCommand cmd = new SqlCommand("select * from announcement a inner join event e on a.notification_object_id=e.notification_object_id inner join staff s on s.notified_id = a.notified_person_id where s.id=" + id, cnn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {


                SqlCommand cmd2 = new SqlCommand("update_date", cnn);
                cmd2.CommandType = System.Data.CommandType.StoredProcedure;
                cmd2.Parameters.AddWithValue("@id", reader["id"]);
                cmd2.ExecuteReader();

            }

            cnn.Close();
        }
        public void button2Clicked(object sender, EventArgs args)
        {
            Response.Redirect("Staff.aspx");
        }
        protected void grid_RowCommand(object sender, GridViewCommandEventArgs e)
        {


        }
    }
}
