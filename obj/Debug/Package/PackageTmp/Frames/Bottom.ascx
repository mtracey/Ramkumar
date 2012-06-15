<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Bottom.ascx.cs" Inherits="SMEPayroll.Frames.Bottom" %>
<%@ Import Namespace="SMEPayroll" %>
<table width="100%" style="margin-left: 0px;"   background="../Frames/Images/TOOLBAR/backsTop.jpg"   >
    <tr valign="bottom" style="width:95%">
       <%if (Utility.AllowedAction1(Session["Username"].ToString(), "COMPANY NAME"))
        {%>
        <td>
            <img id="imgHome" style="vertical-align:bottom" alt="" src="../frames/images/STATUSBAR/CompanyName.png" title="Company name" border="0" runat="server" />
        </td>
        <td align="left">
            <div style="font:status-bar;vertical-align:middle;">
                <asp:Label ID="CompanyName"  runat="Server" ToolTip="Company name">
                </asp:Label>
            </div>
        </td>
        <td>
            <div>
             |
            </div>
        </td>
        <%}%>
        
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "EMPLOYEE NAME"))
        {%>
        <td>
            <img id="imgEmployeeName" style="vertical-align:bottom" alt="" src="../frames/images/STATUSBAR/EmployeeName.png" title="Employee Name" border="0" runat="server" />
        </td>
        <td>
            <div style="font:status-bar;">
                <asp:Label ID="EmployeeName" runat="Server" ToolTip="EmployeeName"></asp:Label>
            </div>
        </td>
        <td>
         |
        </td>
        <%}%>
        
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "EMPLOYEE GROUP"))
          {%>
        <td>
            <img id="img1" style="vertical-align:bottom" alt="" src="../frames/images/STATUSBAR/EmployeeName.png" title="Employee Rights" border="0" runat="server" />
        </td>
        <td>
            <div style="font:status-bar">
                <asp:Label ID="EmployeeGroup"  runat="Server" ToolTip="Employee Rights"></asp:Label>
            </div>
        </td>
        <td>
         |
        </td>
        <%}%>
        
        
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "USER NAME"))
          {%>
        <td>
            <img id="img2" style="vertical-align:bottom" alt="" src="../frames/images/STATUSBAR/LoginInfo.png" title="User Name" runat="server" />
        </td>
        <td>
            <div style="font:status-bar">
                <asp:Label ID="UserName"  runat="Server" ToolTip="UserName"></asp:Label>
            </div>
        </td>
        <td>
          <div>
            |
         </div>  
        </td>        
        <%}%>
        
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "LAST BACKUP"))
        {%>        
        <td>
            <img id="img3" style="vertical-align:bottom"  visible="false"  alt="" src="../frames/images/STATUSBAR/BackupInfo.png" title="Last Database Backup Taken" border="0" runat="server" />
        </td>
        <td align="right">
            <div>
                <img id="imgNotice1" style="vertical-align:middle" visible="false" runat="server" alt="" src="../frames/images/STATUSBAR/Error.png" title="Last Backup more than 3 days older" height="15" />
            </div>
        </td>
        <td>
            <div style="font:status-bar">
                <asp:Label ID="dbBackup"  runat="Server" ToolTip="Last Database Backup Taken"></asp:Label>
            </div>
        </td>
        <td>
            <div>                
              |
            </div>         
        </td>
        <%}%>
        
        
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "LICENSE INFO"))
          {%>
        <td>
            <img id="imgUserLicense"  visible="false" style="vertical-align:middle" alt="" src="../frames/images/STATUSBAR/License.png" title="License(Total-Used =Remaining) "  runat="server"/>
        </td>
        <td>
            <div>
                <img id="imgNotice2" style="vertical-align:middle" visible="false" runat="server" alt="" src="../frames/images/STATUSBAR/Error.png" title="License(Total-Used =Remaining)"  height="15" />
            </div>
        </td>
        <td>
            <div style="font:status-bar">
                <asp:Label ID="UserLicense"  runat="Server" ToolTip="License(Total-Used =Remaining)"></asp:Label>
            </div>
        </td>
        <td>
         <div>
            |
         </div>         
        </td>
        <%}%>
        
        
        <%if (Utility.AllowedAction1(Session["Username"].ToString(), "MAINTENANC EXPIRY"))
        {%>
        <td align="justify">
            <div>
                <img id="img4" visible="false" style="vertical-align:bottom" alt="" src="../frames/images/STATUSBAR/Support&MaintenanceInfo.png" title="Support And Maintenance Expiry" border="0" runat="server"/>
            </div>
        </td>
        <td align="justify">
            <div >
               <img id="img5" style="vertical-align:middle;" visible="false" runat="server" alt="" src="../frames/images/STATUSBAR/Error.png" title="Support And Maintenance Expiry"  height="15" />
            </div>            
        </td> 
        <td align="justify">
            <div style="font:status-bar">
                <asp:Label ID="lblMaintenanceDate"  runat="Server" ToolTip="Support And Maintenance Expiry"></asp:Label>
            </div>
        </td> 
        <%}%>
     </tr>
</table>
