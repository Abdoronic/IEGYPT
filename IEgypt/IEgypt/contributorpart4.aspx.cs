using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace IEgypt
{

    public partial class contributorpart4 : System.Web.UI.Page
    {
        public static int Sendingtoid;
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();
                SqlDataAdapter sqlda = new SqlDataAdapter("Select * from [user] u inner join viewer v on u.id=v.id;", con);
                DataTable dtb1 = new DataTable();
                sqlda.Fill(dtb1);
                table1.DataSource = dtb1;
                table1.DataBind();
            }
        }




        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
                {

                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand();
                        cmd = new SqlCommand("Send_Message", con);
                        cmd.Parameters.Add("@msg_text", SqlDbType.Text).Value = TextBox2.Text;
                        cmd.Parameters.Add("@viewer_id", SqlDbType.Int).Value = Sendingtoid; ;
                        cmd.Parameters.Add("@contributor_id", SqlDbType.Int).Value = Session["ID"];
                        cmd.Parameters.Add("@sender_type", SqlDbType.Int).Value = 1;
                        cmd.Parameters.Add("@sent_at", SqlDbType.DateTime).Value = DateTime.Now;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.ExecuteNonQuery();
                        Label2.Text = "";
                        Label5.Text = "Sent Successfully";
                    }

                }
            }
            catch (Exception)
            {
                Label2.Text = "please enter valid input";
            }

        }

        protected void linkselect_Click(object sender, EventArgs e)
        {
            Sendingtoid = Convert.ToInt32((sender as LinkButton).CommandArgument);

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                try
                {
                    Label3.Text = "sending to :" + "user with id";
                    Label1.Text = Sendingtoid.ToString();
                }
                catch (Exception)
                {
                    Label2.Text = "please enter valid input";
                }
            }
        }

        protected void linkselect_Click1(object sender, EventArgs e)
        {

        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("select email , [text] , viewer_id, sent_at  from [message] m inner join [user] u on u.id = m.viewer_id where sender_type = 0 and contributer_id =@given;", con);
                cmd.Parameters.AddWithValue("@given", SqlDbType.Int).Value = Session["ID"];

                SqlDataReader reader = cmd.ExecuteReader();

                String tempo = "";

                while (reader.Read())
                {
                    tempo = "From ";
                    tempo += reader["email"].ToString();
                    tempo += " TEXT ";
                    tempo += reader["text"].ToString();
                    tempo += "<br/>";

                    String insert = "update message set read_at=@in1 ,read_status = 1 where contributer_id = 7 and viewer_id = @given1 and sender_type=0 and sent_at=@given2 ";
                    SqlCommand cmd2 = new SqlCommand(insert, con);
                    cmd2.Parameters.AddWithValue("@given1", int.Parse(reader["viewer_id"].ToString()));
                    cmd2.Parameters.AddWithValue("@given2", SqlDbType.DateTime).Value = reader["sent_at"];
                    cmd2.Parameters.AddWithValue("@in1", SqlDbType.DateTime).Value = DateTime.Now;
                    cmd2.ExecuteNonQuery();

                }
                con.Close();
                Label4.Text = tempo;



            }

        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("contributorpart10.aspx");
        }
    }
}
