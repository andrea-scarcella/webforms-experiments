<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="WebformsMultipleChoiceQuestions.Secure.Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 100%;">
        <asp:ObjectDataSource ID="TestODS" runat="server" SelectMethod="getQuestions" 
            TypeName="WebformsMultipleChoiceQuestions.Dal.TestViewModel">
        </asp:ObjectDataSource>
        <div class="leftCol" style="float:left; width:30%;">
            <asp:GridView ID="QuestionGV" runat="server" DataSourceID="TestODS" 
                AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="id">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Text" HeaderText="Text" SortExpression="Text" />
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                </Columns>
            </asp:GridView>
        </div>
        <%--<div style="float:left; width:40%;"></div>--%>
        <div class="rightCol" style="float:right; width:30%;">
            <asp:GridView ID="AnswerGV" runat="server"  
                DataSourceID="QuestionODS" AutoGenerateColumns="False" DataKeyNames="aid" 
                onselectedindexchanged="AnswerGV_SelectedIndexChanged" 
                onselectedindexchanging="AnswerGV_SelectedIndexChanging">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="aid" HeaderText="aid" SortExpression="aid" />
                    <asp:BoundField DataField="text" HeaderText="text" SortExpression="text" />
                    <asp:CheckBoxField DataField="selected" HeaderText="selected" 
                        SortExpression="selected" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <asp:ObjectDataSource ID="QuestionODS" runat="server" 
        SelectMethod="getAnswersToQuestion" 
        TypeName="WebformsMultipleChoiceQuestions.Dal.TestViewModel" 
        UpdateMethod="updateSelectedAnswerForQuestion" 
        ConflictDetection="CompareAllValues">
        <SelectParameters>
            <asp:ControlParameter ControlID="QuestionGV" DefaultValue="-1" Name="qid" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="QuestionGV" Name="id" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="AnswerGV" Name="aid" 
                PropertyName="SelectedValue" Type="Int32" />
           
          <%--  <asp:Parameter Type="String"  Name="text"/>--%>
            <asp:Parameter  Type="Boolean" Name="selected" />
           
        </UpdateParameters>
    </asp:ObjectDataSource>
    </form>
</body>
</html>
