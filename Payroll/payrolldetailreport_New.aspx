<%@ Page Language="C#" AutoEventWireup="true" Codebehind="payrolldetailreport_New.aspx.cs"
    Inherits="SMEPayroll.Payroll.payrolldetailreport_New" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payroll Detail Report</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />
</head>
<body>
    <form id="form12" runat="server">
        <table cellpadding="1" cellspacing="0" width="95%" border="0">
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" border="1" width="100%" bordercolor="LightGrey">
                        <tr>
                            <td>
                                <asp:Button ID="btnExcel" runat="server" Text="Export To Excel" OnClick="btnExcel_Click" /></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="gridPayDetailReport" runat="server" CellPadding="4" EmptyDataText="No Data Found"
                                    ShowFooter="true" ShowHeader="true" CellSpacing="1" BackColor="GrayText" RowStyle-Wrap="false"
                                    BorderWidth="1px" EnableModelValidation="True" ForeColor="#333333" GridLines="None"
                                    OnDataBound="gridPayDetailReport_DataBound">
                                    <AlternatingRowStyle BackColor="White" CssClass="bodytxt" />
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="AliceBlue" CssClass="bodytxt" Font-Bold="true" />
                                    <HeaderStyle BackColor="#3663BD" CssClass="bodytxt" Font-Bold="true" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" CssClass="bodytxt" />
                                    <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
