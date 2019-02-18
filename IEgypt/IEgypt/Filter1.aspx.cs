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

    public partial class Filter1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String s = Request.QueryString["e_id"];
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            // when it take what ID then i can select only stuff related only to the same type which will be better
            string m = "select * from original_content o inner join content c on o.id=c.id where review_status is Null";
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
            String s = Request.QueryString["e_id"];
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            int index = Int32.Parse((string)e.CommandArgument);
            GridViewRow row = grid.Rows[index];
            int cid = Convert.ToInt32(row.Cells[0].Text);
            SqlCommand cmd = new SqlCommand("reviewer_filter_content", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@reviewer_id", Session["ID"]));
            cmd.Parameters.Add(new SqlParameter("@original_content", cid));
            int z = 1;
            if (e.CommandName.Equals("accept"))
            {
                z = 1;
            }
            else
            {
                z = 0;
            }
            cmd.Parameters.Add(new SqlParameter("@status", z));
            cmd.ExecuteReader();

            cnn.Close();
            Response.Redirect("Filter1.aspx");
        }
    }
}
