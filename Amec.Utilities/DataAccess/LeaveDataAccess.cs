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

        internal DataSet LeaveExportAll(int year, int month)
        {
            DataSet ds = new DataSet();
            using (SqlConnection conn = new SqlConnection(AmecUtilDBConnection))
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "amec_leave_exportall";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("year", year);
                cmd.Parameters.AddWithValue("month", month);
                
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
                string sql = "SELECT l.id as [Leave Id],l.leave_type_desc as [Leave Type],l.leave_date_type as [Leave Date type],(CONVERT(varchar, l.leave_date, 103)) as [Leave Date], (CONVERT(varchar, l.created_date, 103)) as [Created Date], l.leave_remarks as [Remarks] FROM amec_leaves l join amec_members m on l.nt_id =m.nt_id where l.nt_id = @ntid order by l.created_date desc";
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

        internal void DeleteLeave(int leaveID)
        {
            using (SqlConnection conn = new SqlConnection(AmecUtilDBConnection))
            {
                string sql = "delete from amec_leaves where id = @leaveid";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("leaveid", leaveID);
                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}