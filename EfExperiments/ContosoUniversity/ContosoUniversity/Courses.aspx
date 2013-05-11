<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Courses.aspx.cs" Inherits="ContosoUniversity.Courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="server">
    <h2>
        Courses by Department
    </h2>
    <asp:entitydatasource id="DepartmentsEntityDataSource" runat="server" contexttypename="ContosoUniversity.DAL.SchoolEntities"
        enableflattening="False" entitysetname="Departments" 
        select="it.[DepartmentID], it.[Name]" >
    </asp:entitydatasource>
    <asp:dropdownlist id="DepartmentsDropDownList" runat="server" datasourceid="DepartmentsEntityDataSource"
        datatextfield="Name" datavaluefield="DepartmentID">
    </asp:dropdownlist>
</asp:content>