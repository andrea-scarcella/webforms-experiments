<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="StudentsAdd.aspx.cs" Inherits="ContosoUniversity.StudentsAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="server">
    <h2>
        Add New Students</h2>
    <asp:entitydatasource id="StudentsEntityDataSource" runat="server" contexttypename="ContosoUniversity.DAL.SchoolEntities"
       EntityTypeFilter="Student" enableflattening="False" enableinsert="True" entitysetname="People">
    </asp:entitydatasource>
    <asp:detailsview id="StudentsDetailsView" runat="server" datasourceid="StudentsEntityDataSource"
        autogeneraterows="False" defaultmode="Insert">
        <fields>
            <asp:BoundField DataField="FirstMidName" HeaderText="First Name" 
                SortExpression="FirstMidName" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                SortExpression="LastName" />
            <asp:BoundField DataField="EnrollmentDate" HeaderText="Enrollment Date" 
                SortExpression="EnrollmentDate" />
             <asp:CommandField ShowInsertButton="True" />
       </fields>
    </asp:detailsview>
</asp:content>
