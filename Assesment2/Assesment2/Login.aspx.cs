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
    public partial class Login : System.Web.UI.Page
    {
        public string conStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\rmorn\Desktop\Visual Studio 2\Assesment2\Assesment2\App_Data\Clients.mdf;Integrated Security=True";
        public SqlConnection conn;
        public SqlCommand comm;
        public SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorMessage.Visible = false;
            txtUsername.Focus();
            if (!IsPostBack)
            {
                if (Request.Cookies["Username"] != null && Request.Cookies["Password"] != null)
                {
                    txtUsername.Text = Request.Cookies["Username"].Value;
                    txtPassword.Attributes["value"] = Request.Cookies["Password"].Value;
                    cbRemember.Checked = true;
                }
                else
                {
                    cbRemember.Checked = false;
                }

            }
            else
            {
                cbRemember.Checked = false;
            }
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            try
            {
                conn = new SqlConnection(conStr);

                conn.Open();
                string sql = $"Select Username, Password FROM ClientData WHERE Username = '{txtUsername.Text}'";
                comm = new SqlCommand(sql, conn);
                dr = comm.ExecuteReader();

                if (dr.HasRows)
                {
                    dr.Read();
                    string pass = dr.GetValue(1).ToString();
                    if (pass == txtPassword.Text)
                    {
                        Session["Username"] = txtUsername.Text;
                        Session["Password"] = txtPassword.Text;
                        if (cbRemember.Checked)
                        {
                         Response.Cookies["Username"].Expires = DateTime.Now.AddDays(2);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(2);
                        }
                         else
                         {
                         Response.Cookies["Username"].Expires = DateTime.Now.AddDays(-1);
                         Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
                        }
                        Response.Cookies["Username"].Value = txtUsername.Text;
                        Response.Cookies["Password"].Value = txtPassword.Text;
                        Response.Redirect("Workshop.aspx");
                    }
                    else
                    {
                        lblErrorMessage.Visible = true;
                        lblErrorMessage.Text = "Incorrect Password";
                    }
                }
                else
                {
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "Incorrect Username";
                }
            }
            catch (SqlException ex)
            {

                Response.Write(ex.Message);
            }
            
        }
    }
}