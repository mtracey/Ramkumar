

function RemoteCommand(sObject, sCommand, sUrlBase)
{

this.Command = sCommand;
this.GetParameter = getParameter;
this.ErrorHandler = RemoteCommandDefaultErrorHandler;

var sXmlDocumentStart = "";
var sXmlDocumentEnd = "";
var oXmlHttp = CreateXmlHttp();
var aParameters = new Array();
var sCommandNamespace = _sWebServicesNamespace;
if (IsNull(sUrlBase))
{
sUrlBase = prependOrgName("/AppWebServices/");
}
var sUrl = sUrlBase + sObject + ".asmx";

sXmlDocumentStart += "<?xml version=\"1.0\" encoding=\"utf-8\" ?>"

sXmlDocumentStart += "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\">";
sXmlDocumentStart += "<soap:Body>"

sXmlDocumentStart += "<" + CrmEncodeDecode.CrmXmlEncode(sCommand) + " xmlns=\"" + sCommandNamespace + "\">"

sXmlDocumentEnd += "</" + CrmEncodeDecode.CrmXmlEncode(sCommand) + ">";
sXmlDocumentEnd += "</soap:Body>";
sXmlDocumentEnd += "</soap:Envelope>";

this.Execute = execute;
this.SetParameter = setParameter;
this.Abort = abort;

function getParameter(sName)
{
var i = aParameters[sName];
if (!IsNull(i))
{
return aParameters[i];
}
return null;
}

function setParameter(sName, sValue)
{

var oParameter = (IsNull(sValue))? sName : new CommandParameter(sName, sValue);
if (!IsNull(aParameters[oParameter.Name]))
{
aParameters[aParameters[oParameter.Name]] = oParameter;
}
else
{
aParameters[oParameter.Name] = aParameters.length;
aParameters.push(oParameter);
}
}

function abort()
{
oXmlHttp.abort();
}

function execute(funAsyncCallbackFunction)
{
var sXmlDocument = sXmlDocumentStart;

if (oXmlHttp.readyState > 0 && oXmlHttp.readyState < 4)
{

abort();
}

for (var i = 0; i < aParameters.length; i++)
{
sXmlDocument += aParameters[i].GetXml();
}
sXmlDocument += sXmlDocumentEnd;
var async = !IsNull(funAsyncCallbackFunction);
if (async)
{


var oAsyncResultHandler = new AsyncResultHandler(this, oXmlHttp, funAsyncCallbackFunction);
oXmlHttp.onreadystatechange = oAsyncResultHandler.ReadyStateChanged;
}
var bTryAgain;

do
{
bTryAgain = false;

oXmlHttp.open("POST", sUrl, async);
oXmlHttp.setRequestHeader("SOAPAction", sCommandNamespace + "/" + sCommand);
oXmlHttp.setRequestHeader("Content-Type", "text/xml; charset=utf-8");
oXmlHttp.setRequestHeader("Content-Length", sXmlDocument.length);
SetTokenInHeader(oXmlHttp, sUrl);

try
{
oXmlHttp.send(sXmlDocument);
}
catch(e)
{

bTryAgain = window.confirm(LOCID_REMOTECOMMAND_ERROR);

if(bTryAgain)
{
oXmlHttp = CreateXmlHttp();
}
}
} while(bTryAgain);
if (!async)
{
return new RemoteCommandResult(this, oXmlHttp);
}
}
}


function RemoteCommandDefaultErrorHandler(sHResult, oXmlNode)
{

if (sHResult == null)
{

sHResult = "Not available";
}

var sErrMessage = "";
if (oXmlNode != null)
{
var oDescription = oXmlNode.selectSingleNode("error/description");
if (!IsNull(oDescription))
{
sErrMessage = oDescription.text;
}
}
openErrorDlg(sHResult, sErrMessage);
}

function AsyncResultHandler(oRemoteCommand, oXmlHttp, funCallback)
{

this.ReadyStateChanged = readyStateChanged;
function readyStateChanged()
{

if (oXmlHttp.readyState == 4)
{

if (oXmlHttp.status != 0)
{
var result = new RemoteCommandResult(oRemoteCommand, oXmlHttp);
funCallback(result);

oXmlHttp.abort();
}
}
}
}

function CommandParameter(sName, sValue)
{

this.Name = sName;
this.Value = sValue;

this.GetXml = getParameterXml;


function getParameterXml()
{
var sXml = "<" + CrmEncodeDecode.CrmXmlEncode(this.Name) + ">";
if (isArray(this.Value))
{
var sType = this.Value.type;
if (IsNull(sType) && this.Value.length > 0)
{
sType = "object";
}
for (var i = 0; i < this.Value.length; i++)
{
sXml += "<" + CrmEncodeDecode.CrmXmlEncode(sType) + ">" + this.Value[i] + "</" + CrmEncodeDecode.CrmXmlEncode(sType) + ">";
}
}
else
{
sXml += this.Value;
}
sXml += "</" + this.Name + ">";
return sXml;
}
}

function RemoteCommandResult(oRemoteCommand, oXmlHttp)
{
var sCommand = oRemoteCommand.Command;
var oXml = oXmlHttp.responseXML;
var sNamespace = "";
if (oXml.childNodes.length > 0)
{
sNamespace = oXml.childNodes[oXml.childNodes.length - 1].prefix + ":";
}

this.RemoteCommand = oRemoteCommand;
this.RawResponse = oXml;
this.Xml = oXml.selectSingleNode("/" + sNamespace + "Envelope/" + sNamespace + "Body/" + sCommand + "Response/" + sCommand + "Result");
this.ReturnValue = ReadXml(this.Xml);
this.Success = handleSoapResponse(oXmlHttp);
this.ConvertToObject = ReadXml;
function handleSoapResponse(oXmlHttp)
{
var sHResult = null;
var oXmlNode = null;
var oErrorNode;
var bSuccess = true;
var oXml = oXmlHttp.responseXML;
var sNamespace = "";
if (oXml.childNodes.length > 0)
{
sNamespace = oXml.childNodes[oXml.childNodes.length - 1].prefix + ":";
}

if (oXml.parseError.errorCode != 0)
{

sHResult = "XmlParseError";
bSuccess = false;
}

else if (oXmlHttp.status != 200)
{

oXmlNode = oXml.selectSingleNode("/" + sNamespace + "Envelope/" + sNamespace + "Body/" + sNamespace + "Fault");
if (oXmlNode)
{
oErrorNode = oXmlNode.selectSingleNode("error/code");
if (!IsNull(oErrorNode))
{
sHResult = oErrorNode.text;
}
else
{
oErrorNode = oXmlNode.selectSingleNode("detail/error/code");
if (!IsNull(oErrorNode))
{
sHResult = oErrorNode.text;
}
}
}
else
{

sHResult = "ServerError";
}
bSuccess = false;
}
if (bSuccess)
{

oXmlNode = oXml.selectSingleNode("/" + sNamespace + "Envelope/" + sNamespace + "Body/" + sCommand + "Response");
if (IsNull(oXmlNode))
{

sHResult = "SoapError";
bSuccess = false;
}
}

if (!bSuccess)
{

if (oRemoteCommand.ErrorHandler)
{
oRemoteCommand.ErrorHandler(sHResult, oXmlNode);
}
}
return bSuccess;
}


function ReadXml(oXml)
{
var oReturnValue = new Object();
if (IsNull(oXml))
{
return oReturnValue;
}
var childNodes = oXml.childNodes;
for (var i = 0; i < childNodes.length; i++)
{
var oChildNode = childNodes.item(i);
switch (oChildNode.nodeType)
{
case 1:
var oChildObject = ReadXml(oChildNode);
if (IsNull(oReturnValue[oChildNode.baseName]))
{
oReturnValue[oChildNode.baseName] = oChildObject;
}
else
{
if (!isArray(oReturnValue[oChildNode.baseName]))
{
var property = oReturnValue[oChildNode.baseName];
oReturnValue[oChildNode.baseName] = new Array();
oReturnValue[oChildNode.baseName].push(property);
}

oReturnValue[oChildNode.baseName].push(oChildObject);
}
break;
case 3:



return fromString(oChildNode.nodeValue);
case 4:
return oChildNode.text;
default:
break;
}
}

if (IsNull(oReturnValue.xmlAttributes))
{
var attributes = oXml.attributes;
if (attributes.length > 0)
{
oReturnValue.xmlAttributes = new Object();
for (var i = 0; i < attributes.length; i++)
{
oReturnValue.xmlAttributes[attributes.item(i).baseName] = fromString(attributes.item(i).nodeValue);
}
}
}
return oReturnValue;
}

function fromString(sValue)
{

if (sValue.toLowerCase() == "true")
{
return true;
}
else if (sValue.toLowerCase() == "false")
{
return false;
}

var intValue = parseInt(sValue, 10);
if (!isNaN(intValue) && intValue.toString() == sValue)
{

return intValue;
}

var floatValue = parseFloat(sValue);
if (!isNaN(floatValue) && floatValue.toString() == sValue)
{

return floatValue;
}

var dateValue = new Date(sValue);
if (!isNaN(dateValue))
{
return dateValue;
}

return sValue;
}
}
