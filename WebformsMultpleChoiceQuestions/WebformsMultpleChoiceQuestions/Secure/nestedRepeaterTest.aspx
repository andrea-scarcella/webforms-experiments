<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="nestedRepeaterTest.aspx.cs" Inherits="WebformsMultipleChoiceQuestions.Secure.masterDetailTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <script src="../Scripts/radiobuttonFix.js" type="text/javascript"></script>
</asp:Content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="server">
    <div class="container">
        <asp:repeater runat="server" id="questionRepeater" datasourceid="ObjectDataSource1">
            <headertemplate>
            </headertemplate>
            <separatortemplate>
            <div class="separator"></div>
            </separatortemplate>
            <itemtemplate>
                   <p><%#DataBinder.Eval(Container.DataItem, "Text")%></p> 
                <div class="optielijst" id=''>
                    <asp:Repeater runat="server" ID="answerRepeater" DataSource='<%#Eval("answers") %>'>
                        <HeaderTemplate>
                            <%--<ul class="optielijst">--%>
                        </HeaderTemplate>
                        <FooterTemplate>
                            <%--</ul>--%>
                            </FooterTemplate>
                        <ItemTemplate>
                            <%--<%# ((RepeaterItem)Container.Parent.Parent).DataItem %>--%>
                            
                        <asp:RadioButton ID="RadioButton" runat="server" Text='<%#Eval("text") %>' GroupName='<%#DataBinder.GetPropertyValue(((RepeaterItem)Container.Parent.Parent).DataItem ,"id").ToString()+"RadioButtonGroup" %>' />
                        <br />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </itemtemplate>
        </asp:repeater>
        <asp:objectdatasource id="ObjectDataSource1" runat="server" selectmethod="getQuestions"
            typename="WebformsMultipleChoiceQuestions.Dal.TestViewModel"></asp:objectdatasource>
    </div>
    <hr />
    <asp:button id="submitButton" runat="server" onclick="submitButton_Click" text="Button" />
    <p>
        <asp:label id="outputLabel" runat="server" text="Label"></asp:label>
    </p>
</asp:content>
