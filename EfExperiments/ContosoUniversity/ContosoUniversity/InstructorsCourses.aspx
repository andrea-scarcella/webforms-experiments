<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="InstructorsCourses.aspx.cs" Inherits="ContosoUniversity.InstructorsCourses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="server">
<h2>
    Assign Instructors to Courses or Remove from Courses</h2>
    <br />
    <asp:entitydatasource id="InstructorsEntityDataSource" runat="server" contexttypename="ContosoUniversity.DAL.SchoolEntities"
        enableflattening="False" entitysetname="People" where="it.HireDate is not null"
        select="it.LastName + ', ' + it.FirstMidName AS Name, it.PersonID">
    </asp:entitydatasource>
    Select an Instructor:
    <asp:dropdownlist id="InstructorsDropDownList" runat="server" datasourceid="InstructorsEntityDataSource"
        autopostback="true" datatextfield="Name" datavaluefield="PersonID" onselectedindexchanged="InstructorsDropDownList_SelectedIndexChanged"
        ondatabound="InstructorsDropDownList_DataBound">
    </asp:dropdownlist>
    <h3>
        Assign a Course</h3>
    <br />
    Select a Course:
    <asp:dropdownlist id="UnassignedCoursesDropDownList" runat="server" datatextfield="Title"
        datavaluefield="CourseID">
    </asp:dropdownlist>
    <br />
    <asp:button id="AssignCourseButton" runat="server" text="Assign" onclick="AssignCourseButton_Click" />
    <br />
    <asp:label id="CourseAssignedLabel" runat="server" visible="false" text="Assignment successful">
    </asp:label>
    <br />
    <h3>
        Remove a Course</h3>
    <br />
    Select a Course:
    <asp:dropdownlist id="AssignedCoursesDropDownList" runat="server" datatextfield="title"
        datavaluefield="courseiD">
    </asp:dropdownlist>
    <br />
    <asp:button id="RemoveCourseButton" runat="server" text="Remove" onclick="RemoveCourseButton_Click" />
    <br />
    <asp:label id="CourseRemovedLabel" runat="server" visible="false" text="Removal successful">
    </asp:label>
</asp:content>
