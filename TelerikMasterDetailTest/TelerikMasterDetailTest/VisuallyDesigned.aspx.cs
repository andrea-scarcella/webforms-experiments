using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace TelerikMasterDetailTest
{
    public partial class VisuallyDesigned : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //var data = HierarchicalDataSourceClass.getData();
        }

        protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            var data = pageGetData();
            //var data = HierarchicalDataSourceClass.getDummyData().Children;
            RadGrid1.DataSource = data;
        }

        private Node[] pageGetData()
        {
            var path = ConfigurationManager.AppSettings["xmlDataSource"].ToString();
            path = Server.MapPath(path);
            var data = HierarchicalDataSourceClass.getData(path);
            return data;
        }

        protected void RadGrid1_DetailTableDataBind(object sender, Telerik.Web.UI.GridDetailTableDataBindEventArgs e)
        {
            GridDataItem dataItem = (GridDataItem)e.DetailTableView.ParentItem;
            switch (e.DetailTableView.Name)
            {
                case "Level1":
                    {
                        //string ParentKey= dataItem.GetDataKeyValue("ParentKey");//.ToString();
                        string Key = dataItem.GetDataKeyValue("Key").ToString();
                        //e.DetailTableView.DataSource = pageDatasource.GetOrders(CustomerID);
                        var data = pageGetData();
                        var childData = data.Where(n => n.Children != null && n.Children.Where(c => c.ParentKey.Equals(Key)).Any()).SelectMany(n=> n.Children);
                        e.DetailTableView.DataSource = childData;
                        break;
                    }

                case "OrderDetails":
                    {
                        string OrderID = dataItem.GetDataKeyValue("OrderID").ToString();
                        //e.DetailTableView.DataSource = pageDatasource.GetOrderDetails(OrderID);
                        break;
                    }
            }
        }
    }
}