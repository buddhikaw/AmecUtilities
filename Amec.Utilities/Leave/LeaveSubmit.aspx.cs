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
            leaveData.LeaveUser = Session[Constants.UserSession] as AmecUser;
            DataSet resultSet = lvDb.InsertLeave(leaveData);
            string status = resultSet.Tables[0].Rows[0][0].ToString();
            string statusMsg = resultSet.Tables[0].Rows[0][1].ToString();
            if (status == "0")
                Response.Redirect("~/Leave/ViewLeaves.aspx");
            else
                Response.Redirect(string.Format("~/AppStatus.aspx?status={0}", statusMsg));
        }
    }
}