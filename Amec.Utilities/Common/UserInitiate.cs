using Amec.Utilities.DataAccess;
using Amec.Utilities.Models;
using System;
using System.Collections.Generic;
using System.DirectoryServices.AccountManagement;
using System.Linq;
using System.Web;

namespace Amec.Utilities.Common
{
    public static class UserInitiate
    {       
        public static AmecUser UserInit()
        {
            LeaveDataAccess lvDb = new LeaveDataAccess();
            AmecUser amecUser = new AmecUser();
            string userName = HttpContext.Current.User.Identity.Name;
            string ntid = userName.Split('\\')[1];
            amecUser.NtId = ntid;

            using (PrincipalContext oPrincipalContext = new PrincipalContext(ContextType.Domain, "GICNT")) {
                using (UserPrincipal oUserPrincipal = UserPrincipal.FindByIdentity(oPrincipalContext, userName))
                {
                    amecUser.Email = oUserPrincipal.EmailAddress;
                    amecUser.GivenName = oUserPrincipal.GivenName;
                    amecUser.Name = oUserPrincipal.ToString();
                }
            }
            lvDb.UserInit(amecUser);
            return amecUser;
        }

        public static AmecUser LoggedUser {
            get {
                if (HttpContext.Current.Session[Constants.UserSession] == null)
                {
                    AmecUser user = UserInitiate.UserInit();
                    HttpContext.Current.Session[Constants.UserSession] = user;
                    return user;
                }
                else
                {
                    AmecUser user = (AmecUser)HttpContext.Current.Session[Constants.UserSession];
                    return user;
                }
            } 
        }
    }
}