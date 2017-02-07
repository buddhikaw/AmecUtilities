using Amec.Utilities.Common;
using Amec.Utilities.DataAccess;
using Amec.Utilities.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Amec.Utilities.Leave
{
    public partial class ViewLeaves : System.Web.UI.Page
    {
        LeaveDataAccess lvDb = new LeaveDataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                AmecUser LeaveUser = UserInitiate.LoggedUser;;
                DataTable dt = lvDb.GetLeaves(LeaveUser);
                if (dt != null && dt.Rows.Count > 0) { 
                gdVwLeave.DataSource = dt;
                gdVwLeave.DataBind();
                }
            }
        }

        protected void gdVwLeave_PreRender(object sender, EventArgs e)
        {
            if (gdVwLeave.Rows.Count > 0)
            {
                //Replace the <td> with <th> and adds the scope attribute
                gdVwLeave.UseAccessibleHeader = true;

                //Adds the <thead> and <tbody> elements required for DataTables to work
                gdVwLeave.HeaderRow.TableSection = TableRowSection.TableHeader;

                //Adds the <tfoot> element required for DataTables to work
                gdVwLeave.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }
    }
}