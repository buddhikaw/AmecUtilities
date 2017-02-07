using Amec.Utilities.DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Amec.Utilities.Leave
{
    public partial class ExportAll : System.Web.UI.Page
    {
        LeaveDataAccess lvDb = new LeaveDataAccess();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            int year = int.Parse(ddlYear.SelectedValue);
            int month = int.Parse(ddlMonth.SelectedValue);
            DataSet resultSet = lvDb.LeaveExportAll(year, month);

            if (resultSet.Tables.Count > 0 && resultSet.Tables[0].Rows.Count > 0)
            {

                resultSet.Tables[0].Columns.Remove("nt_id");
                GridView gv = new GridView();
                gv.DataSource = resultSet;
                gv.DataBind();
                string fileName = "attachment; filename=AmecLeaves_" + year + "_" + month + ".xls";
                Response.ClearContent();
                Response.AppendHeader("content-disposition", fileName);
                Response.ContentType = "application/excel";
                System.IO.StringWriter stringWriter = new System.IO.StringWriter();
                HtmlTextWriter htw = new HtmlTextWriter(stringWriter);
                //gv.HeaderRow.Style.Add("background-color", "#FFFFFF");

                // Set background color of each cell of GridView1 header row
                //foreach (TableCell tableCell in gv.HeaderRow.Cells)
                //{
                //    tableCell.Style["background-color"] = "#A55129";
                //}

                // Set background color of each cell of each data row of GridView1
                //foreach (GridViewRow gridViewRow in gv.Rows)
                //{
                //    gridViewRow.BackColor = System.Drawing.Color.White;
                //    foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
                //    {
                //        gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
                //    }
                //}

                gv.RenderControl(htw);
                Response.Write(stringWriter.ToString());
                Response.End();
            }
            else
            {
                Response.Redirect(string.Format("~/AppStatus.aspx?status={0}", "No data for selected month"));
            }

        }
    }
}