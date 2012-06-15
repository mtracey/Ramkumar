





function _crmUrlDecode(s)
{
if(IsNull(s)){return s;}else{if(typeof(s) != "string"){s = s.toString();}}



s = s.replace(/%u[a-fA-F0-9]{4}/g, function ($1){return String.fromCharCode(parseInt($1.substr(2, $1.length-2), 16));});

return decodeURIComponent(s);
}

function _crmUrlEncode(s)
{
if(IsNull(s)){return s;}else{if(typeof(s) != "string"){s = s.toString();}}

s = _UrlEncode(s);









s = s.replace(/%u[dD][89aAbB][a-fA-F0-9]{2}%u[dD][cCdDeEfF][a-fA-F0-9]{2}/g, function ($1){
return encodeURIComponent(String.fromCharCode(parseInt($1.substring(2, 6), 16)) + String.fromCharCode(parseInt($1.substring(8), 16)));
});


s = s.replace(/%u[a-fA-F0-9]{4}/g, function ($1){return encodeURIComponent(String.fromCharCode(parseInt($1.substr(2, $1.length-2), 16)));});

return s;
}


function _crmNameValueEncode(s)
{
if(IsNull(s)){return s;}else{if(typeof(s) != "string"){s = s.toString();}}


return CrmEncodeDecode.CrmUrlEncode(s);
}


function _crmNameValueDecode(s)
{
if(IsNull(s)){return s;}else{if(typeof(s) != "string"){s = s.toString();}}

return CrmEncodeDecode.CrmUrlDecode(s);
}




function _crmXmlDecode(s, charToDecode)
{
if(IsNull(s)){return s;}else{if(typeof(s) != "string"){s = s.toString();}}

if(typeof(charToDecode) != "undefined" && charToDecode != null)
{

if(charToDecode.length > 1) charToDecode = charToDecode.charAt(0);
var sEncodedChar = _XmlEncode(charToDecode);
var rex = new RegExp(sEncodedChar, "g");
s = s.replace(rex, charToDecode);


switch(charToDecode)
{
case "<":
s = s.replace(/&lt;/g, "<");
break;
case ">":
s = s.replace(/&gt;/g, ">");
break;
case "&":
s = s.replace(/&amp;/g, "&");
break;
case "\"":
s = s.replace(/&quot;/g, "\"");
break;
case "'":
s = s.replace(/&apos;/g, "'");
break;
}
return s;
}



s = s.replace(/&lt;/g, "<");
s = s.replace(/&gt;/g, ">");
s = s.replace(/&apos;/g, "'");
s = s.replace(/&quot;/g, "\"");
s = s.replace(/&amp;/g, "&");



s = s.replace(/&#[0-9]+;/g, function ($1){return String.fromCharCode($1.substr(2, $1.length-3));});


s = s.replace(/&#x[a-fA-F0-9]+;/g, function ($1){
var charCode = parseInt($1.substr(3, $1.length-4), 16);
if (charCode >= 0x10000 && charCode <= 0x10FFFF) {
var hi = Math.floor((charCode - 0x10000) / 0x400) + 0xD800;
var lo = ((charCode - 0x10000) % 0x400) + 0xDC00;
return String.fromCharCode(hi) + String.fromCharCode(lo);
}
else
{
return String.fromCharCode(charCode);
}
});

return s;
}



function _crmXmlEncode(s, charToEncode)
{
if(IsNull(s)){return s;}else{if(typeof(s) != "string"){s = s.toString();}}
if(typeof(charToEncode) != "undefined" && charToEncode != null)
{

if(charToEncode.length > 1) charToEncode = charToEncode.charAt(0);
var sEncodedChar = _XmlEncode(charToEncode);
var rex = new RegExp(charToEncode, "g");
return s.replace(rex, sEncodedChar);
}

return _surrogateAmpersandWorkaround(s, _XmlEncode);
}

function _crmHtmlEncode(s)
{
if(IsNull(s)){return s;}else{if(typeof(s) != "string"){s = s.toString();}}
return _surrogateAmpersandWorkaround(s, _HtmlEncode);
}

function _crmHtmlEncodeForFormatString(s)
{
if(IsNull(s)){return s;}else{if(typeof(s) != "string"){s = s.toString();}}
s = _surrogateAmpersandWorkaround(s, _HtmlEncode);
return s.replace(/&#123;/g, "{").replace(/&#125;/g, "}");
}

function _crmHtmlAttributeEncode(s)
{
if(IsNull(s)){return s;}else{if(typeof(s) != "string"){s = s.toString();}}

return _surrogateAmpersandWorkaround(s, _HtmlAttributeEncode);
}

function _crmXmlAttributeEncode(s)
{
if(IsNull(s)){return s;}else{if(typeof(s) != "string"){s = s.toString();}}

return _surrogateAmpersandWorkaround(s, _XmlAttributeEncode);
}

function _crmJavaScriptEncode(s)
{
if(IsNull(s)){return s;}else{if(typeof(s) != "string"){s = s.toString();}}
return _JavaScriptEncode(s);
}

function _crmVisualBasicScriptEncode(s)
{
if(IsNull(s)){return s;}else{if(typeof(s) != "string"){s = s.toString();}}
return _VisualBasicScriptEncode(s);
}







function _surrogateAmpersandWorkaround(s, encodingFunction)
{

s = s.replace(/([\uD800-\uDBFF][\uDC00-\uDFFF])/g, function ($1){return "CRMEntityReferenceOpen" + ((($1.charCodeAt(0) - 0xD800) * 0x400) + ($1.charCodeAt(1) & 0x03FF) + 0x10000).toString(16) + "CRMEntityReferenceClose";});



s = s.replace(/[\uD800-\uDFFF]/g, '\uFFFD');


s = encodingFunction(s);

s = s.replace(/CRMEntityReferenceOpen/g, "&#x");
s = s.replace(/CRMEntityReferenceClose/g, ";");
return s;
}

function CrmEncodeDecodeLibrary()
{

this.CrmHtmlEncode = _crmHtmlEncode;
this.CrmHtmlAttributeEncode = _crmHtmlAttributeEncode;
this.CrmXmlEncode = _crmXmlEncode;
this.CrmXmlAttributeEncode = _crmXmlAttributeEncode;
this.CrmJavaScriptEncode = _crmJavaScriptEncode;
this.CrmVisualBasicScriptEncode = _crmVisualBasicScriptEncode;
this.CrmUrlEncode = _crmUrlEncode;
this.CrmNameValueEncode = _crmNameValueEncode;
this.CrmHtmlEncodeForFormatString = _crmHtmlEncodeForFormatString;


this.CrmXmlDecode = _crmXmlDecode;

this.CrmHtmlDecode = _crmXmlDecode;
this.CrmUrlDecode = _crmUrlDecode;
this.CrmNameValueDecode = _crmNameValueDecode;
}

var CrmEncodeDecode = new CrmEncodeDecodeLibrary();






























function _HtmlEncode( strInput )
{
var c;
var HtmlEncode = '';

if(strInput == null)
{
return null;
}
if (strInput == '')
{
return '';
}

for(var cnt = 0; cnt < strInput.length; cnt++)
{
c = strInput.charCodeAt(cnt);

if (( ( c > 96 ) && ( c < 123 ) ) ||
( ( c > 64 ) && ( c < 91 ) ) ||
( c == 32 ) ||
( ( c > 47 ) && ( c < 58 ) ) ||
( c == 46 ) ||
( c == 44 ) ||
( c == 45 ) ||
( c == 95 ))
{
HtmlEncode = HtmlEncode + String.fromCharCode(c);
}
else
{
HtmlEncode = HtmlEncode + '&#' + c + ';';
}
}

return HtmlEncode;
}

function _HtmlAttributeEncode( strInput )
{
var c;
var HtmlAttributeEncode = '';

if(strInput == null)
{
return null;
}
if (strInput == '')
{
return '';
}

for(var cnt = 0; cnt < strInput.length; cnt++)
{
c = strInput.charCodeAt(cnt);

if (( ( c > 96 ) && ( c < 123 ) ) ||
( ( c > 64 ) && ( c < 91 ) ) ||
( ( c > 47 ) && ( c < 58 ) ) ||
( c == 46 ) ||
( c == 44 ) ||
( c == 45 ) ||
( c == 95 ))
{
HtmlAttributeEncode = HtmlAttributeEncode + String.fromCharCode(c);
}
else
{
HtmlAttributeEncode = HtmlAttributeEncode + '&#' + c + ';';
}
}

return HtmlAttributeEncode;
}

function _XmlEncode( strInput )
{

return _HtmlEncode( strInput );
}

function _XmlAttributeEncode( strInput )
{

return _HtmlAttributeEncode( strInput );
}

function _JavaScriptEncode( strInput )
{
var c;
var EncodeJs = '';

if(strInput == null)
{
return null;
}
if (strInput == '')
{
return '';
}

for(var cnt = 0; cnt < strInput.length; cnt++)
{
c = strInput.charCodeAt(cnt);

if (( ( c > 96 ) && ( c < 123 ) ) ||
( ( c > 64 ) && ( c < 91 ) ) ||
( c == 32 ) ||
( ( c > 47 ) && ( c < 58 ) ) ||
( c == 46 ) ||
( c == 44 ) ||
( c == 45 ) ||
( c == 95 ))
{
EncodeJs = EncodeJs + String.fromCharCode(c);
}
else if ( c > 127 )
{
EncodeJs = EncodeJs + '\\u' + OutputEncoder_TwoByteHex(c);
}
else
{
EncodeJs = EncodeJs + '\\x' + OutputEncoder_SingleByteHex(c);
}
}

return '\'' + EncodeJs + '\'';
}

function _VisualBasicScriptEncode( strInput )
{
var c;
var EncodeVbs = '';
var bInQuotes = false;

if(strInput == null)
{
return null;
}
if (strInput == '')
{
return '';
}

for(var cnt = 0; cnt < strInput.length; cnt++)
{
c = strInput.charCodeAt(cnt);

if (( ( c > 96 ) && ( c < 123 ) ) ||
( ( c > 64 ) && ( c < 91 ) ) ||
( c == 32 ) ||
( ( c > 47 ) && ( c < 58 ) ) ||
( c == 46 ) ||
( c == 44 ) ||
( c == 45 ) ||
( c == 95 ))
{

if ( !bInQuotes )
{
EncodeVbs = EncodeVbs + '&\"';
bInQuotes = true;
}

EncodeVbs = EncodeVbs + String.fromCharCode(c);
}
else
{

if ( bInQuotes )
{
EncodeVbs = EncodeVbs + '\"';
bInQuotes = false;
}

EncodeVbs = EncodeVbs + '&chrw(' + c + ')';
}
}

if ( EncodeVbs.charAt(0) == '&' )
{

EncodeVbs = EncodeVbs.substring(1);
}

if ( EncodeVbs.length == 0 )
{

EncodeVbs = '\"\"';
}

if ( bInQuotes )
{

EncodeVbs = EncodeVbs + '\"';
}

return EncodeVbs;
}


function _UrlEncode( strInput )
{
var c;
var EncodeUrl = '';

if(strInput == null)
{
return null;
}
if (strInput == '')
{
return '';
}

for(var cnt = 0; cnt < strInput.length; cnt++)
{
c = strInput.charCodeAt(cnt);

if (( ( c > 96 ) && ( c < 123 ) ) ||
( ( c > 64 ) && ( c < 91 ) )  ||
( ( c > 47 ) && ( c < 58 ) ) ||
( c == 46 ) ||
( c == 45 ) ||
( c == 95 ))
{
EncodeUrl = EncodeUrl + String.fromCharCode(c);
}
else if ( c > 127 )
{
EncodeUrl = EncodeUrl + '%u' + OutputEncoder_TwoByteHex(c);
}
else
{
EncodeUrl = EncodeUrl + '%' + OutputEncoder_SingleByteHex(c);
}
}

return EncodeUrl;
}

function OutputEncoder_SingleByteHex( charC )
{
if (charC == null)
{
return '';
}

var SingleByteHex = charC.toString(16);

for ( var cnt = SingleByteHex.length; cnt < 2; cnt++ )
{
SingleByteHex = "0" + SingleByteHex;
}

return SingleByteHex;
}

function OutputEncoder_TwoByteHex( charC )
{
if (charC == null)
{
return '';
}

var TwoByteHex = charC.toString(16);

for( var cnt = TwoByteHex.length; cnt < 4; cnt++ )
{
TwoByteHex = "0" + TwoByteHex;
}

return TwoByteHex;
}


function AntiXss()
{
this.HtmlEncode=_HtmlEncode;
this.HtmlAttributeEncode = _HtmlAttributeEncode;
this.XmlEncode = _XmlEncode;
this.XmlAttributeEncode = _XmlAttributeEncode;
this.JavaScriptEncode = _JavaScriptEncode;
this.VisualBasicScriptEncode = _VisualBasicScriptEncode;
this.UrlEncode = _UrlEncode;
}
var AntiXssLibrary = new AntiXss();


//////////////////////////////////////////////////////////////////////////////////////////////////