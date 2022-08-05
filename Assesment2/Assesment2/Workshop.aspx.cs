//Rademeyer, M - 34551344
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Assesment2
{
    public partial class Workshop : System.Web.UI.Page
    {
        public string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\rmorn\Desktop\Visual Studio 2\Assesment2\Assesment2\App_Data\Clients.mdf;Integrated Security=True";
        public DataSet ds;
        public SqlConnection conn;
        public SqlCommand comm;
        public SqlDataAdapter adapt;
        public String java, cs, cpp;

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
          Response.Redirect("Login.aspx");
            
                

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                lblHeadingMessage.Text = "Welcome " + Session["Username"];
                try
                {
                    conn = new SqlConnection(conStr);
                    conn.Open();
                    string username = Session["Username"].ToString();
                    string sql = $"SELECT Username,WorkshopDate,Java,CSharp,CPP FROM ClientData WHERE Username = '{username}'";
                    ds = new DataSet();
                    adapt = new SqlDataAdapter();
                    comm = new SqlCommand(sql,conn);
                    adapt.SelectCommand = comm;
                    adapt.Fill(ds);

                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    conn.Close();
                
                }
                catch (SqlException ex)
                {

                 Console.WriteLine(ex.Message);
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

           
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            

            if (RadList1.SelectedIndex == 0)
            {
                java = "true";
                cs = "false";
                cpp = "false";

            }
            else if (RadList1.SelectedIndex == 1)
            {
                cs = "true";
                java = "false";
                cpp = "false";
            }
            else if (RadList1.SelectedIndex == 2)
            {
                cpp = "true";
                java = "false";
                cs = "false";
            }

            if (Session["Username"] != null)
            {
                try
                {
                    conn = new SqlConnection(conStr);

                    conn.Open();
                    DateTime dt = Calendar1.SelectedDate;
                    string sql = $"UPDATE ClientData SET WorkshopDate = '{dt.ToShortDateString()}', Java = '{java}', CSharp = '{cs}', CPP = '{cpp}' WHERE Username = '{Session["Username"]}' AND Password = '{Session["Password"]}' ";
                    comm = new SqlCommand(sql,conn);
                    comm.ExecuteNonQuery();
                    conn.Close();

                    conn.Open();
                    string username = Session["Username"].ToString();
                    string sql2 = $"SELECT Username,WorkshopDate,Java,CSharp,CPP FROM ClientData WHERE Username = '{username}'";
                    ds = new DataSet();
                    adapt = new SqlDataAdapter();
                    comm = new SqlCommand(sql2, conn);
                    adapt.SelectCommand = comm;
                    adapt.Fill(ds);

                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    conn.Close();
                }
                catch (SqlException ex)
                {

                    Console.WriteLine(ex.Message);
                }
            }
                
        }
    }
}