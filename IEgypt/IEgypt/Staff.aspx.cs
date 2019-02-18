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

    public partial class Staff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void backClicked(object sender, EventArgs args)
        {
            Response.Redirect("Default.aspx");
        }

        public void button2Clicked(object sender, EventArgs args)
        {

            String s = Request.QueryString["e_id"];

            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();

            String x;
            x = DropDownList1.SelectedItem.Text;


            if (x.Equals("Filter original content"))
            {
                if (Convert.ToString(Session["userType"]).Equals("Authorized Reviewer"))
                    Response.Redirect("Filter1.aspx");
                else
                    Response.Redirect("Filter2.aspx");
            }

            if (x.Equals("New category"))
            {
                Response.Redirect("category.aspx");
            }
            if (x.Equals("New Type"))
            {
                Response.Redirect("contentType.aspx");
            }
            if (x.Equals("Show existing requests"))
            {
                Response.Redirect("existingRequests.aspx");
            }
            if (x.Equals("Show number requests"))
            {
                Response.Redirect("Number_of_new_existing.aspx");
            }
            if (x.Equals("Notifications"))
            {
                Response.Redirect("notifications.aspx");
            }
            if (x.Equals("Delete comment"))
            {
                Response.Redirect("deleteComment.aspx");
            }
            if (x.Equals("Delete Original Contnet"))
            {
                Response.Redirect("DeleteOriginal.aspx");
            }
            if (x.Equals("Delete New Contnet"))
            {
                Response.Redirect("DeleteNewContent.aspx");
            }
            if (x.Equals("Order contributors"))
            {
                Response.Redirect("possible_contributers.aspx");
            }
            if (x.Equals("Assign contributor"))
            {
                Response.Redirect("Assign_Contributor.aspx");
            }

        }
    }
}
