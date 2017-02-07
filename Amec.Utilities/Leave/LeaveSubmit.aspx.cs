using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Amec.Utilities.Models;
using Amec.Utilities.DataAccess;
using System.Data;
using Amec.Utilities.Common;

namespace Amec.Utilities.Leave
{
    public partial class LeaveSubmit : System.Web.UI.Page
    {
        LeaveDataAccess lvDb = new LeaveDataAccess();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                foreach (int i in Enum.GetValues(typeof(Enums.LeaveTypes)))
                {
                    ddlLeaveType.Items.Add(new ListItem(Enums.GetDescription((Enums.LeaveTypes)i), i.ToString()));
                }
                              
                AmecUser LeaveUser = UserInitiate.LoggedUser; ;
                DataTable dt = lvDb.GetLeaves(LeaveUser);
                if (dt != null && dt.Rows.Count > 0)
                {
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


        protected void btnLeaveSubmit_Click(object sender, EventArgs e)
        {
            LeaveData leaveData = new LeaveData();
            leaveData.LeaveType = Convert.ToInt32(ddlLeaveType.SelectedValue.ToString());
            leaveData.LeaveTypeDesc = Enums.GetDescription((Enums.LeaveTypes)leaveData.LeaveType);
            Enums.LeaveDateTypes leaveDateTypes = (Enums.LeaveDateTypes)Enum.Parse(typeof(Enums.LeaveDateTypes), Request.Form["LeaveDateType"].ToString());
            leaveData.LeaveDateType = Enums.GetDescription(leaveDateTypes);
            leaveData.LeaveDates = Request.Form["LeaveDates"].ToString().TrimEnd(',');
            leaveData.LeaveRemarks = Request.Form["leaveRemarks"].ToString();
            leaveData.LeaveUser = UserInitiate.LoggedUser;
            DataSet resultSet = lvDb.InsertLeave(leaveData);
            string status = resultSet.Tables[0].Rows[0][0].ToString();
            string statusMsg = resultSet.Tables[0].Rows[0][1].ToString();
            if (status == "0")
                Response.Redirect(Request.RawUrl);
            else
                Response.Redirect(string.Format("~/AppStatus.aspx?status={0}", statusMsg));
        }

        protected void gdVwLeave_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton l = (LinkButton)e.Row.FindControl("LinkButton1");
                l.Attributes.Add("onclick", "javascript:return " +
                "confirm('Are you sure you want to delete this leave " +
                DataBinder.Eval(e.Row.DataItem, "Leave Id") + "')");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                // get the categoryID of the clicked row
                int leaveID = Convert.ToInt32(e.CommandArgument);
                lvDb.DeleteLeave(leaveID);
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}