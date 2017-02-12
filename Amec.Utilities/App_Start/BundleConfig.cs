using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;

namespace Amec.Utilities
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkID=303951
        public static void RegisterBundles(BundleCollection bundles)
        {

            //bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
            //         "~/Scripts/jquery-ui-{version}.js"));

            //bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
            //            "~/Scripts/jquery.unobtrusive*",
            //            "~/Scripts/jquery.validate*"));

            //bundles.Add(new ScriptBundle("~/bundles/jquery-dateFormat").Include(
            //            "~/Scripts/jquery-dateFormat.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/datetime-moment").Include(
                        "~/Scripts/moment.js",
                        "~/Scripts/datetime-moment.js"));
            BundleTable.EnableOptimizations = true;
        }
    }
}