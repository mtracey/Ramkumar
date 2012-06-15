<%@ Page Language="c#" Codebehind="default.aspx.cs" AutoEventWireup="false" Inherits="SMEPayroll.frames._default"  %>
<%@ Register TagPrefix="uc1" TagName="BottomCtrl" Src="~/Frames/Bottom.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%if (Session["ANBPRODUCT"] != null)
          {%>
    <title>
        <%=Session["ANBPRODUCT"]%>
        PAYROLL 9.0 WEB PORTAL</title>
    <%}%>
    <%else
        {%>
    <title></title>
    <%}%>
    <link rel="stylesheet" href="../Style/PMSStyle.css" type="text/css" />

    <style type="text/css"> 
       iframe 
       {     
       margin: 0px !important;     
       padding: 0px !important;     
       /*background: blue; /* this is just to make the frames easier to see */     
       border: 0px !important; }  
       html, body 
       {     margin: 0px !important;     
       padding: 0px !important;     
       border: 0px !important;     
       width: 100%;     
       height: 100%; 
       } 
       
    </style>
    
    <script type="text/javascript" > 
        
        function expandf()
        {
            if (document.all)
            {
                if (parent.FrameName.cols!="0%,87%")
                {
                    parent.FrameName.cols = "0%,87%";
                }
                else
                {
                    parent.FrameName.cols = "16%,84%";
                }
            }
        }
    </script> 

    <script language="javascript" type="text/javascript">
    function myUrl(menuURL)
    {
        var leftMenuUrl=menuURL.split("__");
        parent.workarea.location=leftMenuUrl[0];
        window.parent.frames[0].location = leftMenuUrl[1];
        return  false;
    }
    </script>

    <style type="text/css">   
    html, body, form   
    {   
       height: 100%;   
       margin: 0px;   
       padding: 0px;  
       overflow: hidden; 
    }   
    </style>

    <%--<script type="text/javascript">
        var sessionTimeout = 5;
        function DisplaySessionTimeout()
        {
            //assigning minutes left to session timeout to Label
            document.getElementById("<%= lblSessionTime.ClientID %>").innerText =sessionTimeout;
            sessionTimeout = sessionTimeout - 1;
            
            //if session is not less than 0
            if (sessionTimeout >= 0)
                //call the function again after 1 minute delay
                //window.setTimeout("DisplaySessionTimeout()", 60000);
                window.setTimeout("DisplaySessionTimeout()", 2000);
            else
            {
                //show message box
                alert("Your current Session is over.");
            }
        }
        
        
          function checkFrame() {  
           var iframe = document.frames['workarea']; 
     
            if(iframe == null) 
            {
              alert('Frame not found'); 
            }
            else { 
                if(iframe.document == null)
                   { 
                    alert('Frame exists, but page has not yet loaded'); 
                    }
                else 
                {
                   DisplaySessionTimeout()
                   alert('Frame exists, and page is loaded!'); 
                    
                 }
            } 
        }
        
        function iframeload()
        {
          alert("called");
        }
        
</script> --%>


</head><%--onload="checkFrame();"--%>
<body  >
    <form id="form1" runat="server">
        <radG:RadScriptManager ID="ScriptManager" runat="server"  ScriptMode="Release">
             <Scripts>
                <asp:ScriptReference Path="Init.js" />
            </Scripts>
        </radG:RadScriptManager>
       <%--  <div>
            fsdfs=<asp:Label ID="lblSessionTime" runat="server" Text=""></asp:Label>
         </div>--%>
         
          <telerik:RadSplitter ID="Radsplitter5" runat="server" Height="100%" Width="100%" >
            <telerik:RadPane ID="Radpane10" runat="server" Scrolling="none">
                <telerik:RadSplitter ID="Radsplitter6" runat="server" Orientation="Horizontal">
                
                    <telerik:RadPane ID="Radpane11" runat="server" Height="100%" Width="100%">
                        <!-- top -->
                        <radG:RadSplitter ID="RadSplitter2" runat="server" Height="100%" Width="100%" Skin="Outlook">
                            <telerik:RadPane ID="LeftPane" runat="server" Width="22" Scrolling="none">
                                <telerik:RadSlidingZone ID="SlidingZone1" runat="server" Width="22"  ><%--Title="SIDE BAR MENU WITH SAME OPTIONS" DockOnOpen="true" --%>
                                    <telerik:RadSlidingPane ID="Pane1"  runat="server" Width="190" MaxWidth="190" Scrolling="none"   Title="SIDE BAR MENU" >
                                       <!--Left Menu Start-->
                                          <iframe id="idmain" class="iframeautowidth" src="right.aspx" scrolling="no" width="100%"
                                                    height="100%" frameborder="0" marginheight="0px" marginwidth="0px"    ></iframe>
                                       <!--Left Menu End-->
                                    </telerik:RadSlidingPane>
                                </telerik:RadSlidingZone>
                            </telerik:RadPane>
                            
                            <radG:RadPane runat="server" ID="RightRadpane2" Width="84.6%" Scrolling="none" Height="100%">
                                <iframe id="workarea" class="iframeautowidth" src="../main/home.aspx" width="100%" 
                                    height="100%" frameborder="0" marginheight="0px" marginwidth="0px"  ></iframe>
                            </radG:RadPane>
                        </radG:RadSplitter>
                        <!-- top end -->
                    </telerik:RadPane>
                    
                   <radG:RadSplitBar runat="server" ID="RadSplitbar2" CollapseMode="Backward" width="20px"   />
                    
                    <telerik:RadPane ID="Radpane12" runat="server" Scrolling="none" Height="69px" Width="100%" MaxHeight="100" >
                        <telerik:RadSplitter ID="Radsplitter1" runat="server">
                            <telerik:RadPane ID="Radpane1" runat="server" Scrolling="none" >
                                <!-- bottom -->
                                <iframe id="Iframe1" class="iframeautowidth" src="bottom.aspx" width="100%"
                                    height="100%" frameborder="0" marginheight="0px" marginwidth="0px" ></iframe>
                                <!-- bottom end -->
                            </telerik:RadPane>
                        </telerik:RadSplitter>
                    </telerik:RadPane>
                    
                </telerik:RadSplitter>
            </telerik:RadPane>
        </telerik:RadSplitter> 
    
    </form>
</body>
</html>
