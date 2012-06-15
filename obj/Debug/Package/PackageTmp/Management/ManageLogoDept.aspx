<%@ Page Language="C#" AutoEventWireup="true" Codebehind="ManageLogoDept.aspx.cs"
    Inherits="SMEPayroll.Management.ManageLogoDept" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radU" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />
    <style type="text/css">
        .bigModule
        {
            width: 750px;
            background: url(qsfModuleTop.jpg) no-repeat;
            margin-bottom: 15px;
        }
        .bigModuleBottom
        {
            background: url(qsfModuleBottom.gif) no-repeat bottom;
            color: #252f34;
            padding: 23px 17px;
            line-height: 16px;
            font-size: 12px;
        }
        .trstandtop
        {
	        font-family: Tahoma;
	        font-size: 11px;
            height: 20px; 
            vertical-align:top;
        }
        .trstandbottom
        {
	        font-family: Tahoma;
	        font-size: 11px;
            height: 20px; 
            vertical-align:bottom;
            valign:bottom;
        }
        .tdstand
        {
            height:30px;
            vertical-align:text-bottom;
            vertical-align:bottom;
            border-bottom-width:1px;
            border-bottom-color:Silver;
            border-bottom-style:inset;
	        font-family: Tahoma;
	        font-size: 12px;
	        font-weight:bold;
        }
        .tbl
        {
            cellpadding:0;
            cellspacing:0;
            border:0;
            background-color: White; 
            width: 100%; 
            height: 100%; 
            background-image: url(../Frames/Images/TOOLBAR/qsfModuleTop2.jpg);
            background-repeat: no-repeat;
        }
        .multiPage
        {
            float:left;
            border:1px solid #94A7B5;
            background-color:#F0F1EB;
            padding:4px;
            padding-left:0;
            width:85%;
            height:550px%;
            margin-left:-1px;                
        }
        
        .multiPage div
        {
            border:1px solid #94A7B5;
            border-left:0;
            background-color:#ECE9D8;
        }
        
        .multiPage img
        {
            cursor:no-drop;
        }
    
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock3" runat="server">

        <script type="text/javascript" language="javascript">
	    function myOnCientFileSelected(radUpload,eventArgs)
	    {  
            var image = document.getElementById("Image1");  
            if (image != null)
            {  
                var selectedFileName = eventArgs.FileInputField.value.toLowerCase();          
                var selectedFileExt = selectedFileName.substring(selectedFileName.lastIndexOf(".") + 1);        
                if (selectedFileExt=="gif" || selectedFileExt=="jpg" || selectedFileExt =="png" || selectedFileExt =="bmp" || selectedFileExt =="jpeg" )
                {            
                    image.src = selectedFileName;
                    document.employeeform.Hidden1.value=selectedFileName;
                }
            }
        }
        
        function myOnClientCleared(radUpload,eventargs)
        {
            var image = document.getElementById("Image1");
            image.src = null;     
        }
        </script>

    </telerik:RadCodeBlock>

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
        <table cellpadding="0" cellspacing="0" bgcolor="<% =sBorderColor %>" width="100%"
            border="0">
            <tr>
                <td>
                    <table cellpadding="5" cellspacing="0" width="100%" bgcolor="<% =sBaseColor %>" border="0">
                        <tr>
                            <td background="../frames/images/toolbar/backs.jpg" colspan="4">
                                <font class="colheading">&nbsp;&nbsp;&nbsp;<b>Manage Logo</b></font>
                            </td>
                        </tr>
                        <tr bgcolor="<% =sOddRowColor %>">
                            <td align="right" style="height: 25px">
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
            <radG:RadCodeBlock ID="RadCodeBlock1" runat="server">

                <script type="text/javascript">
                    function RowDblClick(sender, eventArgs)
                    {
                        sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
                    }
                </script>

            </radG:RadCodeBlock>
            <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="60%"
                border="0">
                <tr class="trstandbottom">
                    <td>
                        <a href="../Management/ManageDepartment.aspx">Department:</a>
                    </td>
                    <td>
                        Select File:
                    </td>
                    <td rowspan="2">
                        <asp:Button ID="button1" runat="server" CssClass="RadUploadSubmit" Text="Submit"
                            OnClick="buttonSubmit_Click" Style="margin-top: 6px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList OnSelectedIndexChanged="drpDept_SelectedIndexChanged" AutoPostBack="true"
                            ID="drpDept" runat="server" Width="100%">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <radU:RadUpload BackColor="transparent" BorderColor="transparent" EnableFileInputSkinning="false"
                            ID="file1" runat="server" InitialFileInputsCount="1" MaxFileInputsCount="1" OnClientClearing="myOnClientCleared"
                            ControlObjectsVisibility="none" Width="250px">
                        </radU:RadUpload>
                    </td>
                </tr>
            </table>
            <table cellpadding="1" cellspacing="0" bgcolor="<% =sBorderColor %>" width="60%"
                border="0">
                <tr>
                    <td colspan="3" align="left">
                        <img alt="" src="" id="Image1" runat="server" /></td>
                    <td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
