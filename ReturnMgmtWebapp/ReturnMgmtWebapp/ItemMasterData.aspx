<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemMasterData.aspx.cs" Inherits="ReturnMgmtWebapp.ItemMasterData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:BulletedList ID="BulletedList1" runat="server"
        Style="list-style-type: none;">

        <asp:ListItem style="background-color: green; color: white; float: left; padding-left: 40px; padding-right: 40px;">Geneal</asp:ListItem>
        <asp:ListItem style="background-color: green; color: white; float: left; padding-left: 40px; padding-right: 40px;">Warehouse</asp:ListItem>
    </asp:BulletedList>
    <br />
    <asp:Panel ID="Panel1" runat="server"
        Style="background-color: green; display: block; padding: 40px;">
        <ul Style="list-style-type: none;">
            <li>
                <label for  =<%= ItemCode.ClientID %> style="text-align: right;">Item Code</label>
                <%--<asp:Label ID="Label1" runat="server" Text="Item Code"
                    Style="float: left; text-align: right; margin-right: 0.5em;"
                    for="ItemCode"></asp:Label>--%>
                <asp:TextBox ID="ItemCode" runat="server"></asp:TextBox>
            </li>
            <li>
                 <label for  =<%= TextBox2.ClientID %> style="text-align: right;">Description</label>
                <%--<asp:Label ID="Label2" runat="server" Text="Description"
                    Style="float: left; text-align: right; margin-right: 0.5em;"
                    for="TextBox2"></asp:Label>--%>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </li>
        </ul>



        <br />

    </asp:Panel>
</asp:Content>
