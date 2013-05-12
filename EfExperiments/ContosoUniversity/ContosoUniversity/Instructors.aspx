<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Instructors.aspx.cs" Inherits="ContosoUniversity.Instructors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="server">
    <h2>
        Instructors</h2>
    <div style="float: left; margin-right: 20px;">
        <asp:entitydatasource id="InstructorsEntityDataSource" runat="server" contexttypename="ContosoUniversity.DAL.SchoolEntities"
            enableflattening="False" entitysetname="People" where="it.HireDate is not null"
            include="OfficeAssignment" enableupdate="True">
        </asp:entitydatasource>
        <asp:gridview id="InstructorsGridView" runat="server" allowpaging="True" allowsorting="True"
            autogeneratecolumns="False" datakeynames="PersonID" datasourceid="InstructorsEntityDataSource"
            onselectedindexchanged="InstructorsGridView_SelectedIndexChanged" selectedrowstyle-backcolor="LightGray"
            onrowupdating="InstructorsGridView_RowUpdating">
            <columns>
                <asp:CommandField ShowSelectButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="Name" SortExpression="LastName">
                    <ItemTemplate>
                        <asp:Label ID="InstructorLastNameLabel" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>,
                        <asp:Label ID="InstructorFirstNameLabel" runat="server" Text='<%# Eval("FirstMidName") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="InstructorLastNameTextBox" runat="server" Text='<%# Bind("FirstMidName") %>' Width="7em"></asp:TextBox>
                        <asp:TextBox ID="InstructorFirstNameTextBox" runat="server" Text='<%# Bind("LastName") %>' Width="7em"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hire Date" SortExpression="HireDate">
                    <ItemTemplate>
                        <asp:Label ID="InstructorHireDateLabel" runat="server" Text='<%# Eval("HireDate", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="InstructorHireDateTextBox" runat="server" Text='<%# Bind("HireDate", "{0:d}") %>' Width="7em"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Office Assignment" SortExpression="OfficeAssignment.Location">
                    <ItemTemplate>
                        <asp:Label ID="InstructorOfficeLabel" runat="server" Text='<%# Eval("OfficeAssignment.Location") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="InstructorOfficeTextBox" runat="server" 
                        Text='<%# Eval("OfficeAssignment.Location") %>' Width="7em"
                        oninit="InstructorOfficeTextBox_Init"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
            </columns>
            <selectedrowstyle backcolor="LightGray"></selectedrowstyle>
        </asp:gridview>
        <asp:label id="ErrorMessageLabel" runat="server" text="" visible="false" viewstatemode="Disabled">
        </asp:label>
        <h3>
            Courses Taught</h3>
        <asp:entitydatasource id="CoursesEntityDataSource" runat="server" contexttypename="ContosoUniversity.DAL.SchoolEntities"
            enableflattening="False" entitysetname="Courses" where="@PersonID IN (SELECT VALUE instructor.PersonID FROM it.People AS instructor)">
            <whereparameters>
                <asp:ControlParameter ControlID="InstructorsGridView" Type="Int32" Name="PersonID" PropertyName="SelectedValue" />
            </whereparameters>
        </asp:entitydatasource>
        <asp:gridview id="CoursesGridView" runat="server" autogeneratecolumns="False" datasourceid="CoursesEntityDataSource"
            allowsorting="True" datakeynames="CourseID">
            <emptydatatemplate>
                <p>No courses found.</p>
            </emptydatatemplate>
            <columns>
                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                <asp:BoundField DataField="CourseID" HeaderText="ID" ReadOnly="True" 
                    SortExpression="CourseID"></asp:BoundField>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                </asp:BoundField>
                <asp:TemplateField HeaderText="Department" SortExpression="DepartmentID">
                <ItemTemplate>
                        <asp:Label ID="GridViewDepartmentLabel" runat="server" Text='<%# Eval("Department.Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </columns>
        </asp:gridview>
    </div>
    <%-- ... --%>
    <div>
        <h3>
            Course Details</h3>
        <asp:entitydatasource id="CourseDetailsEntityDataSource" runat="server" contexttypename="ContosoUniversity.DAL.SchoolEntities"
            enableflattening="False" entitysetname="Courses" autogeneratewhereclause="False"
            where="it.CourseID = @CourseID" include="Department,OnlineCourse,OnsiteCourse,StudentGrades.Person"
            onselected="CourseDetailsEntityDataSource_Selected">
            <whereparameters>
                <asp:ControlParameter ControlID="CoursesGridView" Type="Int32" Name="CourseID" PropertyName="SelectedValue" />
            </whereparameters>
        </asp:entitydatasource>
        <asp:detailsview id="CourseDetailsView" runat="server" autogeneraterows="False" datasourceid="CourseDetailsEntityDataSource">
            <emptydatatemplate>
                <p>
                    No course selected.</p>
            </emptydatatemplate>
            <fields>
                <asp:BoundField DataField="CourseID" HeaderText="ID" ReadOnly="True" SortExpression="CourseID" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Credits" HeaderText="Credits" SortExpression="Credits" />
                <asp:TemplateField HeaderText="Department">
                    <ItemTemplate>
                        <asp:Label ID="DetailsViewDepartmentLabel" runat="server" Text='<%# Eval("Department.Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Location">
                    <ItemTemplate>
                        <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("OnsiteCourse.Location") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="URL">
                    <ItemTemplate>
                        <asp:Label ID="URLLabel" runat="server" Text='<%# Eval("OnlineCourse.URL") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </fields>
        </asp:detailsview>
       
    </div>
</asp:content>
