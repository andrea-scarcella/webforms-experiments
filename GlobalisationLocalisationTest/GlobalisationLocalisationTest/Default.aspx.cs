using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace GlobalisationLocalisationTest
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //http://msdn.microsoft.com/en-us/library/bz9tc508(v=vs.85).aspx //how to change uiculture at runtime
        //http://msdn.microsoft.com/en-us/magazine/cc163566.aspx        //how to perform site-wide culture change
        protected override void InitializeCulture()
        {
            Page.UICulture = "nl";
            base.InitializeCulture();
        }

    }
}
