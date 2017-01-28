using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Amec.Utilities.Models
{
    public class LeaveData
    {
        public int LeaveType { get; set; }
        public string LeaveTypeDesc { get; set; }        
        public string LeaveDateType { get; set; }
        public string LeaveDates { get; set; }
        public string LeaveRemarks { get; set; }
        public AmecUser LeaveUser { get; set; }
    }   
}