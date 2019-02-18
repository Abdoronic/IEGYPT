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

    public partial class Number_of_new_existing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            //can't show all attributes i want to show
            SqlCommand cmd = new SqlCommand("Workingplace_Category_Relation", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            grid.EmptyDataText = "THE TABLE IS EMPTY";
            grid.DataSource = cmd.ExecuteReader();
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
