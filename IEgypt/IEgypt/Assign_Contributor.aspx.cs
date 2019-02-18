using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Configuration;

namespace IEgypt
{

    public partial class Assign_Contributor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            String s = Request.QueryString["e_id"];
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            string m = "select c.id, n.id as bb, n.information,u.email from contributor c right outer join new_request n on n.contributer_id is null inner join [user] u on u.id=c.id";
            SqlCommand r = new SqlCommand(m, cnn);

            grid.EmptyDataText = "THE TABLE IS EMPTY";
            grid.DataSource = r.ExecuteReader();
            grid.DataBind();
            cnn.Close();
        }
        public void button2Clicked(object sender, EventArgs args)
        {
            Response.Redirect("Staff.aspx");
        }
        protected void grid_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int Index = Int32.Parse((String)e.CommandArgument);
            GridViewRow row = grid.Rows[Index];

            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            SqlCommand cmd = new SqlCommand("Assign_New_Request", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@request_id", Convert.ToInt32(row.Cells[1].Text)));
            cmd.Parameters.Add(new SqlParameter("@contributor_id", Convert.ToInt32(row.Cells[0].Text)));
            SqlDataReader rdr = cmd.ExecuteReader();
            cnn.Close();
            Response.Redirect("Assign_Contributor.aspx");
        }
    }
}
