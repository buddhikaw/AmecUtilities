using Amec.Utilities.Common;
using Amec.Utilities.DataAccess;
using Amec.Utilities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Amec.Utilities
{
    public partial class Login : System.Web.UI.Page
    {
        LeaveDataAccess lvDb = new LeaveDataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //temp until windows auth enable
            AmecUser user = new AmecUser();
            user.NtId = tbUserName.Text.Trim();
            user.Name = user.NtId;
            user.Email = "testemail@buddhika.com";
            lvDb.UserInit(user);
            Session[Constants.UserSession] = user;
            Response.Redirect("~/Default.aspx");
        }
    }
}