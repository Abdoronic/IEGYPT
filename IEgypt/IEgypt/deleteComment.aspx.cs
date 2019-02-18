using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace IEgypt
{

    public partial class deleteComment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            String s = Request.QueryString["e_id"];
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            string m = "select * from comment c inner join content con on con.id=c.original_content_id";
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
            SqlCommand cmd = new SqlCommand("Delete_Comment", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@viewer_id", Convert.ToInt32(row.Cells[0].Text)));
            cmd.Parameters.Add(new SqlParameter("@original_content_id", Convert.ToInt32(row.Cells[1].Text)));
            cmd.Parameters.Add(new SqlParameter("@written_time", Convert.ToDateTime(row.Cells[3].Text).ToString("yyyy-MM-dd HH:mm:ss.fff")));
            SqlDataReader rdr = cmd.ExecuteReader();

            System.Diagnostics.Debug.Print(row.Cells[0].Text);
            System.Diagnostics.Debug.Print(row.Cells[1].Text);
            System.Diagnostics.Debug.Print(Convert.ToDateTime(row.Cells[3].Text).ToString("yyyy-MM-dd HH:mm:ss.fff"));
            cnn.Close();
            Response.Redirect("deleteComment.aspx");
        }
    }
}
