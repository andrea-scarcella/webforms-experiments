<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="repeaterRadioButtonListTest.aspx.cs"
    Inherits="WebformsMultipleChoiceQuestions.Secure.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <asp:repeater runat="server" id="questionRepeater" onitemdatabound="questionRepeater_ItemDataBound"
            datasourceid="ObjectDataSource1">
            <headertemplate>
                Vraag
            </headertemplate>
            <separatortemplate>
               <div class="separator"></div>
            </separatortemplate>
            <itemtemplate>
                <p><%#DataBinder.Eval(Container.DataItem, "Text")%></p>
                <div class="optielijst">
                 <asp:RadioButtonList ID="RadioButtonList1" DataSource='<%#Eval("answers") %>' 
                 DataValueField="aid" DataTextField="text"
                 runat="server">
                  <%-- <asp:listitem id="option1" runat="server" value='<%#Eval("id") %>'/>--%>
                 </asp:RadioButtonList>
                 <asp:RequiredFieldValidator runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="RequiredFieldValidator"> </asp:RequiredFieldValidator>
                </div>
            </itemtemplate>
        </asp:repeater>
        <asp:objectdatasource id="ObjectDataSource1" runat="server" selectmethod="getQuestions"
            typename="WebformsMultipleChoiceQuestions.Dal.TestViewModel"></asp:objectdatasource>
    </div>
    <div>
        <asp:button id="submitButton" runat="server" text="Button" onclick="submitButton_Click" />
    </div>
    </form>
</body>
</html>
