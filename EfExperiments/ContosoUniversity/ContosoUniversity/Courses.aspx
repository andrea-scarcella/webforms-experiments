<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Courses.aspx.cs" Inherits="ContosoUniversity.Courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="server">
    <h2>
        Courses by Department
    </h2>
    <asp:entitydatasource id="DepartmentsEntityDataSource" runat="server" contexttypename="ContosoUniversity.DAL.SchoolEntities"
        enableflattening="False" entitysetname="Departments" select="it.[DepartmentID], it.[Name]">
    </asp:entitydatasource>
    <asp:entitydatasource id="CoursesEntityDataSource" runat="server" autogeneratewhereclause="True"
        ContextTypeName="ContosoUniversity.DAL.SchoolEntities" 
        enableflattening="False" entitysetname="Courses" where="">
        <whereparameters>
            <asp:ControlParameter ControlID="DepartmentsDropDownList" Name="DepartmentID" 
                PropertyName="SelectedValue" Type="Int32" />
        </whereparameters>
    </asp:entitydatasource>
    <asp:dropdownlist id="DepartmentsDropDownList" runat="server" datasourceid="DepartmentsEntityDataSource"
        datatextfield="Name" datavaluefield="DepartmentID" AutoPostBack="True">
    </asp:dropdownlist>
    <asp:gridview id="CoursesGridView" runat="server" autogeneratecolumns="False" datakeynames="CourseID"
        datasourceid="CoursesEntityDataSource">
        <columns>
            <asp:BoundField DataField="CourseID" HeaderText="ID" ReadOnly="True" 
                SortExpression="CourseID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Credits" HeaderText="Credits" 
                SortExpression="Credits" />
        </columns>
    </asp:gridview>
</asp:content>