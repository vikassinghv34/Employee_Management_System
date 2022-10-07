using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
namespace tymsc_exam
{
    public partial class main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != null)
            {
                loginnav.Visible = false;
                registrationnav.Visible = false;
                logoutnav.Visible = true;
                profilenav.Visible = true;
                Console.Write(Session["role"]);
                if (Session["role"].ToString() == "std")
                {
                    employeesnav.Visible = false;
                    homeheader.NavigateUrl = "~/employeehome.aspx";

                }
                else
                {
                    employeesnav.Visible = true;
                    homeheader.NavigateUrl = "~/adminhome.aspx";

                }
            }
            else
            {
                logoutnav.Visible = false;
                profilenav.Visible = false;
                employeesnav.Visible = false;
            }
        }
       
	

	
    }
}