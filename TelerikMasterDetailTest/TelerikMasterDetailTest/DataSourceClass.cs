using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TelerikMasterDetailTest
{
    public class DataSourceClass
    {
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
        public object GetCustomers()
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
        public object GetOrders(string CustomerID)
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
            return orders.Where(o => o.CustomerID.ToString().Equals(CustomerID));
        }
        public object GetOrderDetails(string OrderID)
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
            return orderRows.Where(o => o.OrderID.ToString().Equals(OrderID));
        }


    }
}