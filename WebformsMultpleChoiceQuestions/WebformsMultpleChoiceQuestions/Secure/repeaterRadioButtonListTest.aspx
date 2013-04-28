<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="repeaterRadioButtonListTest.aspx.cs"
    Inherits="WebformsMultipleChoiceQuestions.Secure.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                <br />
            </separatortemplate>
            <itemtemplate>
                <li>
                    <%#DataBinder.Eval(Container.DataItem, "Text")%>
                </li>
                <div>
                 <asp:RadioButtonList ID="RadioButtonList1" DataSource='<%#Eval("answers") %>' 
                 DataValueField="selected" DataTextField="text"
                 runat="server">
                  <%--  <asp:Repeater runat="server" ID="answerRepeater" DataSource='<%#Eval("answers") %>'>
                        <ItemTemplate>
                            <li>
                                <%#Eval("text")%>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>--%>
                    </asp:RadioButtonList>
                </div>
            </itemtemplate>
        </asp:repeater>
        <asp:objectdatasource id="ObjectDataSource1" runat="server" selectmethod="getQuestions"
            typename="WebformsMultipleChoiceQuestions.Dal.TestViewModel"></asp:objectdatasource>
    </div>
    <div>
    </div>
    </form>
</body>
</html>
