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

    public partial class possible_contributers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;

            connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            //can't show all attributes i want to show
            string m = "-- get contributors and new requests which are done\n    select c.id contributor, nr.id newrequest\n    into temp11\n    from contributor c\n    inner join new_request nr on nr.contributer_id = c.id\n    inner join new_content nc on nc.new_request_id = nr.id\n\n\n-- get contributors and new requests which are done and not done\n    select c.id contributor, nr.id newrequest\n    into temp22\n    from contributor c\n    inner join new_request nr on nr.contributer_id = c.id\n\n--get contributors and new requests which not done\n    select contributor, newrequest\n    into temp33\n    from(select * from temp22 \n    except\n    select * from temp11) t\n\n-- contributors who cannot take more requests\n    select temp33.contributor\n    into temp44\n    from temp33\n    group by temp33.contributor\n    having COUNT(*) >= 3\n\n--contributors who can recive requests\n    select *\n    into temp55\n    from(select c.id from contributor c\n    except\n    select temp44.contributor from temp44) k\n\n    select temp55.id contributorid, count(*) as numofnewreq\n    into temp66\n    from content cont\n    inner join new_content nc on nc.id = cont.id\n    inner join new_request nr on nc.new_request_id = nr.id\n    right outer join temp55 on temp55.id = cont.contributer_id\n    group by temp55.id\n    order by AVG(DATEDIFF(DAY,nr.accept_date,cont.uploaded_at)), count(*) DESC\n\n    select CONCAT(U.first_name, ' ', U.middle_name, ' ', U.last_name) \n    AS 'Contributer Name', U.email AS 'Contributer Email', temp66.numofnewreq\n    FROM temp66\n    INNEr JOIN [user] U ON temp66.contributorid = U.id\n\n    drop table temp11\n    drop table temp22\n    drop table temp33\n    drop table temp44\n    drop table temp55\n    drop table temp66";
/*
             SqlCommand cmd = new SqlCommand(m, cnn);

            //SqlDataReader rdr = cmd.ExecuteReader();

            grid.EmptyDataText = "THE TABLE IS EMPTY";
            grid.DataSource = cmd.ExecuteReader();
            grid.DataBind();
            cnn.Close();
            */

            SqlDataAdapter sqlda = new SqlDataAdapter(m, cnn);
            DataTable dtb = new DataTable();
            sqlda.Fill(dtb);
            grid.DataSource = dtb;
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
