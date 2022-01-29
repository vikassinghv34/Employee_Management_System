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
    public partial class employees : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBEmployeeConnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void btnregister_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand regcmd = new SqlCommand("insert into tblEmp (EmpName,EmpDesignation,EmpDepartment,EmpDateOfJoin,EmpSalary) values(@empname,@empdesignation,@empdepartment,@empdoj,@empsalary)", conn);
                regcmd.Parameters.AddWithValue("empname", empname.Text);
                regcmd.Parameters.AddWithValue("empdesignation", empdesignation.SelectedValue);
                regcmd.Parameters.AddWithValue("empdepartment", empdepartment.SelectedValue);
                regcmd.Parameters.AddWithValue("empdoj", empdoj.Text);
                regcmd.Parameters.AddWithValue("empsalary", empsalary.Text);

                SqlCommand logincmd = new SqlCommand("insert into tblLogin (UserName,Password,Role) values(@username,@password,@role)", conn);
                logincmd.Parameters.AddWithValue("username", username.Text);
                logincmd.Parameters.AddWithValue("password", password.Text);
                logincmd.Parameters.AddWithValue("role", "emp");


                conn.Open();

                int r = regcmd.ExecuteNonQuery();
                int l = logincmd.ExecuteNonQuery();

                if (r == l)
                {
                    message.Text = "Registeration complete.";
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            int gvindex = GridView1.SelectedIndex;
            empname.Text = GridView1.Rows[gvindex].Cells[1].Text;
            empdesignation.SelectedValue = GridView1.Rows[gvindex].Cells[2].Text;
            empdepartment.SelectedValue = GridView1.Rows[gvindex].Cells[3].Text;
            empdoj.Text = GridView1.Rows[gvindex].Cells[4].Text;
            empsalary.Text = GridView1.Rows[gvindex].Cells[5].Text;
            username.Text = GridView1.Rows[gvindex].Cells[6].Text;
            password.Text = GridView1.Rows[gvindex].Cells[7].Text;
            role.SelectedValue = GridView1.Rows[gvindex].Cells[8].Text;
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            try
            {


                if (hupdate.Value == "yes")
                {
                SqlCommand regupdate = new SqlCommand("Update tblEmp Set EmpName=@empname,EmpDesignation=@empdesignation,EmpDateOfJoin=@empdoj,EmpDepartment=@empdepartment,EmpSalary=@empsalary Where EmpName=@empname", conn);
                regupdate.Parameters.AddWithValue("empname", empname.Text);
                regupdate.Parameters.AddWithValue("empdesignation", empdesignation.SelectedValue);
                regupdate.Parameters.AddWithValue("empdoj", empdoj.Text);
                regupdate.Parameters.AddWithValue("empdepartment", empdepartment.SelectedValue);
                regupdate.Parameters.AddWithValue("empsalary", empsalary.Text);

                SqlCommand loginupdate = new SqlCommand("Update tblLogin Set UserName=@username,Password=@password Where UserName=@username", conn);
                loginupdate.Parameters.AddWithValue("username", username.Text);
                loginupdate.Parameters.AddWithValue("password", password.Text);

                conn.Open();
                int r = regupdate.ExecuteNonQuery();
                int l = loginupdate.ExecuteNonQuery();
                if (r == 1 && l == 1)
                {
                    message.Text = "Update Successfully";
                    Response.Redirect("employees.aspx");
                }
                }
            }
            catch (Exception ex)
            {

                Console.WriteLine(ex.Message);
            }

        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            if (hdel.Value == "yes")
            {
            SqlCommand regdel = new SqlCommand("Delete From tblEmp Where EmpName=@empname", conn);
            regdel.Parameters.AddWithValue("empname", empname.Text);

            SqlCommand logindel = new SqlCommand("Delete From tblLogin Where UserName=@username", conn);
            logindel.Parameters.AddWithValue("username", username.Text);

            conn.Open();
            int r = regdel.ExecuteNonQuery();
            int l = logindel.ExecuteNonQuery();
            if (r == 1 && l == 1)
            {
                message.Text = "Delete Suceessfully";
                    Response.Redirect("employees.aspx");
                }
            }
        }
    }
}