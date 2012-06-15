<%@ Control Language="C#" AutoEventWireup="true" Codebehind="TopRightMenu.ascx.cs"
    Inherits="SMEPayroll.Frames.TopRightMenu" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<link rel="stylesheet" href="../style/MenuStyle.css" type="text/css" />
    <script language="javascript" type="text/javascript">
        function compclick()
        {
            var vCompid = document.getElementById("txtComp").value;
            window.top.parent.frames[2].location = "../Company/AddCompanyNew.aspx?compid=" + vCompid;
        }
        function homeclick()
        {
           window.location.href = "../frames/right.aspx"; 
            window.parent.frames[1].location = "../Main/Home.aspx";
        }
          function logoutclick()
        {
            window.parent.location.href  = "../Index.aspx";
        }
    </script>
    

   <style type="text/css">   
   .logoutin:ACTIVE, .logoutin:VISITED, .logoutin:LINK
        {
	       background: transparent;
	       text-decoration: none;
	       font: 11px/11px 'Segoe UI', Tahoma;
	       color: Black;
        }  
    </style>
<table width="100%" cellpadding="0" cellspacing="0" border="0"  style="height:25px; background-image: url(../Frames/Images/TOOLBAR/backsTop.jpg); vertical-align:bottom;" >
    <tr visible="true">
        <td colspan="4">
            <div>
                <telerik:RadWindowManager ID="radWindiowMng" runat="server">
                </telerik:RadWindowManager>
            </div>
            <div>
                 <telerik:RadWindow ID="radWindow" skin="Outlook" 
                    runat="server"  Animation="Fade" AnimationDuration="2900"
                    IconUrl="../frames/Images/Other/CHM.ico"  
                    VisibleStatusbar="true" VisibleTitlebar="true"  ReloadOnShow="true"
                    AutoSize="false" Top="25" Width="500" Height="400" Left="495"  
                    ShowContentDuringLoad="true" >
                </telerik:RadWindow>
            </div>
        </td>
    </tr>
    
    <tr><%--width="80%"--%>
       <%-- <td width="10px"style="height: 27px;"  ><a href="#" onclick="javascript:homeclick();"  class="logoutin" title="Home" >&nbsp;&nbsp;Home&nbsp;&nbsp;--%>  
      <%--     <img id="imgHome" style="vertical-align: top" alt="" src="../frames/images/toolbar/S - Home.png"
            border="0" onclick="javascript:homeclick();"   runat="server" />--%></a>
        <%--</td>--%>
         <%--width="646px"--%>
       <td width="770px" background="../frames/images/toolbar/backsTop.jpg" style="height: 27px" valign="top" >
          <div>
             <asp:Panel Visible="true" ID="MenuPanel"  runat="server" BorderStyle="None" BorderWidth="0px" >
             </asp:Panel>
          </div>
       </td>
       <td width="1%"   background="../frames/images/toolbar/backsTop.jpg"  style="display:none" valign="top" >
            <div>
             <asp:TextBox runat="server" Width="0%" Height="0%" ID="txtBox1"></asp:TextBox>
            </div>
       </td>
      <%-- <td align="left"  style="height: 27px" style="padding-top:5px;"  ><a href="#" title="LogOut" onclick="javascript:logoutclick();" class="logoutin"  >&nbsp;Logout--%>
     <%--  <img id="imgLogOut" style="vertical-align: top" alt="" src="../frames/images/toolbar/S - Logout.png"
            border="0" onclick="javascript:logoutclick();"  runat="server" />--%>
      <%--      </a>
       </td>--%>
       
    </tr>    
   
</table>

<script language="javascript" type="text/javascript">
    function myUrl(menuURL)
    {
        var leftMenuUrl=menuURL.split("__");
        parent.workarea.location=leftMenuUrl[0];
        window.parent.frames[0].location = leftMenuUrl[1];
        return  false;
    }

    function Hover(sender)  
    {  
    var div=sender;  
    div.style.fontSize = "13px";
    div.style.fontWeight = "bold";
    div.style.color = "blue";
    }   

    function MouseOut(sender)  
    {  
    var div=sender;  
    div.style.fontSize = "11px";
    div.style.fontWeight = "";
    div.style.color= "Black";
    } 
    
    var newURL;
    function OpenWindow()
    {
        var variable1=document.getElementById("<%= txtBox1.ClientID %>");
        var oWnd = $find("<%= radWindow.ClientID %>"); 
        GetNewUrl();                
        var url= newURL + "/frames/help.aspx?Pagename="+variable1.value;         
        oWnd.setUrl(url);              
        oWnd.show();
        return false;
    } 
        
    function OpenWindowLic()
    {
        var variable1=document.getElementById("<%= txtBox1.ClientID %>");
        var oWnd = $find("<%= radWindow.ClientID %>");
        GetNewUrl();        
        var url= newURL + "Management/CertificateInformaton.aspx";                 
        oWnd.setUrl(url);            
        oWnd.show();            
        return false;
    } 
    
     function OpenWindowAbout()
    {
        var variable1=document.getElementById("<%= txtBox1.ClientID %>");
        var oWnd = $find("<%= radWindow.ClientID %>");
        GetNewUrl();                
        var url= newURL + "/frames/help.aspx?Pagename="+'about';         
        oWnd.setUrl(url);              
        oWnd.show();
        return false;
    } 
    
    function OpenWindowUG()
    {
        //var variable1=document.getElementById("<%= txtBox1.ClientID %>");
        //var oWnd = $find("<%= radWindow.ClientID %>");
        //GetNewUrl();        
        //var url= newURL + "help/about.htm";
        //oWnd.setUrl(url);            
        //oWnd.show();
        window.open("http://www.smepayroll.com/Singapore/Payroll/download.shtml");        
        return false;
    } 
    
    function GetNewUrl()
    {
        var url = window.location.href;
        var mySplitResult = url.split("/");        
         for(i = 0; i < mySplitResult.length-2; i++)
         {
               if(i==0)
                {
                    newURL=mySplitResult[i]+"//";
                }                
                else if(mySplitResult[i]!="")
                {
                    newURL=newURL+mySplitResult[i]+"/";
                }
         }         
    }
    
    
</script>

