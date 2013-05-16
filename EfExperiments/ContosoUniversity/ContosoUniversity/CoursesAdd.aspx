<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="CoursesAdd.aspx.cs" Inherits="ContosoUniversity.DAL.CoursesAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="server">
    <h2>
        Add Courses</h2>
    <asp:entitydatasource id="CoursesEntityDataSource" runat="server" contexttypename="ContosoUniversity.DAL.SchoolEntities"
        enableflattening="False" entitysetname="Courses" enableinsert="True" enabledelete="True">
    </asp:entitydatasource>
    <asp:detailsview id="CoursesDetailsView" runat="server" autogeneraterows="False"
        datasourceid="CoursesEntityDataSource" datakeynames="CourseID" defaultmode="Insert"
        oniteminserting="CoursesDetailsView_ItemInserting">
        <fields>
            <asp:BoundField DataField="CourseID" HeaderText="ID" />
            <asp:BoundField DataField="Title" HeaderText="Title" />
            <asp:BoundField DataField="Credits" HeaderText="Credits" />
            <asp:TemplateField HeaderText="Department">
                <InsertItemTemplate>
                    <asp:EntityDataSource ID="DepartmentsEntityDataSource" runat="server" ConnectionString="name=SchoolEntities"
                        DefaultContainerName="SchoolEntities" EnableDelete="True" EnableFlattening="False"
                        EntitySetName="Departments" EntityTypeFilter="Department">
                    </asp:EntityDataSource>
                    <asp:DropDownList ID="DepartmentsDropDownList" runat="server" DataSourceID="DepartmentsEntityDataSource"
                        DataTextField="Name" DataValueField="DepartmentID"
                        oninit="DepartmentsDropDownList_Init">
                    </asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" />
        </fields>
    </asp:detailsview>
</asp:content>
