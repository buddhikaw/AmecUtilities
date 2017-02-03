using Amec.Utilities.Common;
using Amec.Utilities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Amec.Utilities
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {              
                try
                {
                    //Response.Redirect("~/Login.aspx");
                    AmecUser user = UserInitiate.LoggedUser;
                    lblUserName.Text = user.GivenName;
                }
                catch (Exception)
                {
                    Response.Redirect(string.Format("~/LoginError.aspx?status={0}", "User Acces Error, Please contact Amec"));
                }                                                  
            }
        }
    }
}