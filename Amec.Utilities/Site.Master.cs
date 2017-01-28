using Amec.Utilities.Common;
using Amec.Utilities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
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
                if (Session[Constants.UserSession] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    AmecUser user = Session[Constants.UserSession] as AmecUser;
                    lblUserName.Text = user.NtId;
                }
            }
        }
    }
}