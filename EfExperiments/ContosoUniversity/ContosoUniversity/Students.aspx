<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Students.aspx.cs" Inherits="ContosoUniversity.Students" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="server">
    <h2>
        Student List</h2>
    <asp:entitydatasource id="StudentsEntityDataSource" runat="server" contexttypename="ContosoUniversity.DAL.SchoolEntities"
        enabledelete="True" enableflattening="False" enableupdate="True" entitysetname="People"
        include="StudentGrades"  
        EntityTypeFilter="" Select="" Where="it.EnrollmentDate is not null" 
        OrderBy="it.LastName">
    </asp:entitydatasource>
    <asp:gridview id="StudentsGridView" runat="server" allowpaging="True" allowsorting="True"
        autogeneratecolumns="False" datakeynames="PersonID" datasourceid="StudentsEntityDataSource">
        <columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
            </asp:CommandField>
         
             <asp:TemplateField HeaderText="Name" SortExpression="LastName">
                <EditItemTemplate>
                    <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                    <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstMidName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                <%--no need to access data from page codebehind use EVAL instead of BIND--%>
                    <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>,
                    <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstMidName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <%--short date format {0:d}--%>
           <asp:TemplateField HeaderText="Enrollment Date" SortExpression="EnrollmentDate">
                <EditItemTemplate>
                    <asp:TextBox ID="EnrollmentDateTextBox" runat="server" Text='<%# Bind("EnrollmentDate", "{0:d}") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="EnrollmentDateLabel" runat="server" Text='<%# Eval("EnrollmentDate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
               <asp:TemplateField HeaderText="Number of Courses">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("StudentGrades.Count") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </columns>
    </asp:gridview>
</asp:content>
