<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default_old.aspx.cs" Inherits="SMEPayroll.Frames.default_old" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
    
    <head> 
        <%if(Session["ANBPRODUCT"] != null)
        {%>
            <title><%=Session["ANBPRODUCT"]%>PAYROLL 9.0 WEB PORTAL</title>
        <%}%>
        <%else
        {%>
            <title></title>
        <%}%>  
        
       <script type="text/javascript">
       
            window.onload = LoadXml();
            function LoadXml()
            {
                loadxml();            
            }
                      
            var xmlDoc;
            var screenWidth;
            var screenHeight;

            //Details
            var val1;
            var val2;
            var val3;
            var val4;

            var screenWidth1;
            var screenHeight1;
            var domain_name;
            var port_number;
            var sep='/';
             var sep1=':';
                    
            function loadxml()
            {
                  xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                  xmlDoc.async = false;
                  
                 
                  var newURL;
                  var url = window.location.href;                 
                  var mySplitResult = url.split("/");
                  var i;
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
                  var url= newURL + "xml/Resolution.xml";                  
                  xmlDoc.load(url); 
                  screenWidth   =   screen.width;
                  screenHeight  =   screen.height;
                  var root = xmlDoc.getElementsByTagName('Resolution');  
                  for (i = 0; i < root[0].childNodes.length; i++) 
                  {
                        screenWidth1=xmlDoc.documentElement.childNodes[i].attributes.getNamedItem("width").nodeValue;
                        screenHeight1=xmlDoc.documentElement.childNodes[i].attributes.getNamedItem("height").nodeValue;
                        
                        if(screenWidth==screenWidth1)
                        { 
                            if(screenHeight==screenHeight1)
                            {
                                val1=xmlDoc.documentElement.childNodes[i].attributes.getNamedItem("val1").nodeValue;
                                val2=xmlDoc.documentElement.childNodes[i].attributes.getNamedItem("val2").nodeValue;
                                val3=xmlDoc.documentElement.childNodes[i].attributes.getNamedItem("val3").nodeValue;
                                val4=xmlDoc.documentElement.childNodes[i].attributes.getNamedItem("val4").nodeValue;
                            }
                        }
                    }
             }
             
             
             function GetDomainName() 
             {
                
                var url_parts = url.split("/");                 
                var domain_name_parts = url_parts[2].split(":");
                domain_name = domain_name_parts[0];                  
             }
             
             function GetPortNumber() 
             {
                //var url = window.location.href;
               // var url_parts = url.split(sep);
               // var domain_name_parts = url_parts[2].split(sep1);
               // port_number = domain_name_parts[1];
               //test
             }
                   
         </script>         
    </head>

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


    <script type="text/javascript" >       
        document.write('<frameset  rows="'+ val1 + ','+ val2 + '" border="0">') 
                        document.write('<frameset     id="FrameName" cols="13%,87%"  >')
                            document.write('<frame name="main"  id="idmain" onload="LoadXml();"   src="right.aspx" scrolling="no" noresize>')
                            document.write('<FRAME name="workarea"  id="workarea" src="../main/home.aspx"  scrolling="auto" noresize>')
                         document.write('</frameset>')
                 document.write('<frame src="bottom.aspx">')
         document.write('</frameset>')                     
    </script>
</html>

