using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace fymsc_exam
{
    public partial class registration1 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBEmployeeConnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnregister_Click(object sender, EventArgs e)
        {
            SqlCommand regcmd = new SqlCommand("insert into tblEmp (EmpName,EmpDesignation,EmpDepartment,EmpDateOfJoin,EmpSalary) values(@empname,@empdesignation,@empdepartment,@empdoj,@empsalary)",conn);
            regcmd.Parameters.AddWithValue("empname", empname.Text);
            regcmd.Parameters.AddWithValue("empdesignation", empdesignation.SelectedValue);
            regcmd.Parameters.AddWithValue("empdepartment", empdepartment.SelectedValue);
            regcmd.Parameters.AddWithValue("empdoj", empdoj.Text);
            regcmd.Parameters.AddWithValue("empsalary", empsalary.Text);

            SqlCommand logincmd = new SqlCommand("insert into tblLogin (UserName,Password,Role) values(@username,@password,@role)",conn);
            logincmd.Parameters.AddWithValue("username", username.Text);
            logincmd.Parameters.AddWithValue("password", password.Text);
            logincmd.Parameters.AddWithValue("role", "emp");

            conn.Open();

            int r = regcmd.ExecuteNonQuery();
            int l = logincmd.ExecuteNonQuery();

            if(r == l)
            {
                Response.Redirect("login.aspx");
            }
            
        }
    }
}