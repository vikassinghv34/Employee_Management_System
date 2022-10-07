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
    public partial class adminhome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] !=null)
            {
                sessionusername.Text = "Welcome "+Session["username"].ToString();
            }
            else
            {
                sessionusername.Text = "Please Login First";
                GridView1.Visible = false;
                GridView2.Visible = false;
                Response.Redirect("login.aspx");
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBEmployeeConnection"].ToString());
            SqlCommand searchcmd = new SqlCommand("SELECT tblEmp.StdID, tblEmp.StdName, tblEmp.StdFaculty, tblEmp.StdDepartment, tblEmp.StdDateOfBirth, tblEmp.StdPRN, tblLogin.UserName, tblLogin.Password, tblLogin.Role FROM tblEmp INNER JOIN tblLogin ON tblEmp.StdName = tblLogin.UserName WHERE(tblEmp.StdDepartment = @stddepartment)", conn);
            searchcmd.Parameters.AddWithValue("stddepartment",DropDownList1.SelectedValue);
            conn.Open();
            GridView2.DataSource = searchcmd.ExecuteReader();
            GridView2.DataBind();
        }
    }
}