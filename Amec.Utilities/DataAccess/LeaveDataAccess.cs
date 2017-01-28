using Amec.Utilities.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Amec.Utilities.DataAccess
{
    public class LeaveDataAccess : BaseDataAccess
    {
        internal DataSet InsertLeave(LeaveData leaveData)
        {
            DataSet ds = new DataSet();
            using (SqlConnection conn = new SqlConnection(AmecUtilDBConnection))
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "amec_leaves_submit";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("operation", 1);
                cmd.Parameters.AddWithValue("ntid", leaveData.LeaveUser.NtId);
                cmd.Parameters.AddWithValue("leaveType", leaveData.LeaveType);
                cmd.Parameters.AddWithValue("leaveTypeDesc", leaveData.LeaveTypeDesc);
                cmd.Parameters.AddWithValue("leaveDateType", leaveData.LeaveDateType);
                cmd.Parameters.AddWithValue("leaveDateStr", leaveData.LeaveDates);
                cmd.Parameters.AddWithValue("leaveRemarks", leaveData.LeaveRemarks);

                try
                {
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    da.Fill(ds);
                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
            return ds;
        }

        internal DataTable GetLeaves(AmecUser leaveUser)
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(AmecUtilDBConnection))
            {
                string sql = "SELECT nt_id as [Leave User],leave_type_desc as [Leave Type],leave_date_type as [Leave Date type],(CONVERT(varchar, leave_date, 103)) as [Leave Date], leave_remarks as [Remarks] FROM amec_leaves where nt_id = @ntid";
                SqlCommand cmd = new SqlCommand(sql,conn);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("ntid", leaveUser.NtId);
                try
                {
                    conn.Open();
                    var dataReader = cmd.ExecuteReader();
                    dt.Load(dataReader);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            return dt;
        }
    }
}