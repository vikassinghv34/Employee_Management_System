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
    public partial class profile : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBEmployeeConnection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (Session["username"] != null)
            {
                if (Session["role"].ToString() == "emp")
                {
                    btnback.NavigateUrl = "employeehome.aspx";
                }
                else
                {
                    btnback.NavigateUrl = "adminhome.aspx";
                }
                if (!IsPostBack)
                {
                    SqlCommand regprofilecmd = new SqlCommand("select * from tblEmp where EmpName=@user", conn);
                    regprofilecmd.Parameters.AddWithValue("user", Session["username"].ToString());

                    SqlCommand loginprofilecmd = new SqlCommand("select * from tblLogin where UserName=@username", conn);
                    loginprofilecmd.Parameters.AddWithValue("username", Session["username"].ToString());
                    conn.Open();
                    SqlDataReader regreader = regprofilecmd.ExecuteReader();
                    SqlDataReader loginreader = loginprofilecmd.ExecuteReader();

                    if (regreader.Read() && loginreader.Read())
                    {
                        empname.Text = regreader["EmpName"].ToString();
                        empdesignation.Text = regreader["EmpDesignation"].ToString();
                        empdepartment.Text = regreader["EmpDepartment"].ToString();
                        empdoj.Text = regreader["EmpDateOfJOin"].ToString();
                        empsalary.Text = regreader["EmpSalary"].ToString();
                        username.Text = loginreader["UserName"].ToString();
                        password.Text = loginreader["Password"].ToString();
                        regreader.Close();
                        loginreader.Close();
                        conn.Close();
                    }
                }

            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            if (hupdate.Value == "yes")
            {


                SqlCommand regupdate = new SqlCommand("Update tblEmp Set EmpDesignation=@empdesignation,EmpDateOfJoin=@empdoj,EmpDepartment=@empdepartment,EmpSalary=@empsalary Where EmpName=@user", conn);
                regupdate.Parameters.AddWithValue("user", Session["username"].ToString());
                regupdate.Parameters.AddWithValue("empdesignation", empdesignation.Text);
                regupdate.Parameters.AddWithValue("empdoj", empdoj.Text);
                regupdate.Parameters.AddWithValue("empdepartment", empdepartment.Text);
                regupdate.Parameters.AddWithValue("empsalary", empsalary.Text);

                SqlCommand loginupdate = new SqlCommand("Update tblLogin Set Password=@password Where UserName=@user", conn);
                loginupdate.Parameters.AddWithValue("user", Session["username"].ToString());
                loginupdate.Parameters.AddWithValue("password", password.Text);

                conn.Open();
                int r = regupdate.ExecuteNonQuery();
                int l = loginupdate.ExecuteNonQuery();
                if (r == 1 && l == 1)
                {
                    message.Text = "Update Successfully";
                    Response.Redirect("profile.aspx");
                }
            }
        }
    }
}