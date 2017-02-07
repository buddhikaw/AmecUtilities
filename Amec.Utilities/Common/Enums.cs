using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;

namespace Amec.Utilities
{
    public static class Enums
    {
        public enum LeaveTypes
        {
            //Any new types please add below
            Annual = 1,
            MC = 2,
            [Description("Child Care")]
            ChildCare = 3
        }

        public enum LeaveDateTypes
        {
            AM,
            PM ,
            FULL
        }


        public class Description : Attribute
        {
            public string Text;
            public Description(string text)
            {
                Text = text;
            }
        }

        public static string GetDescription(Enum en)
        {

            Type type = en.GetType();
            MemberInfo[] memInfo = type.GetMember(en.ToString());

            if (memInfo != null && memInfo.Length > 0)
            {
                object[] attrs = memInfo[0].GetCustomAttributes(typeof(Description), false);
                                if (attrs != null && attrs.Length > 0)
                    return ((Description)attrs[0]).Text;

            }
            return en.ToString();
        }
    }
}