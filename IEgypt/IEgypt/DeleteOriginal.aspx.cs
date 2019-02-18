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

    public partial class DeleteOriginal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            String s = Request.QueryString["e_id"];
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            string m = "select * from content c inner join original_content o on c.id=o.id";
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
            SqlCommand cmd = new SqlCommand("Delete_Original_Content", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@content_id", Convert.ToInt32(row.Cells[0].Text)));
            SqlDataReader rdr = cmd.ExecuteReader();
            cnn.Close();
            Response.Redirect("DeleteOriginal.aspx");
        }
    }
}
