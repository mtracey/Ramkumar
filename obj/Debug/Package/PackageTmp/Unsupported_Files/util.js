function Trim(s)
{

s = s.replace(/^\s+|\s+$/g, '');


var chars = String.fromCharCode(0x0085, 0x00A0, 0x2028, 0x2029, 0x1680, 0x180E, 0x2000, 0x2001, 0x2002, 0x2003, 0x2004, 0x2005, 0x2006, 0x2007, 0x2008, 0x2009, 0x200A, 0x202F, 0x205F, 0x3000);
for (var i = 0; i < chars.length; i++)
{
var iChar = chars.charCodeAt(i);
var sChar = "";
if (iChar < 0x100)
{
sChar += "00";
}
else if (iChar < 0x1000)
{
sChar += "0";
}

sChar += iChar.toString(16);

s = s.replace(new RegExp("^\\u" + sChar + "+|\\u" + sChar + "+$", "g"), '');
}

return s;
}

function TrimSpaces(s)
{
if (s != null)
{

s = Trim(s);



return s.replace(/\s+/g,' ');
}

return null;
}

function ConvertUserTypeToLike(searchValue)
{
var s = "";
var sChar = "";
var iLength = searchValue.length;

for (var i = 0; i < iLength; i++)
{
sChar = searchValue.charAt(i);
switch (sChar)
{
case "%":	s += "[%]";	break;
case "_":	s += "[_]";	break;
case "[":	s += "[[]";	break;
case "*":	s += "%";	break;
default:	s += sChar;	break;
}
}

return s;
}

function GetNodeValue(input, searchName, bNoDecode)
{
if (!input || !searchName)
{
return "";
}

var rootStart = input.indexOf('<' + searchName + '>');

if (rootStart == -1)
{

rootStart = input.indexOf('<' + searchName + ' ');

if (rootStart == -1)
{
return "";
}
}

var startIndex	= input.indexOf(">", rootStart) + 1;
var endIndex = input.indexOf("</" + searchName + '>', startIndex);


if (endIndex == -1)
{
return "";
}
else
{
return bNoDecode ? input.substring(startIndex, endIndex) :
CrmEncodeDecode.CrmXmlDecode(input.substring(startIndex, endIndex));
}
}













function SetQueryString(url, name, val)
{
var newString = (IsNull(val) || val.toString()=="") ? "" : (name + "=" + CrmEncodeDecode.CrmUrlEncode(val));
var hasNewString = (newString!="");
var hashMarkExpression = /\#/;
var hashMarkIndex = url.search(hashMarkExpression);
if(hashMarkIndex != -1)
{
url = url.substring(0, hashMarkIndex);
}
var questionMarkExpression = /\?/;
var questionMarkIndex = url.search(questionMarkExpression);

if (questionMarkIndex == -1)
{
if(hasNewString)
{
return url + "?" + newString;
}
else
{
return url;
}
}

var qs = url.substring(questionMarkIndex+1, url.length);
var regEx = new RegExp("(^|&)" + name +"=[^&]*", "ig");

var isExistingName = (qs.search(regEx) != -1);

if(!isExistingName && hasNewString)
{
return url + "&" + newString;
}


var path = url.substring(0, questionMarkIndex);
qs = qs.replace(regEx, "");

if (qs.length > 0 && hasNewString)
{
qs += "&";
}
qs += newString;

if (qs.length > 0)
{
if (qs.charAt(0) == '&')
{
qs = qs.substring(1, qs.length);
}
qs = "?" + qs;
}

return path + qs;
}

function GetQueryString(url, name)
{

var regEx = new RegExp("[?|&]" + name + "=([^&|$]*)", "ig");

if(regEx.exec(CrmEncodeDecode.CrmUrlDecode(url)) != null)
{
return RegExp.$1;
}
return null;
}



function GetCachedSetting(settingName, defaultValue)
{
if (window.top.oSettingsCache != null)
{
var stateValue = window.top.oSettingsCache[settingName];
if (stateValue != null)
{
return stateValue;
}
}
return defaultValue;
}

function SetCachedSetting(settingName, stateValue)
{
if (window.top.oSettingsCache == null)
{
window.top.oSettingsCache = new Object();
}
window.top.oSettingsCache[settingName] = stateValue;
}



function ScrollVerticalList (oContainer, oSelected, iSelectedIndex, iNumItems, bAlignToTop)
{


if ((oContainer.scrollTop > iSelectedIndex / iNumItems * oContainer.scrollHeight)
|| (oContainer.scrollTop + oContainer.clientHeight < (iSelectedIndex + 1) / iNumItems * oContainer.scrollHeight))
{
oSelected.scrollIntoView (bAlignToTop)
}
}


function getNumDigits(iVal)
{
if(isNaN(iVal))
{
return -1;
}
if(iVal == null)
{
return 0;
}
var tempVal = iVal;
var countDigits = 0;
while(tempVal!=0)
{
tempVal = tempVal/10;
tempVal = parseInt(tempVal, 10);
countDigits++;
}
return countDigits;
}


function CheckForDuplicates(iEventType, sRedirectUrl)
{
var dataXml = "";
var success = crmForm.BuildXml(false, false, true);

var xml = window.document.all["crmFormSubmitXml"];
dataXml = xml.value;

var url = prependOrgName("/Tools/DuplicateDetection/ViewDuplicates/ViewDuplicates.aspx?source=1");

var oid = window.document.all["crmFormSubmitId"];


if(oid && oid.value && oid.value != "")
{
url = url + "&oid=" + CrmEncodeDecode.CrmUrlEncode(oid.value);
}



var dataXmlObj = new Object();
dataXmlObj.xml = dataXml;

var returnValue = openStdDlg(url, dataXmlObj, 560, 560, false, false);
if(returnValue && returnValue != "")
{
crmForm.detachCloseAlert();

if(iEventType == 2)
{
var oType = window.document.all["crmFormSubmitObjectType"].value;

try
{
window.opener.auto(oType);
}
catch(e)
{}
window.close();
}

else if(iEventType == 1)
{
var sLocation = location.href;
var separator = ( sLocation.indexOf("?") != -1 ) ? "&" : "?";


var poundIndex = -1;
if((poundIndex = sLocation.indexOf("#")) != -1)
{
sLocation = sLocation.substr(0, poundIndex);
}


if(sLocation.indexOf("?id=") == -1 && sLocation.indexOf("&id=") == -1)
{
sLocation = sLocation + separator + "id=" + returnValue;


separator = "&";
}


if(sLocation.indexOf("?refreshgrid=") == -1 && sLocation.indexOf("&refreshgrid=") == -1)
{
sLocation = sLocation + separator + "refreshgrid=1";
}

window.location.href= sLocation;
}

else if(iEventType == 59)
{
window.location.href = sRedirectUrl;
}
}
}

function customErrorHandler(ex, iEventType, sUrl)
{

if(ex == "0x80040333")
{
CheckForDuplicates(iEventType, sUrl);
return true;
}


return false;
}

function GenerateAuthenticationHeader()
{
var xml = new StringBuilder();

xml.Append("<soap:Header><CrmAuthenticationToken xmlns=\"");
xml.Append(CrmEncodeDecode.CrmXmlEncode(CRM2007_WEBSERVICE_NS));
xml.Append("\"><AuthenticationType xmlns=\"");
xml.Append(CrmEncodeDecode.CrmXmlEncode(CRM2007_CORETYPES_NS));
xml.Append("\">");
xml.Append(CrmEncodeDecode.CrmXmlEncode(AUTHENTICATION_TYPE));
xml.Append("</AuthenticationType><CrmTicket xmlns=\"");
xml.Append(CrmEncodeDecode.CrmXmlEncode(CRM2007_CORETYPES_NS));
xml.Append("\"></CrmTicket><OrganizationName xmlns=\"");
xml.Append(CrmEncodeDecode.CrmXmlEncode(CRM2007_CORETYPES_NS));
xml.Append("\">");
xml.Append(CrmEncodeDecode.CrmXmlEncode(ORG_UNIQUE_NAME));
xml.Append("</OrganizationName><CallerId xmlns=\"");
xml.Append(CrmEncodeDecode.CrmXmlEncode(CRM2007_CORETYPES_NS));
xml.Append("\">00000000-0000-0000-0000-000000000000</CallerId></CrmAuthenticationToken></soap:Header>");

return xml.ToString();
}

function escapeSingleQuotesAndBackSlashes(s)
{
s = s.replace(/\\/g, "\\\\");
return s.replace(/'/g, "\\'");
}
