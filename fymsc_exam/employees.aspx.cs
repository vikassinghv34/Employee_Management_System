using System;
using System.Configuration;
using System.Data.SqlClient;

namespace tymsc_exam
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
                SqlCommand regcmd = new SqlCommand("insert into tblEmp (StdName,StdFaculty,StdDepartment,StdDateOfBirth,StdPRN) values(@stdname,@stdfaculty,@stddepartment,@stddob,@stdprn)", conn);
                regcmd.Parameters.AddWithValue("stdname", stdname.Text);
                regcmd.Parameters.AddWithValue("stdfaculty", stdfaculty.SelectedValue);
                regcmd.Parameters.AddWithValue("stddepartment", stddepartment.SelectedValue);
                regcmd.Parameters.AddWithValue("stddob", stddob.Text);
                regcmd.Parameters.AddWithValue("stdprn", stdprn.Text);

                SqlCommand logincmd = new SqlCommand("insert into tblLogin (UserName,Password,Role) values(@username,@password,@role)", conn);
                logincmd.Parameters.AddWithValue("username", username.Text);
                logincmd.Parameters.AddWithValue("password", password.Text);
                logincmd.Parameters.AddWithValue("role", "std");


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
            stdname.Text = GridView1.Rows[gvindex].Cells[1].Text;
            stdfaculty.SelectedValue = GridView1.Rows[gvindex].Cells[2].Text;
            stddepartment.SelectedValue = GridView1.Rows[gvindex].Cells[3].Text;
            stddob.Text = GridView1.Rows[gvindex].Cells[4].Text;
            stdprn.Text = GridView1.Rows[gvindex].Cells[5].Text;
            username.Text = GridView1.Rows[gvindex].Cells[6].Text;
            password.Text = GridView1.Rows[gvindex].Cells[7].Text;
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            try
            {


                if (hupdate.Value == "yes")
                {
                    SqlCommand regupdate = new SqlCommand("Update tblEmp Set StdName=@stdname,StdFaculty=@stdfaculty,StdDateOfBirth=@stddob,StdDepartment=@stddepartment,StdPRN=@stdprn Where StdName=@stdname", conn);
                    regupdate.Parameters.AddWithValue("stdname", stdname.Text);
                    regupdate.Parameters.AddWithValue("stdfaculty", stdfaculty.SelectedValue);
                    regupdate.Parameters.AddWithValue("stddob", stddob.Text);
                    regupdate.Parameters.AddWithValue("stddepartment", stddepartment.SelectedValue);
                    regupdate.Parameters.AddWithValue("stdprn", stdprn.Text);

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
                SqlCommand regdel = new SqlCommand("Delete From tblEmp Where StdName=@stdname", conn);
                regdel.Parameters.AddWithValue("stdname", stdname.Text);

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