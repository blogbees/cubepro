function Datevalidateformatonfocus(dateval,obj){

	if (dateval.length>8){
		var newval,ch;
		newval="";
		ch = dateval.indexOf("/",0);
		if (ch>0){
			if (ch=2){
				newval=dateval.substring(0, 2) + dateval.substring(3,5);
				obj.value=newval;	
			}
			ch=dateval.indexOf("/",2);
		}
		if (ch>0){
			if (ch=6){
				newval=newval + dateval.substring(6, 10)
				obj.value=newval;
			}
		}	
	}
	try{
	obj.select(); // show as selected 
	}catch(e){}
}

function str2Date(dateval){
	var newval,ch;
	if(dateval.length == 8){
		newval="";
		ch = dateval.substring(0, 2);
		ch=ch + "/";
		newval =  ch  ; 
		ch = dateval.substring(2, 4);
		ch=ch + "/";
		newval = newval +  ch  ; 	
		newval=newval + dateval.substring(4, 8);	
	}else if(dateval.length == 10){
		newval = dateval;
	}
	return newval;
}

function Datevalidateformatonblur(dateval,obj){
	if (dateval.length>0){
		if (dateval.length<8){
			alert("Date should be 8 characters long, add 0 to single digit date or month");
			obj.focus();
			return false;		
		}
		var newval,ch;
		if(dateval.length == 10){
			newval = dateval;
		}
		else {
			newval="";
			ch = dateval.substring(0, 2);
			ch=ch + "/";
			newval =  ch  ; 
			ch = dateval.substring(2, 4);
			ch=ch + "/";
			newval = newval +  ch  ; 	
			newval=newval + dateval.substring(4, 8);
			obj.value = newval;
		}
    	if(verifyToDate(newval)){
			obj.value = newval;
			return true;
		}else{
			obj.focus();
			return false;
		}
	}
}

function Datevalidateformatonblur1(dateval,obj) 
{
	if (dateval.length>0){
		if (dateval.length<8){
			alert("Date should be 8 characters long, add 0 to single digit date or month");
			return false;
		}	
		var newval,ch;
		newval="";
		ch = dateval.substring(0, 2);
		ch = ch + "/";
		newval =  ch  ; 
		ch = dateval.substring(2, 4);
		ch = ch + "/";
		newval = newval +  ch  ; 	
		newval=newval + dateval.substring(4, 8);
    	if(verifyToDate(newval)){
			obj.value= newval;
			return true;
		}else{
			return false;
		}
	}
}

function DateDifference(Date1,Date2){  
    var diff;
    startDate = new Date(Date1);
    endDate = new Date(Date2);
    diff = (endDate - startDate)/(1000*60*60*24);    
    return diff; 
}

function DateValidation(InputDate){
    var tempDate,lenDate;
	  var dmonth,dyear,ddate,offset1,offset2;
	  var retStr;
	  retStr="";
	  lenDate=InputDate.length;
	  tempDate=InputDate;
     
    if(lenDate>=6 && lenDate<=10){
	    offset1 = tempDate.indexOf("/");
		  if (offset1>2 || offset1 < 1){	
		  }else{
		    ddate=tempDate.substring(0,(offset1));
        if (ddate.indexOf("0")== 0){
					ddate = ddate.substring(1,2);
		    }	
	    } 

      offset2 = tempDate.lastIndexOf("/",lenDate);                      /* Get the last occurenece of "/" */
        dmonth=tempDate.substring((offset1)+1,(offset2));
				if (dmonth.indexOf("0")== 0){
					dmonth = ddate.substring(1,2);
	
		    dyear= tempDate.substring((offset2)+1,lenDate);
	    }
	  }else{
	   alert("Enter date ");            
	   return false;
	  }

	  var lenYear = new String(dyear.toString());

	 ddate  =  parseInt(ddate);                                 /* parseInt determines if a value is a number */
	 dmonth =  parseInt(dmonth);
	 dyear  =  parseInt(dyear);
	
	 var month = true;

	 if(dyear < 3000 && dyear > 1899){
		if (dmonth<10){
			var ddmonth = "0";
			dmonth = ddmonth + dmonth;
			month  = false;
    }
    if(month==true){                        
	    if(dmonth>12){
	      alert("Enter valid month")   /*Enter valid month*/
				return false;
	    }else{
				if(ddate<1 || ddate>31){
					alert("Invalid date")    /*Invalid date*/
					return false;
				}
			}	  
		}	
		if((month==false)){
			if((dmonth=="04")||(dmonth=="06")||(dmonth=="09")||(dmonth==11))
			{
				if(ddate<1 || ddate>30)
				{
					alert("Invalid date")          /*Invalid date for 30 days month */
					return false;
				}
			}
			if((dmonth=="01")||(dmonth=="03")||(dmonth=="05")||(dmonth=="07")||(dmonth=="08"))
			{
				if(ddate<1 || ddate>31)
				{
					alert("Invalid date")           /*Invalid date  for 31 days month*/
					return false;
				}
			}
		}else{
	  if(dmonth==11)
	  {        
	    if(ddate<1 || ddate>30)
			{
				alert("Invalid date")/*Invalid date*/
				return false;
			}
			}                
    }
  }  /* year between 1930 & 3000 */
  else{   
    alert("Date should lie between 01/01/1900 and 12/31/2999")       /*Date should be between 01/01/1930 and 12/31/2999*/
    return false;
  }
  var lyyyy= dyear%4;
  if(lyyyy==0){
   if(dmonth=="02"){
    if(ddate<1 || ddate>29){
			alert("Invalid date")     /*Invalid date  for Feb leap year*/
			return false;
		}
   }
  }else{
    if(dmonth=="02"){
			if(ddate<1 || ddate>28){
				alert("Invalid date")   /*Invalid date  for non leap year */
				return false;
			}
    }
  } 
	return true;
} /* end of DateValidation */


function verifyFromDate(InpFromDate){
	var toDay = new Date();
	var strToDay;
	var tempFromDate;
	tempFromDate = InpFromDate;
	strToDay = (toDay.getMonth()+1) + "/" + toDay.getDate() + "/" + toDay.getYear();
	if(tempFromDate == ''){
		alert('From Date cannot be blank.');
		return false;
	}
	if(!DateValidation(tempFromDate)){
		 return false;
	}
	return true;  /* FromDate */
}
			
function verifyToDate(InpToDate){
	//alert(InpToDate);
	var toDay = new Date();
	var strToDay;
	var tempToDate;
	tempToDate = InpToDate;
	strToDay = (toDay.getDate()+1) + "/" + toDay.getMonth() + "/" + toDay.getYear();
	if(tempToDate == ''){
		alert('To Date cannot be blank.');
		return false;
	}
	if(!DateValidation(tempToDate)){
		return false;
	}
	return true;  /* ToDate */
}

    
    
    
