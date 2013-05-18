<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="DepartmentsAdd.aspx.cs" Inherits="ContosoUniversity.DepartmentsAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="server">
    <h2>
        Departments</h2>
    <asp:objectdatasource id="DepartmentsObjectDataSource" runat="server" typename="ContosoUniversity.DAL.SchoolRepository"
        dataobjecttypename="ContosoUniversity.DAL.Department" insertmethod="InsertDepartment">
    </asp:objectdatasource>
    <asp:detailsview id="DepartmentsDetailsView" runat="server" datasourceid="DepartmentsObjectDataSource"
        autogeneraterows="False" defaultmode="Insert" oniteminserting="DepartmentsDetailsView_ItemInserting">
        <fields>
            <asp:DynamicField DataField="Name" HeaderText="Name" />
            <asp:DynamicField DataField="Budget" HeaderText="Budget" />
            <asp:DynamicField DataField="StartDate" HeaderText="Start Date" />
            <asp:TemplateField HeaderText="Administrator">
                <InsertItemTemplate>
                    <asp:ObjectDataSource ID="InstructorsObjectDataSource" runat="server" 
                        TypeName="ContosoUniversity.DAL.SchoolRepository" 
                        DataObjectTypeName="ContosoUniversity.DAL.InstructorName"
                        SelectMethod="GetInstructorNames" >
                    </asp:ObjectDataSource>
                    <asp:DropDownList ID="InstructorsDropDownList" runat="server" 
                        DataSourceID="InstructorsObjectDataSource"
                        DataTextField="FullName" DataValueField="PersonID" OnInit="DepartmentsDropDownList_Init">
                    </asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" />
        </fields>
    </asp:detailsview>
    <asp:validationsummary id="DepartmentsValidationSummary" runat="server" showsummary="true"
        displaymode="BulletList" />
</asp:content>
