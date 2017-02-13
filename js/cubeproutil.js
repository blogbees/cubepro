<!--
/* *****************************************************************************
*    COPYRIGHT, 2007. Cubicle Technologies
********************************************************************************
*
*             CONFIDENTIAL - Cubicle Technologies
*
* This is an unpublished work, which is a trade secret, created in 2007
* Cubicle Technologies owns all rights to this work and intends to maintain it in confidence
* to preserve its trade secret status. Cubicle Technologies reserves the right to protect
* this work as an unpublished copyrighted work in the event of an inadvertent or
* deliberate unauthorized publication. Cubicle Technologies also reserves its rights under the
* copyright laws to protect this work as a published work. Those having access
* to this work may not copy it, use it, or disclose the information contained
* in it without the written authorization of Cubicle Technologies.
*
********************************************************************************
* NAME: cubeproutil.js
* LOCATION: 
* BUSINESS OWNERS:  
* PRIMARY PROJECT CONTACT:  
* DEVELOPED BY: 
*
* DESCRIPTION: 
* NOTES:
* DEPENDENCIES: 
* CHANGE HISTORY:
* $Log:$
*
*/ 
var helpmode;
popupWins = new Array();

function Openpopupwin(url,h,w,scroll,name) {
if (h<500)
{
            var winl = (screen.width - w) / 2;
            var wint = (screen.height - h) / 2;
}
else
{
            var winl = (screen.width - w) / 2;
            var wint = 50;
}
args = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable';
if ( typeof( popupWins[name] ) != "object" ){
popupWins[name] = window.open(url,name,args);
} else {
if (!popupWins[name].closed){
popupWins[name].location.href = url;
} else {
popupWins[name] = window.open(url, name,args);
}
}
popupWins[name].focus();
}
//added by ramesh to skip the fields on reload if the fields have no values. 09_27_04
function autotab(original,emptyVal, nonEmptyVal){ 
              //alert(original.length);
              if (original.length== 0 ) {//undefined
                 //alert(emptyVal);
                emptyVal.focus(); 
               
              }else{
                 //alert(nonEmptyVal);
                nonEmptyVal.focus();
              }
}

function load_helpfile()
{
            var helppageload= helpmode  + ".htm";
            //alert(helppageload);
            Openpopupwin(helppageload,500,400,'yes','help');

}



function URLEncode(id ) {
	var SAFECHARS = "0123456789" +					// Numeric
					"ABCDEFGHIJKLMNOPQRSTUVWXYZ" +	// Alphabetic
					"abcdefghijklmnopqrstuvwxyz" +
					"-_.!~*'()";					// RFC2396 Mark characters
	var HEX = "0123456789ABCDEF";
	var plaintext = id;	
	var encoded = "";
	for (var i = 0; i < plaintext.length; i++ ) {
		var ch = plaintext.charAt(i);
	    if (ch == " ") {
		    encoded += "+";				// x-www-urlencoded, rather than %20
		} else if (SAFECHARS.indexOf(ch) != -1) {
		    encoded += ch;
		} else {
		    var charCode = ch.charCodeAt(0);
			if (charCode > 255) {
			    alert( "Unicode Character '" 
                        + ch 
                        + "' cannot be encoded using standard URL encoding.\n" +
				          "(URL encoding only supports 8-bit characters.)\n" +
						  "A space (+) will be substituted." );
				encoded += "+";
			} else {
				encoded += "%";
				encoded += HEX.charAt((charCode >> 4) & 0xF);
				encoded += HEX.charAt(charCode & 0xF);
			}
		}
	}
	return encoded;
};
 
function Timevalidationfocus(timeval,obj) 
{
	if (timeval.length=5) 
	{
		var newval,ch;
		newval="";
		ch =timeval.indexOf(":",0);
		if (ch>0)
		{
			if (ch=2)
			{
				newval=timeval.substring(0, 2) + timeval.substring(3,5);
				obj.value=newval;
				obj.select()	;
			}
			
		}
	}
}


function IsValidTime(timeval,timeobj) {

var newval,ch;
newval="";
ch = timeval.substring(0, 2);
if (ch!="")
{
ch=ch + ":";
}
newval =  ch  ; 
ch = timeval.substring(2, 4);
var timeStr = newval +  ch  ;
timeobj.value=timeStr;
var timePat = /^(\d{1,2}):(\d{2})(:(\d{2}))?(\s?(AM|am|PM|pm))?$/;

var matchArray = timeStr.match(timePat);
if (matchArray == null) 
{
	alert("Time is not in a valid format.");
	timeobj.select();
	return false;
}
	hour = matchArray[1];
	minute = matchArray[2];
	second = matchArray[4];
	ampm = matchArray[6];

if (second=="") { second = null; }
if (ampm=="") { ampm = null }

if (hour < 0  || hour > 24) 
{
	alert("Hour must be between 0 and 24");
	timeobj.select();
	return false;
}

if (minute<0 || minute > 59) {
	alert ("Minute must be between 0 and 59.");
	timeobj.select();
	return false;
}
if (second != null && (second < 0 || second > 59)) {
	alert ("Second must be between 0 and 59.");
	timeobj.select();
	return false;
}

	return false;
	
}

function ValidTime(timeval,timeobj) {

if (timeval.length>0)
	 {
		if ((timeval.indexOf(":") > 0) && (timeval.length==5))
		{
			var timePat = /^(\d{1,2}):(\d{2})(:(\d{2}))?(\s?(AM|am|PM|pm))?$/;
		}
		elseif ((timeval.indexOf(":") == 0) && (timeval.length==4))
		{
			var timePat = /^(\d{1,2})(\d{2})((\d{2}))?(\s?(AM|am|PM|pm))?$/;
		}	
var matchArray = timeval.match(timePat);
if (matchArray == null) 
{
	alert("Time is not in a valid format.");
	return false;
}
	hour = matchArray[1];
	minute = matchArray[2];
	second = matchArray[4];
	ampm = matchArray[6];

if (second=="") { second = null; }
if (ampm=="") { ampm = null }

if (hour < 0  || hour > 24) 
{
	alert("Hour must be between 0 and 24");
	timeobj.select();
	return false;
}

if (minute<0 || minute > 59) {
	alert ("Minute must be between 0 and 59.");
	timeobj.select();
	return false;
}
if (second != null && (second < 0 || second > 59)) {
	alert ("Second must be between 0 and 59.");
	timeobj.select();
	return false;
}

	return false;
	

}}

//added for bug 1536
function formatamount(obj,objval)
{
	if (objval.length>0)
	{
		if(!isNaN(objval.replace(',','')))
		{
			if (objval.length<9)
			{
				if(objval.length <= 7)
				{
					if (objval.indexOf(".") == -1 )
					{
						obj.value = objval + ".00";
					}
				}
				else if(objval.length == 8)
				{
					if (objval.indexOf(".") == -1 )
					{
						var first = objval.substring(0,objval.length-1);
						var second = objval.substring((objval.length-1));
						obj.value = first + "." + second + "0";
					}
				}
			}
			else if (objval.length==9)
			{
				if (objval.indexOf(".") == -1 )
				{
					var first = objval.substring(0,7);
					var second = objval.substring(7,9);
					obj.value = first + "." + second;	
				}
			}
		}
		else
		{
			alert("Enter only numeric value for Amount");
			obj.select();
		}
	}
}
// Added for bug 1536C#106
function checkNumeric(obj,objval, fieldDisplayName)
{
    var fieldName = fieldDisplayName;
    if(fieldName==null || fieldName =="")
    {
    	fieldName = obj.name;
    }
	if (!IsNumeric(objval)) 
   	{ 
	      alert('Please enter only numbers in ' + fieldName); 
	      obj.select();
	      return false; 
	}
	return true;
}
// To fix bug 2075 log issue
function IsNumeric(sText)
{
   var ValidChars = "0123456789";
   var IsNumber=true;
   var Char;
   for (i = 0; i < sText.length && IsNumber == true; i++) 
   { 
	  Char = sText.charAt(i); 
	  if (ValidChars.indexOf(Char) == -1) 
	  {
		 IsNumber = false;
	  }
   }
   return IsNumber;
 }

//Bugid=2070
//return true if null or not alpha only 
function isNullOrNotAlpha(objValue,fieldDisplayName)
{
	if(isNullorEmpty(objValue,fieldDisplayName)==false) return false;
	if(isAlphaOnly(objValue,fieldDisplayName)==false) return false; 
	return true;
}

// Check for Phone Number is Numeric
function isValidPhoneNumber(objValue,fieldDisplayName)
{
if(isNummeric(objValue,fieldDisplayName)==false) return false;
return true;
}

//return true if null or not nummeric
function isNullOrNotNumeric(objValue,fieldDisplayName)
{
	if(isNullorEmpty(objValue,fieldDisplayName)==false) return false;
	if(isNummeric(objValue,fieldDisplayName)==false) return false;
	return true;
} 

//return true if null or empty
function isNullorEmpty(objValue,fieldDisplayName)
{
    if(objValue == null) return false;
   
    var fieldName = fieldDisplayName; 
    if(fieldName==null || fieldName =="")
    {
    	fieldName = objValue.name;
    }
	var fieldValue = objValue.value.replace(/^\s+|\s+$/g,"");
	if(fieldValue.length <=0){
		  alert(fieldName + ":Please enter value");
		  objValue.value = fieldValue;
		  objValue.focus();
		  return false;
	 }  
	return true; 
}

//Check given object contains alpha latter
function isAlphaOnly(objValue,fieldDisplayName) {
    var fieldName = fieldDisplayName; 
    if(fieldName==null || fieldName =="")
    {
    	fieldName = objValue.name;
    }
	var strError;
	var charpos = objValue.value.search("[^A-Za-z -]");
	if (objValue.value.length > 0 && charpos >= 0) {
		if (!strError || strError.length == 0) {
			strError = fieldName + ": Only alphabetic characters allowed ";
		}
		alert(strError + "\n [Error character position " + eval(charpos + 1) + "]");
		objValue.focus();
		return false;
	}

} 

//Check given object contains apha latter
function isNummeric(objValue,fieldDisplayName) {
    var fieldName = fieldDisplayName; 
    if(fieldName==null || fieldName =="")
    {
    	fieldName = objValue.name;
    }
	var strError;
	var charpos = objValue.value.search("[^0-9]");
	if (objValue.value.length > 0 && charpos >= 0) {
		if (!strError || strError.length == 0) {
			strError = fieldName + ": Only digits allowed ";
		}
		alert(strError + "\n [Error character position " + eval(charpos + 1) + "]");
		objValue.focus();
		return false;
	}
	return true;
} 
//end bugid=2070-c3

//WO#38656 - To validate name having special characters
function validateName(obj,displayName){
// WO #45490 - Added special character ' to allow for names
	var regExp = /^[0-9A-Za-z-. ']+$/;
	return validateSpecialChars(obj,displayName,regExp);
}

//Check null and patient name validation
function validateNameWithNull(objValue,fieldDisplayName)
{
	if(isNullorEmpty(objValue,fieldDisplayName)==false) return false;
	if(validateName(objValue,fieldDisplayName)==false) return false;
	return true;
}
//End WO#36127

//Start bugid=1689
//Function to get elements from multiple obj
function getSelectedElements(multiSelectObj)
{
   var selectedItems = "";
   for(var i = 0; i < multiSelectObj.options.length;  i ++ )
   {
      if( multiSelectObj.options[i].selected )
      {
         // concatenate the selected  key value
         selectedItems +=  multiSelectObj.options[i].value + ",";
         
      }
   }
   // return the selected items
   return selectedItems.substring(0, selectedItems.length - 1);
} 

function getSelectedTextList(multiSelectObj)
{
   var selectedItems = "";
   for(var i = 0; i < multiSelectObj.options.length;  i ++ )
   {
      if( multiSelectObj.options[i].selected )
      {
         // concatenate the selected Text
         selectedItems += multiSelectObj.options[i].text + ",";
      }
   }
   // return the selected items
   return selectedItems.substring(0, selectedItems.length - 1);
} 

//Change the box value based on check box selection
function changeCheckBoxValue(checkBoxObj)
{
    if(checkBoxObj.checked==false)
    {
    	checkBoxObj.value="N";
	}else
	{
    	checkBoxObj.value="Y"
	}
}

//Function-to add a text into list
function addToList(listName,itemToList)
{
	var listElements = window.document.all(listName).innerText;
	var mySplitResult = listElements.toString().split(",");
	if(isElementExists(mySplitResult,itemToList)== false && itemToList.length > 0 )
	{
		var newJobCodeAddedList = itemToList;
		if(listElements.toString().length > 0)
		{
			newJobCodeAddedList = listElements.toString() + "," + itemToList;
		}
	    window.document.all(listName).innerText = newJobCodeAddedList;
	    if(listName=="billingClassCodeList")
	    {
	    	disableInsSearch(true);
	    	
	    }else if(listName=="insCodeList")
	    {
	       document.getElementById("billingClass").disabled = true;
	 	   document.forms[0].billingClassCode.disabled = true;
		   document.getElementById("billingSearchLink").href= "javascript:void(0)"; 	
	    }else if(listName=="jobCodeList")
	    {
	       var jobCodeList = window.document.all(listName).innerText;
		   var jobCodeListLength = jobCodeList.toString().split(",").length;
		    if(jobCodeListLength == 1)//clear job depedencies list, when loading first job code
		    {
 		    	clearJobDepedenciesList();
 		    }
	    }
	}
}

//Add text as commaSperator values-not allowing duplicate
function addTextCommaSeprator(existingValues,newText)
{
	var listElements  = existingValues;
	var mySplitResult = listElements.toString().split(",");
	if(isElementExists(mySplitResult,newText)== false && newText.length > 0 )
	{
		var newIdList = newText;
		if(listElements.toString().length > 0)
		{
			newIdList = listElements.toString() + "," + newText;
		}
		return newIdList;
	}
	return existingValues;
}

//Add text as commaSperator values into form object-not allowing duplicate
function addIds(IdObj,Id)
{
	var listElements  = IdObj.value;
	var mySplitResult = listElements.toString().split(",");
	if(isElementExists(mySplitResult,Id)== false && Id.length > 0 )
	{
		var newIdList = Id;
		if(listElements.toString().length > 0)
		{
			newIdList = listElements.toString() + "," + Id;
		}
		IdObj.value = newIdList;
	}
}

//Function to check if element already added in the list
function isElementExists(mySplitResult,element)
{
	for(i = 0; i < mySplitResult.length; i++)
	{
		 if(mySplitResult[i]==element)
		 {
            return true;
		 }
	}
	return false;	
}
//end bugid=1689 


// Bug 2146 - Start 
var esindex = -99;
function setEpisodeInitialStatus(selectbox)
{
  if (esindex == -99)
  {
     esindex = selectbox.selectedIndex;
  }
}

function validateEpisodeStatus(selectbox)
{
  var esvalue = selectbox.options[selectbox.selectedIndex].value;
  var estext = selectbox.options[selectbox.selectedIndex].text;
  if (esvalue == 'RI' || esvalue == 'RC' || esvalue == 'RE'
    || esvalue == 'MI' || esvalue == 'MC' || esvalue == 'ME')
  {
    alert(estext + ' is not valid option. Please select a valid option');
    selectbox.selectedIndex = esindex;
    return;
  }
}
//Bug 2146 - End 


//WO #29871 -[Method to trim the leading and trailing empty spaces]
function trim(s) 
{
	while (s.substring(0,1) == ' ') {
    	s = s.substring(1,s.length);
	}

	while (s.substring(s.length-1,s.length) == ' ') {
	    s = s.substring(0,s.length-1);
	}
	return s;
}

// Code to validate alpha numeric characters. Returns true if the input string is 
// alpha numeric , false otherwise
function isAlphaNumeric(inpString)
{
	var isAlphaNum = false;
	var pattern = /[^a-zA-Z0-9]/g;
	if (pattern.test(inpString)){
		isAlphaNum = false;
	} else {
		isAlphaNum = true;
	}
	return isAlphaNum;
}

//Bugid=1957-function to check duplicate in the array
function chkforDuplicates(array,element)
{
	var i;
	for (i=0; i < array.length; i++) 
	{
		if (array[i] == element) 
		{
			return true;
		}
	}
	return false;
}


var mandatoryFields = new Array();

function Field(id, name, dependencyFields)
{
	this.id = id;
	this.name = name;
	this.dependencyFields = dependencyFields;
}

function addMandatoryField(id, name, dependencyFields)
{
	mandatoryFields[mandatoryFields.length] = new Field(id, name, dependencyFields);
}

function validateForm(formObj, dependantRefField)
{
	var dependantRefFieldValue = dependantRefField.value;
	for (i in mandatoryFields){
		var field = formObj[mandatoryFields[i].id];
		if(field != null){
			var dependencyFields = mandatoryFields[i].dependencyFields;
			if(dependencyFields.length == 0){
				if(field.value == ''){
					alert("Please fill the "+mandatoryFields[i].name+" to continue");
					field.focus();
					return false;
				}
			}
			for (j in dependencyFields){
				if(dependantRefFieldValue == dependencyFields[j]){
					if(field.value == ''){
						alert("Please fill the "+mandatoryFields[i].name+" to continue");
						field.focus();
						return false;
					}
				}
			}
		}
	}
	return true;
}
// Search either job or batch code
function searchJobOrBatch(contextPath, jobOrBatchCode)
{
	var pageURL = contextPath + "/action/jobsearch?frompage=jobsearch&jobCode="+jobOrBatchCode;	
	pageURL = URLEncode(pageURL);
	var winSettings = "center:yes;resizable:no;dialogHeight:650px;dialogWidth:900px"
	return window.showModalDialog(contextPath + "/myframe.jsp?pageurl="+pageURL+"", new Array(), winSettings);
}

// Search for Job Code
function searchJob(contextPath, jobCode)
{
	var popurl = contextPath + "/action/editjobsearch?frompage=editjobs&EnterData=Searchdata&searchPage=editjob&jobCode="+jobCode;
	popurl = URLEncode(popurl);
	var winSettings = "center:yes;resizable:no;dialogHeight:650px;dialogWidth:900px";
	return window.showModalDialog(contextPath + "/myframe.jsp?pageurl="+popurl+"", new Array(), winSettings);
}

// Search for Job Code
function searchFullJob(contextPath, jobCode, searchPage)
{
	var popurl = contextPath + "/action/fulljobsearch?frompage=fulljobsearch&EnterData=Searchdata&jobCode="+jobCode+"&searchPage="+searchPage;
	popurl = URLEncode(popurl);
	var winSettings = "center:yes;resizable:no;dialogHeight:650px;dialogWidth:900px";
	return window.showModalDialog(contextPath + "/myframe.jsp?pageurl="+popurl+"", new Array(), winSettings);
}

//Search for Billing Class Code
function searchJobBilling(contextPath, jobCode, billingClassCode)
{
	var popurl = contextPath + "/action/fullJobBilling?EnterData=Searchdata&searchPage=JBC&frompage=jobsearchbilling&gbcCode="+billingClassCode+"&jobCode="+jobCode;
 	popurl = URLEncode(popurl);
	var winSettings = "center:yes;resizable:no;dialogHeight:650px;dialogWidth:900px";
	return window.showModalDialog(contextPath + "/myframe.jsp?pageurl="+popurl+"", new Array(), winSettings);
}

// Search for provider
function searchProvider(contextPath, jobCode, providerCode)
{
	var popurl = contextPath + "/action/editProvidersearch?frompage=editProvider&searchPage=editprovider&providerCode="+providerCode+"&jobCode="+jobCode;
	popurl = URLEncode(popurl);
	var winSettings = "center:yes;resizable:no;dialogHeight:650px;dialogWidth:900px";
	return window.showModalDialog(contextPath + "/myframe.jsp?pageurl="+popurl+"", new Array(), winSettings);
}

//Search for referring provider
function searchRefProvider(contextPath, jobId, refProviderCode, isMultiOption)
{
	var popurl = contextPath + "/action/refprovidersearch?frompage=refprovidersearch&procedurestatus=getRefProviders&provState=refprov"+
		"&jobId="+jobId+"&searchval="+refProviderCode+"&isMultiOption="+isMultiOption;
	popurl = URLEncode(popurl);
	var winSettings = "center:yes;resizable:no;dialogHeight:650px;dialogWidth:900px";
	return window.showModalDialog(contextPath + "/myframe.jsp?pageurl="+popurl+"", this, winSettings);
}

//This funtion is for mouse click event on batch_code
function editBatchScan(contextPath, batchId)
{
	var url = URLEncode(contextPath + "/action/batchEntryList?batchstatus=batchlist&editRequired=batch&fromPage=scan&batchId=" + batchId);
	var winSettings = "center:yes;resizable:no;dialogHeight:650px;dialogWidth:900px";
	var myArgs = window.showModalDialog(contextPath + "/myframe.jsp?pageurl=" + url + "", myArgs, winSettings);
}

function loadDcnImage(oiturl, documentNumber)
{
	var actualDCN;
	if (documentNumber != "" && documentNumber.length > 12) {
		actualDCN = documentNumber.substring(0, 12);
		showOIT(actualDCN, oiturl);		
	}
}

//WO #38229 - modified this method to include dcn & pageNumber parameters
function loadEobPage(contextPath, batchId, doe, invoiceId, dcn , pageNumber )
{
	var url = contextPath + "/action/EOBPaymentDetails?function=search&batchID=" + batchId + "&doe=" + doe;
	if(invoiceId!=null && invoiceId != ''){
		url = url + "&invoiceId=" + invoiceId;
	}
	if(dcn!=null && dcn!= ''){
		url = url + "&dcn=" + dcn;
	}
	
	if(pageNumber!=null && pageNumber!= ''){
		url = url + "&pageNumber=" + pageNumber;
	}
	document.location.href = url;
}

function loadNonEobPage(contextPath, batchId, doe, invoiceId)
{
	var url = contextPath + "/action/NonEOBPaymentDetailspop?batchIDHidden=" + batchId + "&doe=" + doe + "&mydate=" + doe;
	if(invoiceId!=null && invoiceId != ''){
		url = url + "&function=search&invoiceId=" + invoiceId;
	}
	document.location.href = url;
}

function load835Checks(contextPath, batchId, doe)
{
	var url = contextPath + "/action/X12N835ChecksinBatch?function=Load&batchId=" + batchId + "&doe=" + doe;
	document.location.href = url;
}

function loadSpecialAccount(contextPath, batchId, doe)
{
	var url = contextPath + "/action/posting?action=reset&fromPage=payBatch&payBatchId="+batchId+"&payBatchDoe="+doe;
	document.location.href = url;
}

function loadPaymentList(contextPath, batchId, doe)
{
	var url = contextPath + "/action/paymentList?action=searchPayments&fromPage=payBatch&payBatchId="+batchId+"&payBatchDoe="+doe;
	document.location.href = url;
}

function URLEncode(id) {
var SAFECHARS = "0123456789" +					// Numeric
				"ABCDEFGHIJKLMNOPQRSTUVWXYZ" +	// Alphabetic
				"abcdefghijklmnopqrstuvwxyz" +
				"-_.!~*'()";					// RFC2396 Mark characters
	var HEX = "0123456789ABCDEF";
	var plaintext = id;	
	var encoded = "";
	for (var i = 0; i < plaintext.length; i++ ) {
		var ch = plaintext.charAt(i);
		if (ch == " ") {
			encoded += "+";				// x-www-urlencoded, rather than %20
		} else if (SAFECHARS.indexOf(ch) != -1) {
			encoded += ch;
		} else {
			var charCode = ch.charCodeAt(0);
			if (charCode > 255) {
				alert("Unicode Character '" 
				+ ch 
				+ "' cannot be encoded using standard URL encoding.\n" +
			"(URL encoding only supports 8-bit characters.)\n" +
			"A space (+) will be substituted." );
			encoded += "+";
			} else {
			encoded += "%";
			encoded += HEX.charAt((charCode >> 4) & 0xF);
			encoded += HEX.charAt(charCode & 0xF);
			}
		}
	} // for
	return encoded;
}

// format a float to a dollar amount
function formatDollar(element) {
    var floater = element.value;
    
    if (floater.match(/^\d+\.*\d*$/) != null)
		element.value = parseFloat(floater).toFixed(2);
}

//WO#38656 - Validate special characters
function validateSpecialChars(obj,displayName,regExp){
	obj.value = trim(obj.value);
	if (obj.value.length > 0 && regExp.test(obj.value) == false){
		alert('Please remove Special Characters in ' + displayName); //WO-45903 overrides WO#45558
		obj.focus();
		return false;
	}
	return true;
}
//WO #40423 - Phone number toggle methods
// format phone numbers with "-" 
function formatPhone(obj, objValue) {
	if (objValue.length > 0) {
		if (isValidPhoneNumber(obj, "Phone Number") == true) {
			var first = objValue.substring(0, 3);
			var second = objValue.substring(3, objValue.length);
			obj.value = first + "-" + second;
			return true;
		} 
	}
	return false;
}
// remove "-" from phone number 
function removePhone(obj, objValue) {
	if (objValue.length > 0) {
		if (objValue.length <= 9) {
			var first = objValue.substring(0, objValue.indexOf("-"));
			var second = objValue.substring(objValue.indexOf("-") + 1);
			obj.value = first + second;
			return true;
		} else {
			obj.focus();
			obj.select();
			return false;
		}
	}
}
//This method returns true for alphanumeric and * for others it will return false
function isValideJobCodeSearchString(inpString)
{
	var isValide = false;
	var pattern = /[^a-zA-Z0-9\*]/g;
	if (pattern.test(inpString)){
		isValide = false;
	} else {
		isValide = true;
	}	
	return isValide;
}
// WO-49503 function to check if the insurance contract or group number contains a space
function doesInsuranceNumberContainSpace(obj, displayName, regExp)
{
	obj.value = trim(obj.value);
	if (regExp.test(obj.value) == true)
	{	// display confirmation box to either proceed or edit field
		var answer = confirm(displayName + ' contains a space. Would you like to proceed?');
		if (answer == false)
		{
			obj.focus();
			return false;
		}
	}
	return true;
}



