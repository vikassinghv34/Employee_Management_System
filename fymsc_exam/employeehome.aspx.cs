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
    public partial class employeehome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                username.Text = "Welcome " + Session["username"].ToString();
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}