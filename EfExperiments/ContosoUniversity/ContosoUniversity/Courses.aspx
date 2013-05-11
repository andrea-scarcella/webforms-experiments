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
        contexttypename="ContosoUniversity.DAL.SchoolEntities" enableflattening="False"
        entitysetname="Courses" where="">
        <whereparameters>
            <asp:ControlParameter ControlID="DepartmentsDropDownList" Name="DepartmentID" 
                PropertyName="SelectedValue" Type="Int32" />
        </whereparameters>
    </asp:entitydatasource>Select a department
    <asp:dropdownlist id="DepartmentsDropDownList" runat="server" datasourceid="DepartmentsEntityDataSource"
        datatextfield="Name" datavaluefield="DepartmentID" autopostback="True">
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
      <h2>
          Courses by Name</h2>
    Enter a course name 
    <asp:textbox id="SearchTextBox" runat="server">
    </asp:textbox>
     <asp:button id="SearchButton" runat="server" text="Search" />
    <br />
<br />
    <asp:entitydatasource id="SearchEntityDataSource" runat="server" contexttypename="ContosoUniversity.DAL.SchoolEntities"
        enableflattening="False" entitysetname="Courses" include="Department">
        <%--include="Department" ==> performance++ because EF retrieves two tables in a single call instead of two calls--%>
    </asp:entitydatasource>
      <asp:queryextender id="SearchQueryExtender" runat="server" targetcontrolid="SearchEntityDataSource">
          <asp:searchexpression searchtype="StartsWith" datafields="Title">
              <asp:controlparameter controlid="SearchTextBox" />
          </asp:searchexpression>
          <asp:orderbyexpression datafield="Department.Name" direction="Ascending">
              <asp:thenby datafield="Title" direction="Ascending" />
          </asp:orderbyexpression>
      </asp:queryextender>

         <asp:gridview id="SearchGridView" runat="server" autogeneratecolumns="False" datakeynames="CourseID"
             datasourceid="SearchEntityDataSource" allowpaging="true">
             <columns>
            <asp:TemplateField HeaderText="Department">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Department.Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CourseID" HeaderText="ID"/>
            <asp:BoundField DataField="Title" HeaderText="Title" />
            <asp:BoundField DataField="Credits" HeaderText="Credits" />
        </columns>
         </asp:gridview>
</asp:content>