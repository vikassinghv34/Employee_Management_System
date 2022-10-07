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
    public partial class registration1 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBEmployeeConnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnregister_Click(object sender, EventArgs e)
        {
            SqlCommand regcmd = new SqlCommand("insert into tblEmp (StdName,StdFaculty,StdDepartment,StdDateOfBirth,StdPRN) values(@stdname,@stdfaculty,@stddepartment,@stddob,@stdprn)",conn);
            regcmd.Parameters.AddWithValue("stdname", stdname.Text);
            regcmd.Parameters.AddWithValue("stdfaculty", stdfaculty.SelectedValue);
            regcmd.Parameters.AddWithValue("stddepartment", stddepartment.SelectedValue);
            regcmd.Parameters.AddWithValue("stddob", stddob.Text);
            regcmd.Parameters.AddWithValue("stdprn", stdprn.Text);

            SqlCommand logincmd = new SqlCommand("insert into tblLogin (UserName,Password,Role) values(@username,@password,@role)",conn);
            logincmd.Parameters.AddWithValue("username", username.Text);
            logincmd.Parameters.AddWithValue("password", password.Text);
            logincmd.Parameters.AddWithValue("role", "std");

            conn.Open();

            int r = regcmd.ExecuteNonQuery();
            int l = logincmd.ExecuteNonQuery();

            if(r == l)
            {
                Console.Write("Register SUccessfully...");
                Response.Redirect("login.aspx");
            }
            
        }
    }
}