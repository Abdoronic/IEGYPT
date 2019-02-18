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

    public partial class Filter2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String s = Request.QueryString["e_id"];
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            string m = "select * from original_content o inner join content c on o.id=c.id where filter_status is null and review_status =1 ";
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
            SqlCommand cmd = new SqlCommand("Website_content_manager_filter_content", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@content_manager_id", Session["ID"]));
            cmd.Parameters.Add(new SqlParameter("@original_content", cid));
            int z;
            if (e.CommandName.Equals("accept"))
            {
                z = 1;
            }
            else
            {
                z = 0;
            }
            cmd.Parameters.Add(new SqlParameter("@status", z));

            cmd.Parameters.Add("@valid", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;
            int valid = 0;
            // execute the command
            using (SqlDataReader readder = cmd.ExecuteReader())
            {
                valid = Convert.ToInt32(cmd.Parameters["@valid"].Value);
            }

            cmd.ExecuteReader();

            if(valid == 0)
            {
                Response.Write("<script>alert('Choose a content with your type')</script>");
                cnn.Close();
                return;
            }

            Response.Redirect("Filter2.aspx");
        }
    }
}
