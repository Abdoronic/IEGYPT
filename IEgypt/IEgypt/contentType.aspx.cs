﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IEgypt
{

    public partial class contentType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String x = TextBox1.Text;

            String s = Request.QueryString["e_id"];

            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            SqlCommand cmd = new SqlCommand("Staff_Create_Type", cnn);

            // 2. set the command object so it knows to execute a stored procedure
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@type_name", x));
            SqlDataReader rdr = cmd.ExecuteReader();
            cnn.Close();

        }
        public void button2Clicked(object sender, EventArgs args)
        {
            Response.Redirect("Default.aspx");

        }
    }
}
