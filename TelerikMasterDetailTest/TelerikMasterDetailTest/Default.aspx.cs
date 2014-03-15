using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using Telerik.Web.UI;

namespace TelerikMasterDetailTest
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RadGrid1_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            if (!e.IsFromDetailTable)
            {
                RadGrid1.DataSource = GetCustomers();
                //GetDataTable("SELECT * FROM Customers");
            }
        }


        protected void RadGrid1_DetailTableDataBind(object source, Telerik.Web.UI.GridDetailTableDataBindEventArgs e)
        {
            GridDataItem dataItem = (GridDataItem)e.DetailTableView.ParentItem;
            switch (e.DetailTableView.Name)
            {
                case "Orders":
                    {
                        string CustomerID = dataItem.GetDataKeyValue("CustomerID").ToString();
                        e.DetailTableView.DataSource = GetOrders(CustomerID);
                        //GetDataTable("SELECT * FROM Orders WHERE CustomerID = '" + CustomerID + "'");
                        break;
                    }

                case "OrderDetails":
                    {
                        string OrderID = dataItem.GetDataKeyValue("OrderID").ToString();
                        e.DetailTableView.DataSource = GetOrderDetails(OrderID);
                        break;
                    }
            }
        }

        private object GetOrderDetails(string OrderID)
        {
            var orderRows = new[]{
                
                new OrderDetails{
                OrderID=0,
                Discount=0,
                Quantity=1,
                UnitPrice=1
                },
                
                new OrderDetails{
                OrderID=0,
                Discount=10,
                Quantity=10,
                UnitPrice=10
                }
            };
            return orderRows.Where(o=>o.OrderID.ToString().Equals(OrderID));
        }

        private object GetOrders(string CustomerID)
        {
            var orders = new[]{
                new Order{
                    OrderDate=DateTime.Now,
                    OrderID=0,
                    Freight=1,
                    CustomerID=0
},
               new Order{
                    OrderDate=DateTime.Now,
                    OrderID=1,
                    Freight=2,
                    CustomerID=0
},
new Order{
                    OrderDate=DateTime.Now,
                    OrderID=2,
                    Freight=3,
                    CustomerID=1
}
            };
            return orders.Where(o=>o.CustomerID.ToString().Equals(CustomerID));
        }
        private object GetCustomers()
        {
            var customers = new[] {
                new Customer{
            CustomerID=0,
            CompanyName="c1",
            ContactName="cnt1"
            } ,
            new Customer{
            CustomerID=1,
            CompanyName="c2",
            ContactName="cnt2"
            } 
            };
            return customers;
        }

        public class Customer
        {
            public int CustomerID { get; set; }
            public string ContactName { get; set; }
            public string CompanyName { get; set; }
        }
        public class Order
        {
            public int OrderID { get; set; }
            public int CustomerID { get; set; }
            public DateTime OrderDate { get; set; }
            public double Freight { get; set; }
        }
        public class OrderDetails
        {
            public int OrderID { get; set; }
            public double UnitPrice { get; set; }
            public double Quantity { get; set; }
            public double Discount { get; set; }
        }
        //public DataTable GetDataTable(string query)
        //{
        //    String ConnString = ConfigurationManager.ConnectionStrings["NorthwindConnectionString"].ConnectionString;
        //    SqlConnection conn = new SqlConnection(ConnString);
        //    SqlDataAdapter adapter = new SqlDataAdapter();
        //    adapter.SelectCommand = new SqlCommand(query, conn);

        //    DataTable myDataTable = new DataTable();

        //    conn.Open();
        //    try
        //    {
        //        adapter.Fill(myDataTable);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }

        //    return myDataTable;
        //}
        protected void RadGrid1_PreRender(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                RadGrid1.MasterTableView.Items[0].Expanded = true;
                RadGrid1.MasterTableView.Items[0].ChildItem.NestedTableViews[0].Items[0].Expanded = true;
            }
        }

    }
}