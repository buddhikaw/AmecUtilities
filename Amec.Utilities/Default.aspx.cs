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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AmecUser user = UserInitiate.LoggedUser;
            ltName.Text = user.GivenName;
        }
    }
}