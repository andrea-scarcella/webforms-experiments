<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TelerikMasterDetailTest.Default" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js">
                </asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>

    <telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="true" />
    <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadGrid ID="RadGrid1" runat="server" Width="95%" ShowStatusBar="true" AutoGenerateColumns="False"
        PageSize="7" AllowSorting="True" AllowMultiRowSelection="False" AllowPaging="True"
        OnDetailTableDataBind="RadGrid1_DetailTableDataBind" OnNeedDataSource="RadGrid1_NeedDataSource"
        OnPreRender="RadGrid1_PreRender">
        <PagerStyle Mode="NumericPages"></PagerStyle>
        <MasterTableView Width="100%" DataKeyNames="CustomerID" AllowMultiColumnSorting="True">
            <DetailTables>
                <telerik:GridTableView DataKeyNames="OrderID" Name="Orders" Width="100%">
                    <DetailTables>
                        <telerik:GridTableView DataKeyNames="OrderID" Name="OrderDetails" Width="100%">
                            <Columns>
                                <telerik:GridBoundColumn SortExpression="UnitPrice" HeaderText="Unit Price" HeaderButtonType="TextButton"
                                    DataField="UnitPrice">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="Quantity" HeaderText="Quantity" HeaderButtonType="TextButton"
                                    DataField="Quantity">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="Discount" HeaderText="Discount" HeaderButtonType="TextButton"
                                    DataField="Discount">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </telerik:GridTableView>
                    </DetailTables>
                    <Columns>
                        <telerik:GridBoundColumn SortExpression="OrderID" HeaderText="OrderID" HeaderButtonType="TextButton"
                            DataField="OrderID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="OrderDate" HeaderText="Date Ordered" HeaderButtonType="TextButton"
                            DataField="OrderDate" UniqueName="OrderDate" DataFormatString="{0:D}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="Freight" HeaderText="Freight" HeaderButtonType="TextButton"
                            DataField="Freight" UniqueName="Freight">
                        </telerik:GridBoundColumn>
                    </Columns>
                </telerik:GridTableView>
            </DetailTables>
            <Columns>
                <telerik:GridBoundColumn SortExpression="CustomerID" HeaderText="CustomerID" HeaderButtonType="TextButton"
                    DataField="CustomerID">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn SortExpression="ContactName" HeaderText="Contact Name" HeaderButtonType="TextButton"
                    DataField="ContactName">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn SortExpression="CompanyName" HeaderText="Company" HeaderButtonType="TextButton"
                    DataField="CompanyName">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    </form>
</body>
</html>
