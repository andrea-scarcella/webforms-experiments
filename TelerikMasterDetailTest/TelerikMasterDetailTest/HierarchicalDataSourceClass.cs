using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
//using System.Xml;
using System.Xml.Serialization;

namespace TelerikMasterDetailTest
{
    //[DataObjectAttribute]
    public class HierarchicalDataSourceClass
    {
        private static T getData<T>(TextReader tr)
        {
            var xmlserializer = new XmlSerializer(typeof(T));
            var data = (T)xmlserializer.Deserialize(tr);
            return data;
        }
        //[DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public static Node[] getData(string path)
        {

            var sr = new StreamReader(path);
            return getData<Node>(sr).Children;
        }

        public static void serialize()
        {
            Node root = getDummyData();
            var xs = new XmlSerializer(typeof(Node));
            var xmlw = new StreamWriter("c:\\foo.xml");
            xs.Serialize(xmlw, root);
        }

        public static Node getDummyData()
        {
            Node root = new Node()
            {
                Children = new[]{
                new Node(){
                    Key="1",
                    ParentKey="0",
                    Value="a"
                },new Node(){
                    Key="2",
                    ParentKey="0",
                    Value="aa",Children=new[]{
                        new Node(){
                            Key="10",
                            ParentKey="2",
                            Value="a10"
                        },
                  new Node(){
                      Key="11",
                      ParentKey="2",
                      Value="aa10",
                      Children=new[]{
                          new Node  (){
                              Key="111",
                              ParentKey="11",
                              Value="aaa11"
                              
                          }
                      }
                  }
                    }
                },new Node(){
                    Key="3",
                    ParentKey="0",
                    Value="aaa",
                    Children= new[]{
                        new Node(){
                            Key="30",
                            Value="aaa30",
                            ParentKey="3"
                        }
                    }
                }
            }
            };
            return root;
        }

    }
}