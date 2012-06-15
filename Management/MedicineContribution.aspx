<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicineContribution.aspx.cs" Inherits="SMEPayroll.Management.MedicineContribution" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="SMEPayroll" Namespace="SMEPayroll" TagPrefix="sds" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />
        <script language="JavaScript1.2"> 
<!-- 

if (document.all)
window.parent.defaultconf=window.parent.document.body.cols
function expando(){
window.parent.expandf()

}
document.ondblclick=expando 

-->
    </script>
</head>
<body style="margin-left: auto">
    <form id="form1" runat="server">
        <radG:RadScriptManager ID="RadScriptManager1" runat="server">
        </radG:RadScriptManager>
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
          <table cellpadding="0"  cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Additional Medisave Contribution Scheme</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="<% =sOddRowColor %>">
                            <td align="right"style="height: 25px">
                                <input id="Button2" type="button" onclick="history.go(-1)" value="Back" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                    </table>
                </td>
                <%--<td width="5%">
                    <img alt="" src="../frames/images/EMPLOYEE/Top-Employeegrp.png" /></td>--%>
            </tr>
        </table>
        <div>
             <center>
               <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
                border="0">
                <tr>
                    <td colspan="2" valign="top" align="left">
                   <radG:RadGrid ID="RadGrid4" runat="server" GridLines="None" Skin="Outlook" Width="95%"
                            OnInsertCommand="RadGrid4_InsertCommand" OnNeedDataSource="RadGrid4_NeedDataSource"
                            OnUpdateCommand="RadGrid4_UpdateCommand" OnDeleteCommand="RadGrid4_DeleteCommand">
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id,CSN" CommandItemDisplay="Bottom">
                                <ExpandCollapseColumn Visible="False">
                                    <HeaderStyle Width="19px"></HeaderStyle>
                                </ExpandCollapseColumn>
                                <RowIndicatorColumn Visible="False">
                                    <HeaderStyle Width="20px"></HeaderStyle>
                                </RowIndicatorColumn>
                                <Columns>
                                    <radG:GridBoundColumn Visible="false" DataField="id" UniqueName="id">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="CSN" HeaderText="CSN" SortExpression="CSN">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="FormulaId" HeaderText="Formula Id" SortExpression="FormulaId">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="FormulaType" HeaderText="Formula Type" SortExpression="FormulaType">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="Formula" HeaderText="Formula / Amount" SortExpression="Formula">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="AMCSLimit" HeaderText="AMCS Limit" SortExpression="AMCSLimit">
                                    </radG:GridBoundColumn>
                                    <radG:GridBoundColumn DataField="AMCSRound" HeaderText="AMCS Rounding Option" SortExpression="AMCSRound">
                                    </radG:GridBoundColumn>
                                    <radG:GridEditCommandColumn Visible ="true"  ButtonType="ImageButton">
                                    </radG:GridEditCommandColumn>
                                    <radG:GridButtonColumn ConfirmText="Delete this record?" ButtonType="ImageButton"
                                        ImageUrl="../frames/images/toolbar/Delete.gif" CommandName="Delete" Text="Delete"
                                        UniqueName="DeleteColumn">
                                        <ItemStyle Width="50px" />
                                    </radG:GridButtonColumn>
                                </Columns>
                                <CommandItemSettings AddNewRecordText="Add New CSN details" />
                                <EditFormSettings UserControlName="MedicalControl.ascx" EditFormType="WebUserControl">
                                </EditFormSettings>
                            </MasterTableView>
                        </radG:RadGrid>
                    </td>
                    
                </tr>
            </table>
            </center>
        </div>
    </form>
</body>
</html>
