//Rademeyer, M - 34551344
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Assesment2
{
    public partial class Register : System.Web.UI.Page
    {
        public string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\rmorn\Desktop\Visual Studio 2\Assesment2\Assesment2\App_Data\Clients.mdf;Integrated Security=True";
        public DataSet ds;
        public SqlConnection conn;
        public SqlCommand comm;
        public SqlDataAdapter adapt;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUsernameUse.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                conn = new SqlConnection(conStr);
                string sql = $"SELECT count (*) as cnt FROM ClientData WHERE Username = '{txtUsername.Text}'";
                comm = new SqlCommand(sql, conn);
                conn.Open();
                if (comm.ExecuteScalar().ToString() == "1")
                {
                    lblUsernameUse.Visible = true;
                    lblUsernameUse.Text = "Username not available";
                }
                else
                {
                    conn = new SqlConnection(conStr);
                    conn.Open();
                    string sql2 = $"INSERT INTO ClientData (Username, Password) VALUES ('{txtUsername.Text}','{txtPassword.Text}') ";
                    adapt = new SqlDataAdapter();
                    comm = new SqlCommand(sql2, conn);
                    adapt.InsertCommand = comm;
                    adapt.InsertCommand.ExecuteNonQuery();
                    conn.Close();

                  

                    Response.Redirect("Login.aspx");

                }
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
                
            }
            
        }
    }
}