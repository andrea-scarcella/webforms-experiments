<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Departments.aspx.cs" Inherits="ContosoUniversity.DAL.Departments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="server">
    <h2>
        Departments</h2>
    <asp:objectdatasource id="DepartmentsObjectDataSource" runat="server" typename="ContosoUniversity.DAL.SchoolRepository"
        dataobjecttypename="ContosoUniversity.DAL.Department" selectmethod="GetDepartments"
        deletemethod="DeleteDepartment" updatemethod="UpdateDepartment" conflictdetection="CompareAllValues"
        oldvaluesparameterformatstring="orig{0}"></asp:objectdatasource>
    <asp:validationsummary id="DepartmentsValidationSummary" runat="server" showsummary="true"
        displaymode="BulletList" />
    <asp:gridview id="DepartmentsGridView" runat="server" autogeneratecolumns="False"
        datasourceid="DepartmentsObjectDataSource" datakeynames="DepartmentID" onrowupdating="DepartmentsGridView_RowUpdating">
        <columns>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"
                ItemStyle-VerticalAlign="Top">
            </asp:CommandField>
            <asp:DynamicField DataField="Name" HeaderText="Name" SortExpression="Name" ItemStyle-VerticalAlign="Top" />
            <asp:DynamicField DataField="Budget" HeaderText="Budget" SortExpression="Budget" ItemStyle-VerticalAlign="Top" />
            <asp:DynamicField DataField="StartDate" HeaderText="Start Date" ItemStyle-VerticalAlign="Top" />
            <asp:TemplateField HeaderText="Administrator" SortExpression="Person.LastName" ItemStyle-VerticalAlign="Top" >
                <ItemTemplate>
                    <asp:Label ID="AdministratorLastNameLabel" runat="server" Text='<%# Eval("Person.LastName") %>'></asp:Label>,
                    <asp:Label ID="AdministratorFirstNameLabel" runat="server" Text='<%# Eval("Person.FirstMidName") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:ObjectDataSource ID="InstructorsObjectDataSource" runat="server" DataObjectTypeName="ContosoUniversity.DAL.InstructorName"
                        SelectMethod="GetInstructorNames" TypeName="ContosoUniversity.DAL.SchoolRepository">
                    </asp:ObjectDataSource>
                    <asp:DropDownList ID="InstructorsDropDownList" runat="server" DataSourceID="InstructorsObjectDataSource"
                        SelectedValue='<%# Eval("Administrator")  %>'
                        DataTextField="FullName" DataValueField="PersonID" OnInit="DepartmentsDropDownList_Init" >
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
        </columns>
    </asp:gridview>
</asp:content>
