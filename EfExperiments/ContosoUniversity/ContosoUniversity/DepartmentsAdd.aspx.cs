using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ContosoUniversity.DAL;

namespace ContosoUniversity
{
    public partial class DepartmentsAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private DropDownList administratorsDropDownList;

        protected void Page_Init(object sender, EventArgs e)
        {
            DepartmentsDetailsView.EnableDynamicData(typeof(Department));
        }

        protected void DepartmentsDropDownList_Init(object sender, EventArgs e)
        {
            administratorsDropDownList = sender as DropDownList;
        }

        protected void DepartmentsDetailsView_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            e.Values["Administrator"] = administratorsDropDownList.SelectedValue;
        }
    }
}