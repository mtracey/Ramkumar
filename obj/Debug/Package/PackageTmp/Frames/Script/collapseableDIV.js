//collapseable div script
//***********************
//** Matthew M. Osborn **
//**  www.osbornm.com  **
//***********************


//Configuration section
//********************************************************
var ExpandImageSrc = '../Frames/Images/Other/expand.gif'; //image location to display when Div is collapsed
var CollapseImageSrc = '../Frames/Images/Other/collapse.gif'; //image location to display when Div is Expanded
var speed = 100; //how often the div refreshes to the new height
var incriment = 5; //each time hte div refreshes height will be increased or deceased by this amount
//********************************************************

//Code
//********************************************************
var iTimer;
var calcHeight;
function toggleDiv(divToShow, imgID){    
	var help = document.getElementById(divToShow);
	if(help.style.display != "block") {
		if(imgID){
			document.getElementById(imgID).setAttribute('src',CollapseImageSrc);
		}
		showDiv(divToShow);
		Expand(divToShow);
	}
	else {
		if(imgID){
			document.getElementById(imgID).setAttribute('src',ExpandImageSrc);
		}
		collapse(divToShow);
	}
}
function Expand(divName) {
	var help = document.getElementById(divName);		
	var height = help.offsetHeight;
	if(height < calcHeight){
		help.style.height = height + incriment + "px";
		iTimer = setTimeout( "Expand('" + divName +"')" , speed);
	}
	else{
		clearTimeout(iTimer);
	}	
}		
function collapse(divName) {
	var help = document.getElementById(divName);		
	var height = help.offsetHeight;
	if(height > incriment){
		help.style.height = height - incriment + "px";
		iTimer = setTimeout( "collapse('" + divName +"')" , speed);
	}
	else{
		clearTimeout(iTimer);
		help.style.height ="100%";
		help.style.display = "none";
	}	
}		
function showDiv(divName){
	var div = document.getElementById(divName);
	div.style.display = "block";
	calcHeight = div.offsetHeight;
	div.style.height = "0px";
}
//*******************************************************