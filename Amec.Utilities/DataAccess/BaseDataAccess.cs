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
    public class BaseDataAccess
    {
        protected string AmecUtilDBConnection = ConfigurationManager.ConnectionStrings["AmecDb"].ConnectionString;

        internal void UserInit(AmecUser user)
        {
            using (SqlConnection conn = new SqlConnection(AmecUtilDBConnection))
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "amec_user_init";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("ntid", user.NtId);
                cmd.Parameters.AddWithValue("name", user.Name);
                cmd.Parameters.AddWithValue("email", user.Email);
                cmd.Parameters.AddWithValue("givenName", user.GivenName);
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