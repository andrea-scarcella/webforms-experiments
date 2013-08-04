<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="GlobalisationLocalisationTest._Default"
     meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:content id="BodyContent" runat="server" contentplaceholderid="MainContent">
    <h2>
        <asp:label id="Label1" runat="server" text="Welcome to ASP.NET!" 
            meta:resourcekey="Label1Resource1"></asp:label>
    </h2>
    <p>
        <asp:label id="Label2" runat="server" 
            text=" To learn more about ASP.NET visit " meta:resourcekey="Label2Resource1"></asp:label>
        <a href="http://www.asp.net" title="ASP.NET Website">www.asp.net</a>.
    </p>
    <p>
        <asp:label id="Label3" runat="server" text=" You can also find " 
            meta:resourcekey="Label3Resource1"></asp:label>
        <a href="http://go.microsoft.com/fwlink/?LinkID=152368&amp;clcid=0x409" title="MSDN ASP.NET Docs">
            <asp:label id="Label4" runat="server" 
            text=" documentation on ASP.NET at MSDN" meta:resourcekey="Label4Resource1"></asp:label></a>.
    </p>
</asp:content>
