








function CreateXmlDocument(bFreeThreaded)
{
if (bFreeThreaded == undefined)
{
bFreeThreaded = false;
}

var oXml = new ActiveXObject(bFreeThreaded ? "Msxml2.FreeThreadedDOMDocument" : "Msxml2.DOMDocument");
oXml.async = false;
oXml.resolveExternals = false;
return oXml;
}




function loadXmlDocument(sXml)
{
var oXml = CreateXmlDocument();
oXml.loadXML(sXml);

return oXml;
}




function CreateXslTemplate()
{
var oXslt = new ActiveXObject("Msxml2.XSLTemplate");
return oXslt;
}




function CreateXmlHttp()
{
var oXmlHttp = null;
if(window.XMLHttpRequest)
{
oXmlHttp = new XMLHttpRequest();
}
else
{
var arrProgIds = ["Msxml2.XMLHTTP","Microsoft.XMLHTTP"];
for(var iCount = 0; iCount < arrProgIds.length;iCount++)
{
try
{
oXmlHttp = new ActiveXObject(arrProgIds[iCount]);
break;
}
catch(e){}
}
}
return oXmlHttp;
}
