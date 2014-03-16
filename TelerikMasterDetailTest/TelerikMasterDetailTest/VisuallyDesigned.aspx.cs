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
            //var path = ConfigurationManager.AppSettings["xmlDataSource"].ToString();
            //path = Server.MapPath(path);
            //var data = HierarchicalDataSourceClass.getData(path);
            var data = HierarchicalDataSourceClass.getDummyData().Children;
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
                        //var childData = data.Where(n => n.Children != null && n.Children.Where(c => c.ParentKey.Equals(Key)).Any()).SelectMany(n=> n.Children);
                        var childData = GetRowChildren(Key, data);
                        e.DetailTableView.DataSource = childData;
                        break;
                    }

                case "Level2":
                    {

                        string Key = dataItem.GetDataKeyValue("Key").ToString();
                        var data = pageGetData();
                        //get children of level 0 nodes (i.e. get level 1 nodes)
                        var Depth1Nodes = data.Where(n => n.Children != null).SelectMany(n => n.Children);
                        //get level 2 nodes
                        var childData1 = GetRowChildren(Key, Depth1Nodes);
                        e.DetailTableView.DataSource = childData1;
                        break;
                    }
            }
        }

        private static IEnumerable<Node> GetRowChildren(string Key, IEnumerable<Node> rowData)
        {
            var childData = rowData.Where(n => n.Children != null && n.Children.Where(c => c.ParentKey.Equals(Key)).Any()).SelectMany(n => n.Children);
            return childData;
        }
    }
}