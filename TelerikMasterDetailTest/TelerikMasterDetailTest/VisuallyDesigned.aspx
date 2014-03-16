<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisuallyDesigned.aspx.cs" Inherits="TelerikMasterDetailTest.VisuallyDesigned" %>

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
        <div>

            <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True" CellSpacing="-1" DataMember="Value" GridLines="Both" OnNeedDataSource="RadGrid1_NeedDataSource" OnDetailTableDataBind="RadGrid1_DetailTableDataBind">
                <ClientSettings AllowColumnsReorder="True">
                    <Selecting AllowRowSelect="True" />
                </ClientSettings>
                <MasterTableView DataMember="Value" DataKeyNames="Key">
                    <DetailTables>
                        <telerik:GridTableView runat="server" Name="Level1" DataKeyNames="Key" DataMember="Value">
                          <DetailTables>
                        <telerik:GridTableView runat="server" Name="Level2" DataKeyNames="Key" DataMember="Value">
                          
                        </telerik:GridTableView>
                    </DetailTables>
                        </telerik:GridTableView>
                    </DetailTables>
                </MasterTableView>
            </telerik:RadGrid>

        </div>
    </form>
</body>
</html>
