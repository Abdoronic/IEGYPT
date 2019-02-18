using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IEgypt
{

    public partial class existingRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            String s = Request.QueryString["e_id"];
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            string m = "SELECT o.id , count(e.id) as count_of_requests,c.link into temp FROM original_content o LEFT OUTER JOIN existing_request e on e.original_content_id = o.id inner join content c on c.id = o.id GROUP BY o.id,c.link order by count(e.id) SELECT temp.id, count_of_requests,link FROM temp order by count_of_requests DESC DROP TABLE temp";
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


        }
    }
}
