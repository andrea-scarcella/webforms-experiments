<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="ContosoUniversity.About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:content id="BodyContent" runat="server" contentplaceholderid="MainContent">
    <h2>
        Student Body Statistics</h2>
    <asp:entitydatasource id="StudentStatisticsEntityDataSource" runat="server" 
    contexttypename="ContosoUniversity.DAL.SchoolEntities"
    enableflattening="False" entitysetname="People"
        groupby="it.EnrollmentDate" select="it.EnrollmentDate, Count(it.EnrollmentDate) AS NumberOfStudents"
        where="it.EnrollmentDate is not null">
    </asp:entitydatasource>
    <asp:gridview id="StudentStatisticsGridView" runat="server" autogeneratecolumns="False"
        datasourceid="StudentStatisticsEntityDataSource">
        <columns>
            <asp:BoundField DataField="EnrollmentDate" DataFormatString="{0:d}" 
                HeaderText="Date of Enrollment" 
                ReadOnly="True" SortExpression="EnrollmentDate" />
            <asp:BoundField DataField="NumberOfStudents" HeaderText="Students" 
                ReadOnly="True" SortExpression="NumberOfStudents" />
        </columns>
    </asp:gridview>
</asp:content>
