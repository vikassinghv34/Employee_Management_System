using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace tymsc_exam
{
    public partial class login1 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBEmployeeConnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            SqlCommand emplogincmd = new SqlCommand("select UserName,Password,Role from tblLogin where UserName=@username and Password=@password and Role=@role",conn);
            emplogincmd.Parameters.AddWithValue("username", username.Text);
            emplogincmd.Parameters.AddWithValue("password", password.Text);
            emplogincmd.Parameters.AddWithValue("role", "std");

            SqlCommand adminlogincmd = new SqlCommand("select UserName, Password, Role from tblLogin where UserName=@username and Password=@password and Role=@role", conn);
            adminlogincmd.Parameters.AddWithValue("username", username.Text);
            adminlogincmd.Parameters.AddWithValue("password", password.Text);
            adminlogincmd.Parameters.AddWithValue("role", "admin");

            conn.Open();

            SqlDataReader emploginsdr = emplogincmd.ExecuteReader();
            SqlDataReader adminloginsdr = adminlogincmd.ExecuteReader();

            if (emploginsdr.HasRows)
            {
                Session["username"] = username.Text;
                Session["role"] = "std";
                Response.Redirect("employeehome.aspx");
            }
            else if (adminloginsdr.HasRows)
            {
                Session["username"] = username.Text;
                Session["role"] = "admin";
                Response.Redirect("adminhome.aspx");
            }
            else
            {
                Label1.Text = "Username or password is incorrect.";
            }
            conn.Close();
        }
    }
}