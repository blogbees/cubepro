
var BROWSER_TYPE_IE_PRE_6 = 0;
var BROWSER_TYPE_IE = 1;
var BROWSER_TYPE_FF = 2;
var BROWSER_TYPE_OPERA = 3;
var BROWSER_TYPE_SAFARI = 4;
var ELEMENT_NODE_TYPE = 1;
var ATTRIBUTE_NODE_TYPE = 2;
var TEXT_NODE_TYPE = 3;
var CDATA_SECTION_NODE_TYPE = 4;
var DOCUMENT_NODE_TYPE = 9;
var BACKSPACE_KEYCODE = 8;
var TAB_KEYCODE = 9;
var ENTER_KEYCODE = 13;
var ESCAPE_KEYCODE = 27;
var LEFT_ARROW_KEYCODE = 37;
var RIGHT_ARROW_KEYCODE = 39;
var UP_ARROW_KEYCODE = 38;
var DOWN_ARROW_KEYCODE = 40;
var DELETE_KEYCODE = 46;
var SEMICOLON_KEYCODE = 186;
var ME_BACKGROUND_LOADING_DELAY = 5000;
var ME_BACKGROUND_LOADING_INTERVAL = 5000;
var ME_CLIENT_PAGE_LOAD_THROTTLE_FACTOR = 100;
var ME_STARTUP_PAGE_DELAY = 100;
var ME_MARK_AS_READ_DELAY = 3000;
var DOMToString_NodeIndent = "    ";
var gSafariScrollCachePos = 0;
var gSafariScrollHeightCache = 0;
var mTopAppWindow = null;
var dayTokens = new Array("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat");
var monthTokens = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
var arrDaysInMonths = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
var ONE_HOUR_MS = (1000 * 60 * 60);
var ONE_DAY_MS = (1000 * 60 * 60 * 24);
var ONE_WEEK_MS = (1000 * 60 * 60 * 24 * 7);
var DOW_SUN = 0;
var DOW_MON = 1;
var DOW_TUE = 2;
var DOW_WED = 3;
var DOW_THU = 4;
var DOW_FRI = 5;
var DOW_SAT = 6;
var DOW_WEEKEND_DAY = 7;
var DOW_WEEKDAY = 8;
var DAYS_IN_WEEK = 7;
var DOW_MASK_WEEKDAY = 62;
var DOW_MASK_WEEKEND = 65;
var DOW_MASK_ANYDAY = 127;
var gAllowPageActions = true;
function SkinImage(A) {
	if (SkinRoot && (SkinRoot.length > 0)) {
		return SkinRoot + A;
	} else {
		return "";
	}
}
function addZero(A) {
	return ((A < 10) ? "0" : "") + A;
}
function disableSelection(A) {
	if (typeof (A.onselectstart) != "undefined") {
		A.onselectstart = function () {
			return false;
		};
	} else {
		if (typeof (A.style) != "undefined") {
			if (typeof (A.style.MozUserSelect) != "undefined") {
				A.style.MozUserSelect = "none";
			}
		}
	}
	setElementCursorStyle(A, "default");
}
function enableSelection(A) {
	if (typeof (A.onselectstart) != "undefined") {
		A.onselectstart = function () {
			return true;
		};
	} else {
		if (typeof (A.style) != "undefined") {
			if (typeof (A.style.MozUserSelect) != "undefined") {
				A.style.MozUserSelect = "text";
			}
		}
	}
	setElementCursorStyle(A, "default");
}
function permitTextSelection(E) {
	if (GetBrowserType() == BROWSER_TYPE_SAFARI || GetBrowserType() == BROWSER_TYPE_FF) {
		return true;
	}
	try {
		var G = E.tagName.search(/input/i) != -1;
		var B = E.type != undefined;
		var F = B && E.type.search(/text/i) != -1;
		var I = E.tagName.search(/textarea/i) != -1;
		var D = I || (G && B && F);
		var A = document.getElementById("PanelPreview");
		var H = IsElementAAncestorOfElementB(A, E);
		return D || H;
	}
	catch (C) {
		return false;
	}
}
document.onselectstart = function (B) {
	B = B || window.event;
	var A = B.target || B.srcElement;
	return permitTextSelection(A);
};
function formatDate(J, O) {
	if (!J || J == null) {
		return "";
	}
	var Q = addZero(J.getDate());
	var H = addZero(J.getMonth() + 1);
	var A = addZero(J.getFullYear());
	var E = addZero(J.getFullYear().toString().substring(3, 4));
	var N = (O.indexOf("yyyy") > -1 ? A : E);
	var D = addZero(J.getHours());
	var C = addZero(J.getMinutes());
	var B = addZero(J.getSeconds());
	var G = 1;
	var M = 2;
	var P = (O.indexOf("DDD") > -1) ? G : M;
	var F = J.getDay();
	var I = new Array("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat");
	var K = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
	var L = O.replace(/dd/g, Q).replace(/MM/g, H).replace(/y{1,4}/g, N);
	L = L.replace(/hh/g, D).replace(/mm/g, C).replace(/ss/g, B);
	if (P == G) {
		L = L.replace(/DDD/g, I[F]);
	} else {
		L = L.replace(/D/g, K[F]);
	}
	return L;
}
function getAppServletURL(B) {
	var A = window.location;
	A += "stringitup";
	A = A.match(/^.*\/hoodoo/i);
	A += "/Servlet/request.aspx";
	return A;
}
function getWindowWidth(A) {
	var C = window;
	if (A) {
		C = A;
	}
	var B;
	if (C.self.innerWidth) {
		B = C.self.innerWidth;
	} else {
		if (C.document.documentElement && C.document.documentElement.clientWidth) {
			B = C.document.documentElement.clientWidth;
		} else {
			if (document.body) {
				B = C.document.body.clientWidth;
			}
		}
	}
	if (GetBrowserType() == BROWSER_TYPE_SAFARI) {
		B -= 9;
	}
	return B;
}
function getWindowHeight(A) {
	try {
		var B = window;
		if (A) {
			B = A;
		}
		var D;
		if (B.self.innerHeight) {
			D = B.self.innerHeight;
		} else {
			if (B.document.documentElement && B.document.documentElement.clientHeight) {
				D = B.document.documentElement.clientHeight;
			} else {
				if (B.document.body) {
					D = B.document.body.clientHeight;
				}
			}
		}
		if (GetBrowserType() == BROWSER_TYPE_SAFARI) {
			D -= 9;
		}
	}
	catch (C) {
	}
	return D;
}
function GetNodeDepth(A) {
	var B = 0;
	while (A.parentNode && A.parentNode != A) {
		B++;
		A = A.parentNode;
	}
	return B;
}
function GetNodeIndent(C) {
	var B = "";
	var D = GetNodeDepth(C);
	for (var A = 1; A < D; A++) {
		B += DOMToString_NodeIndent;
	}
	return B;
}
function DOMElementStartString(C) {
	var B = GetNodeIndent(C) + "<" + C.nodeName;
	for (var A = 0; A < C.attributes.length; A++) {
		B += DOMNodeToString(C.attributes.item(A));
	}
	B += ">\n";
	return B;
}
function DOMAttributeStartString(B) {
	var A = " " + B.nodeName + "=\"";
	if (GetBrowserType() == BROWSER_TYPE_SAFARI) {
		A += B.nodeValue;
	}
	return A;
}
function DOMTextStartString(C) {
	var B = "";
	var A = C.parentNode != null && C.parentNode.nodeType == 2;
	if (!A) {
		B += GetNodeIndent(C);
	}
	B += C.nodeValue;
	if (!A) {
		B += "\n";
	}
	return B;
}
function DOMCommentStartString(C) {
	var B = "";
	var A = C.parentNode.nodeType == 2;
	if (!A) {
		B += GetNodeIndent(C);
	}
	B += C.nodeValue;
	if (!A) {
		B += "\n";
	}
	return B;
}
function DOMElementEndString(A) {
	return GetNodeIndent(A) + "</" + A.nodeName + ">\n";
}
function DOMAttributeEndString(A) {
	return "\"";
}
function DOMTextEndString(A) {
	return "";
}
function DOMCommentEndString(A) {
	return "";
}
function DOMNodeToString(C) {
	var B = "";
	if (C.nodeType) {
		switch (C.nodeType) {
		  case 1:
			B += DOMElementStartString(C);
			break;
		  case 2:
			B += DOMAttributeStartString(C);
			break;
		  case 3:
			B += DOMTextStartString(C);
			break;
		  case 4:
			B += DOMCommentStartString(C);
			break;
		  default:
			B += "<???>";
			break;
		}
		for (var A = 0; C.childNodes != null && A < C.childNodes.length; A++) {
			B += DOMNodeToString(C.childNodes[A]);
		}
		switch (C.nodeType) {
		  case 1:
			B += DOMElementEndString(C);
			break;
		  case 2:
			B += DOMAttributeEndString(C);
			break;
		  case 3:
			B += DOMTextEndString(C);
			break;
		  case 4:
			B += DOMCommentEndString(C);
			break;
		  default:
			B += "</???>";
			break;
		}
	} else {
		B = "something bad";
	}
	return B;
}
function DOMDocumentToString(B) {
	var A;
	if (B == undefined) {
		A = "undefined";
	} else {
		A = DOMNodeToString(B.documentElement);
	}
	return A;
}
function GetBrowserType() {
	var C = navigator.userAgent.toLowerCase();
	if (C.indexOf("msie") != -1) {
		var B = new RegExp("msie ([0-9])");
		var D = B.exec(C);
		if (D) {
			var A = D[1];
			if (parseInt(A, 10) < 6) {
				return BROWSER_TYPE_IE_PRE_6;
			} else {
				return BROWSER_TYPE_IE;
			}
		}
	} else {
		if (C.indexOf("firefox") != -1) {
			return BROWSER_TYPE_FF;
		} else {
			if (C.indexOf("opera") != -1) {
				return BROWSER_TYPE_OPERA;
			} else {
				if (C.indexOf("safari") != -1) {
					return BROWSER_TYPE_SAFARI;
				}
			}
		}
	}
}
function OpenNewWindow(B, D, A, C) {
	if (C == undefined) {
		C = ",status=1,location=0,directories=0,toolbar=no,menubar=0,scrollbars=1,resizable=1";
	} else {
		C = "," + C;
	}
	Features = new String("left=" + (window.screen.availWidth / 2 - D / 2) + ",top=" + (window.screen.availHeight / 2 - A / 2) + ",height=" + A + ",width=" + D + C);
	return window.open(B, "_blank", Features);
}
function GetDisplay(A) {
	if (A == true) {
		return "";
	}
	return "none";
}
function CountInstances(A, B) {
	var C = A.split(B);
	return C.length - 1;
}
function getParentPath(B) {
	var A = B.lastIndexOf(TreePathDelimiter);
	if (A == -1) {
		return "";
	}
	var C = B.substring(0, A);
	return C;
}
function GetXMLValue(B) {
	if (!B) {
		return "";
	}
	if (B.nodeType == TEXT_NODE_TYPE) {
		return B.nodeValue;
	} else {
		if (B.firstChild && B.firstChild.nodeType == TEXT_NODE_TYPE) {
			return B.firstChild.nodeValue;
		}
	}
	try {
		if (B.firstChild) {
			return B.firstChild.nodeValue;
		} else {
			if (B.nodeValue) {
				return B.nodeValue;
			} else {
				return "";
			}
		}
	}
	catch (A) {
		try {
			if (B.nodeValue) {
				return B.nodeValue;
			} else {
				return "";
			}
		}
		catch (A) {
			return "";
		}
	}
}
function GetChildFolderNameFromPath(A) {
	var B = new RegExp("([^/]*)$");
	var C = B.exec(A);
	if (C) {
		return C[1];
	}
	return A;
}
function CreateIFramePage(A, C) {
	var B = document.createItem("DIV");
	A.appendChild(B);
	return true;
}
function GetFieldCount(B, A) {
	var C;
	var D = 1;
	C = B.indexOf(A);
	if (C > 0) {
		D++;
		while (C > 0 && D < 50) {
			C = B.indexOf(A, C + 1);
			if (C > 0) {
				D++;
			}
		}
	}
	return D;
}
function GetListItem(B, C, D) {
	var A = B.split(C);
	if (A.length > 0) {
		return A[D];
	}
}
function addEvent(E, D, C, A) {
	var B = false;
	if (E != null && C != null) {
		if (window.opera) {
			E.attachEvent("on" + D, C);
			B = true;
		} else {
			if (E.addEventListener) {
				E.addEventListener(D, C, A);
				B = true;
			} else {
				if (E.attachEvent) {
					E.attachEvent("on" + D, C);
					B = true;
				}
			}
		}
	}
	return B;
}
function removeEvent(E, D, C, A) {
	var B = false;
	if (E != null && C != null) {
		if (E.removeEventListener) {
			E.removeEventListener(D, C, A);
			B = true;
		} else {
			if (E.detachEvent) {
				E.detachEvent("on" + D, C);
				B = true;
			}
		}
	}
	return B;
}
function clearChildNodes(A) {
	if (!(A == undefined)) {
		while (A.childNodes.length > 0) {
			A.removeChild(A.firstChild);
		}
	}
}
function isLeapYear(A) {
	return ((A % 400 == 0) || ((A % 4 == 0) && (A % 100 != 0)));
}
function getNumberOfDaysInMonth(C, B) {
	var A = arrDaysInMonths[C];
	if (C == 1 && isLeapYear(B)) {
		A++;
	}
	return A;
}
function IsElementHorizontalScrollbarRendered(A) {
	return A.offsetWidth > 0 && (A.style.overflow == "scroll" || A.scrollWidth > A.offsetWidth);
}
function IsElementVerticalScrollbarRendered(A) {
	return A.offsetHeight > 0 && (A.style.overflow == "scroll" || A.scrollHeight > A.offsetHeight);
}
function SetElementOffsetHeightByID(B, A, C) {
	if (C) {
		if (C.getElementById(B)) {
			SetElementOffsetHeight(C.getElementById(B), A);
		}
	} else {
		if (document.getElementById(B)) {
			SetElementOffsetHeight(document.getElementById(B), A);
		}
	}
}
function SetElementOffsetHeight(D, A) {
	var B = D.offsetHeight - D.clientHeight;
	if (D.clientHeight == 0) {
		B = 0;
	} else {
		if (!B || B < 0) {
			B = 0;
		}
	}
	var E = Math.floor(A - B);
	if ((GetBrowserType() == BROWSER_TYPE_IE || GetBrowserType() == BROWSER_TYPE_SAFARI) && IsElementHorizontalScrollbarRendered(D)) {
		var C = 16;
		E += C;
	}
	if (E < 0) {
		E = 0;
	}
	D.style.height = E + "px";
}
function SetElementOffsetWidthByID(A, B) {
	SetElementOffsetWidth(document.getElementById(A), B);
}
function SetElementOffsetWidth(C, D) {
	if (GetBrowserType() == BROWSER_TYPE_FF) {
		E = D;
		if (IsElementVerticalScrollbarRendered(C)) {
		}
	} else {
		var A = C.offsetWidth - C.clientWidth;
		if (!A || A < 0) {
			A = 0;
		}
		var E = Math.floor(D - A);
	}
	if ((GetBrowserType() == BROWSER_TYPE_IE || GetBrowserType() == BROWSER_TYPE_SAFARI) && IsElementVerticalScrollbarRendered(C)) {
		var B = 16;
		E += B;
	}
	if (E < 0) {
		E = 0;
	}
	C.style.width = E + "px";
}
function getStringDimensionsTestSpan(C, A) {
	var B = document.getElementById("stringDimensionsTestSpan");
	if (B == null) {
		B = document.createElement("span");
		B.id = "stringDimensionsTestSpan";
		B.style.visibility = "hidden";
		document.body.appendChild(B);
	}
	B.className = A.className;
	clearChildNodes(B);
	B.appendChild(document.createTextNode(C));
	return B;
}
function getStringHeightInPixels(C, A) {
	var B = getStringDimensionsTestSpan(C, A);
	return B.offsetHeight;
}
function getStringWidthInPixels(C, A) {
	var B = getStringDimensionsTestSpan(C, A);
	return B.offsetWidth;
}
function getElementUltimateOffsetLeft(A) {
	var B = 0;
	while (A != null) {
		B += A.offsetLeft;
		A = A.offsetParent;
	}
	return B;
}
function getElementUltimateOffsetRight(A) {
	var C = A.clientWidth;
	var B = getElementUltimateOffsetLeft(A) + C;
	return B;
}
function getElementUltimateOffsetTop(A) {
	var B = 0;
	while (A != null) {
		B += A.offsetTop;
		A = A.offsetParent;
	}
	return B;
}
function EnsureElementIsInScrollView(E, D) {
	var C = D.offsetTop + D.offsetHeight;
	if (C > E.scrollTop + E.offsetHeight) {
		var A = C - E.offsetHeight;
		if (IsElementHorizontalScrollbarRendered(E)) {
			var B = 16;
			A += B;
		}
		E.scrollTop = A;
	} else {
		if (D.offsetTop < E.scrollTop) {
			E.scrollTop = D.offsetTop;
		}
	}
}
function HTMLEncode(B) {
	if ((B != undefined) && (B.length > 0)) {
		var A = B;
		A = A.replace(/&/g, "&amp;");
		A = A.replace(/</g, "&lt;");
		A = A.replace(/>/g, "&gt;");
		A = A.replace(/"/g, "&quot");
		return A;
	}
	return "";
}
function HTMLDecode(B) {
	if ((B != undefined) && (B.length > 0)) {
		var A = B;
		A = A.replace(/&amp;/g, "&");
		A = A.replace(/&lt;/g, "<");
		A = A.replace(/&gt;/g, ">");
		return A;
	}
	return "";
}
RegExp.escape = function (B) {
	if (!arguments.callee.sRE) {
		var A = ["/", ".", "*", "+", "?", "|", "^", "(", ")", "[", "]", "{", "}", "\\", "$"];
		arguments.callee.sRE = new RegExp("(\\" + A.join("|\\") + ")", "g");
	}
	if (B) {
		return B.replace(arguments.callee.sRE, "\\$1");
	} else {
		return "";
	}
};
function IsElementAAncestorOfElementB(D, C) {
	var B = C;
	if ((GetBrowserType() == BROWSER_TYPE_FF) || (GetBrowserType() == BROWSER_TYPE_SAFARI)) {
		try {
			while (B && B.id != "body") {
				if (B && (D.id == B.id)) {
					return true;
				}
				B = B.parentNode;
			}
		}
		catch (E) {
		}
		return false;
	} else {
		var A = false;
		while (B && !A) {
			if (D == B) {
				A = true;
			}
			B = B.parentElement;
		}
		return A;
	}
}
function GetElementText(B) {
	try {
		if ((GetBrowserType() == BROWSER_TYPE_FF) || (GetBrowserType() == BROWSER_TYPE_SAFARI)) {
			return B.innerHTML;
		} else {
			return B.innerText;
		}
	}
	catch (A) {
		return "";
	}
}
function SetElementText(E, A) {
	A += "";
	try {
		clearChildNodes(E);
		var B = E.document;
		if (B == undefined) {
			if (getTopAppWindow) {
				B = getTopAppWindow().document;
			} else {
				B = document;
			}
		}
		var D = B.createTextNode(A);
		E.appendChild(D);
	}
	catch (C) {
		return "";
	}
}
function SetFieldValue(B, A) {
	if (document.getElementById(B) && (A != null)) {
		document.getElementById(B).value = A;
	}
}
function GetFieldValue(A) {
	if (document.getElementById(A)) {
		return escape(document.getElementById(A).value);
	}
	return "";
}
function GetFieldValueEx(A) {
	if (document.getElementById(A)) {
		return encodeURIComponent(document.getElementById(A).value);
	}
	return "";
}
function SetFieldFocus(A) {
	if (document.getElementById(A)) {
		document.getElementById(A).focus();
	}
}
function SetControlState(B, A) {
	if (document.getElementById(B)) {
		document.getElementById(B).disabled = !A;
	}
}
function IsSpecialFolder(B) {
	var A = B.toUpperCase();
	if ((A == "\\INBOX") || (A == "\\CALENDAR") || (A == "\\TASKS") || (A == "\\SENT ITEMS") || (A == "\\DELETED ITEMS") || (A == "\\DRAFTS") || (A == "\\CONTACTS")) {
		return true;
	}
	return false;
}
function InitDaysDropDownList(A, D) {
	var C = new Array(D);
	var B = 0;
	for (B = 0; B < D; B++) {
		C[B] = (B + 1) + "";
	}
	InitListValues(A, C, 1);
}
function InitDaysOfWeekList(A) {
	var B = new Array("day", "weekday", "weekend day", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
	InitListValues(A, B);
}
function InitMonthsOfYearList(A) {
	var B = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
	InitListValues(A, B);
}
function InitDayOfWeekQualifier(A) {
	var B = new Array("first", "second", "third", "fourth", "last");
	InitListValues(A, B);
}
var g_clipboard = "";
function supported_clip() {
	return true;
}
function copy_clip(A) {
	g_clipboard = A;
	return false;
}
function get_clip() {
	return g_clipboard;
}
function ValidateInputNum(A) {
	if (!A) {
		return false;
	}
	var B = A.value;
	if (B.match(/^\d+$/)) {
		return true;
	} else {
		alert("Invalid input value. You must specify a valid number.");
		A.select();
		return false;
	}
}
function ME_Time_AddMonths(D, C) {
	if (!D) {
		return null;
	}
	var A = new Date(D.getTime());
	for (var B = 0; B < C; B++) {
		lCurMonth = D.getMonth();
		if (lCurMonth < 12) {
			A.setMonth(A.getMonth() + 1);
		} else {
			A.setYear(GetYearOfDate(A) + 1);
			A.setMonth(0);
		}
	}
	return A;
}
function ME_Time_AddDays(A, B) {
	return new Date(A.getTime() + (B * ONE_DAY_MS));
}
function ME_Time_SubtractDays(A, B) {
	return new Date(A.getTime() - (B * ONE_DAY_MS));
}
function ME_Time_DaysBetween(D, B) {
	var E = D.getTime();
	var C = B.getTime();
	var A = Math.abs(E - C);
	return Math.round(A / ONE_DAY_MS);
}
function ME_Time_WeekdaysInRange(D, C) {
	var A;
	var B = 0;
	if (D == null || C == null) {
		return 0;
	}
	if (C.getTime() < D.getTime()) {
		return 0;
	}
	A = D;
	do {
		if ((A.getDay() != DOW_SAT) && (A.getDay() != DOW_SUN)) {
			B++;
		}
		A.setTime(A.getTime() + ONE_DAY_MS);
	} while (A.getTime() <= C.getTime());
	return B;
}
function ME_Time_GetDateDOWInstance(C, E, A, B) {
	if (isNaN(A) || isNaN(B)) {
		return null;
	}
	var D = getNumberOfDaysInMonth(E, C);
	var G = new Date(C, E, 1);
	var F = 0;
	do {
		if (G.getDay() == B) {
			F++;
		}
		if (F == A) {
			return G;
		}
		G.setDate(G.getDate() + 1);
	} while ((G.getMonth() == E) && (G.getDate() <= D));
	G = new Date(C, E, D);
	while (G.getDate() > 0) {
		if (G.getDay() == B) {
			return G;
		}
		G.setDate(G.getDate() - 1);
	}
	return null;
}
function ME_Time_GetNthWeekday(B, C, A) {
	var E = null;
	var D = 0;
	if (!A || A == 0) {
		return null;
	}
	E = new Date(B, C, 1);
	while (D < A) {
		if ((E.getDay() != DOW_SAT) && (E.getDay() != DOW_SUN)) {
			D++;
		}
		if (D == A) {
			return E;
		}
		E.setDate(E.getDate() + 1);
	}
	return null;
}
function ME_Time_GetNthWeekendDay(B, C, A) {
	var E = null;
	var D = 0;
	if (!A || A == 0) {
		return null;
	}
	E = new Date(B, C, 1);
	while (D < A) {
		if ((E.getDay() == DOW_SAT) || (E.getDay() == DOW_SUN)) {
			D++;
		}
		if (D == A) {
			return E;
		}
		E.setDate(E.getDate() + 1);
	}
	return null;
}
function ME_Time_GetLastWeekday(A, B) {
	var C = new Date(A, B, getNumberOfDaysInMonth(B, A));
	while (C.getDate() > 1) {
		if ((C.getDay() != DOW_SAT) && (C.getDay() != DOW_SUN)) {
			return C;
		}
		C.setDate(C.getDate() - 1);
	}
	return null;
}
function ME_Time_GetLastWeekendDay(A, B) {
	var C = new Date(A, B, getNumberOfDaysInMonth(B, A));
	while (C.getDate() > 1) {
		if ((C.getDay() == DOW_SAT) || (C.getDay() == DOW_SUN)) {
			return C;
		}
		C.setDate(C.getDate() - 1);
	}
	return null;
}
function getDateTimeObjectFromDateString(E) {
	var D = null;
	var A = E.split("-");
	if (A.length < 3) {
		return null;
	}
	var C = parseInt(A[0], 10);
	var F = parseInt(A[1], 10) - 1;
	var B = parseInt(A[2], 10);
	D = new Date(C, F, B);
	if (A.length == 5) {
		D.setHours(A[3]);
		D.setMinutes(A[4]);
	} else {
		D.setHours("00");
		D.setMinutes("00");
	}
	return D;
}
function GetMonthInstance(B) {
	var A = 0;
	var C = Math.floor(B.getDate() / 7);
	var D = (B.getDate() % 7);
	if (D == 0) {
		A = C - 1;
	} else {
		A = C;
	}
	return (A + 1);
}
function GetYearOfDate(B) {
	var A = B.getYear();
	if (A < 1900) {
		A += 1900;
	}
	return A;
}
function GetDateFromFormatedStr(C) {
	if (C) {
		var E = new RegExp(" ([0-9]*)/([0-9]*)/([0-9]*)$");
		var G = E.exec(C);
		if (G) {
			var D = parseInt(G[1], 10);
			var A = parseInt(G[2], 10);
			var F = parseInt(G[3], 10);
			var B = new Date(F, A - 1, D);
			return B;
		} else {
			return null;
		}
	}
	return null;
}
function ME_Time_GetDateInstance(D, F, B, E) {
	var H = null;
	var C;
	if (B == 5) {
		if (E == 0) {
			var A = getNumberOfDaysInMonth(F, D);
			H = new Date(D, F, A);
		} else {
			if (E == 1) {
				H = ME_Time_GetLastWeekday(D, F);
			} else {
				if (E == 2) {
					H = ME_Time_GetLastWeekendDay(D, F);
				} else {
					C = E - 3;
					H = ME_Time_GetDateDOWInstance(D, F, B, C);
				}
			}
		}
	} else {
		if (E == 0) {
			var G;
			if (B == 5) {
				G = getNumberOfDaysInMonth(F, D);
			} else {
				G = B;
			}
			H = new Date(D, F, G);
		} else {
			if (E == 1) {
				H = ME_Time_GetNthWeekday(D, F, B);
			} else {
				if (E == 2) {
					H = ME_Time_GetNthWeekendDay(D, F, B);
				} else {
					C = E - 3;
					H = ME_Time_GetDateDOWInstance(D, F, B, C);
				}
			}
		}
	}
	return H;
}
function setElementOpacity(A, B) {
	A.style.opacity = B;
	A.style.filter = "alpha(opacity=" + (B * 100) + ")";
}
function setElementOpacityRecursive(A, B) {
	setElementOpacity(A, B);
	var C = A.firstChild;
	while (C != null) {
		if (C.nodeType != TEXT_NODE_TYPE) {
			setElementOpacityRecursive(C, B);
		}
		C = C.nextSibling;
	}
}
function GetValueAsLng(B) {
	var A = parseInt(B, 10);
	if (A) {
		return A;
	}
	var C = new RegExp("true", "i");
	if (C.test(B)) {
		return 1;
	}
	return 0;
}
function CreateEmptyTextNode() {
	return document.createTextNode("\xa0");
}
function ConfigureMouseEvents(B) {
	try {
		if (dodown) {
			document.onmousedown = dodown;
		}
		if (doup) {
			document.onmouseup = doup;
		}
		if (domove) {
			document.onmousemove = domove;
		}
		if (GetBrowserType() == BROWSER_TYPE_SAFARI) {
			document.oncontextmenu = function (C) {
				C = C || event;
				if (C.preventDefault) {
					C.preventDefault();
				} else {
					C.returnValue = false;
				}
				return false;
			};
		}
	}
	catch (A) {
	}
}
function GetElementVisibleHeightById(A) {
	return GetElementVisibleHeight(document.getElementById(A));
}
function isTopWindow(A) {
	var C = "";
	try {
		C = A.location.href;
	}
	catch (E) {
	}
	var B = new RegExp("client.aspx", "i");
	if (B.test(C)) {
		return true;
	}
	var D = new RegExp("default.aspx", "i");
	if (D.test(C)) {
		return true;
	}
	return false;
}
function getTopAppWindow() {
	if ((mTopAppWindow != null) && (mTopAppWindow != undefined)) {
		return mTopAppWindow;
	}
	if (isTopWindow(top)) {
		mTopAppWindow = top;
		return top;
	}
	var A = window.self;
	var B = null;
	if (isTopWindow(A)) {
		mTopAppWindow = A;
		return A;
	}
	do {
		B = A;
		A = A.parent;
	} while ((A != undefined) && (A) && (A != B) && (!isTopWindow(A)));
	if ((!A) | (A == undefined)) {
		LogDebug("Error: Unable to locate client.aspx / application launch page");
		A = top;
	}
	mTopAppWindow = A;
	return A;
}
function HideElementById(A) {
	var B = document.getElementById(A);
	if (B) {
		B.style.visibility = "hidden";
		B.style.display = "none";
	}
}
function ShowElementById(A) {
	var B = document.getElementById(A);
	if (B) {
		B.style.visibility = "visible";
		B.style.display = "block";
	}
}
function GetElementVisibleHeight(B) {
	var A = 0;
	if (B.style.display != "none") {
		A = B.offsetHeight;
	}
	return A;
}
function ClearElementStyleHeight(A) {
	A.style.height = "";
}
function ClearElementStyleHeightByID(B, A) {
	if (A == undefined) {
		A = document;
	}
	ClearElementStyleHeight(A.getElementById(B));
}
function Safari_CacheScroll(B) {
	if (GetBrowserType() == BROWSER_TYPE_SAFARI) {
		var A = document.getElementById(B);
		gSafariScrollCachePos = A.scrollTop;
		if (A.style.display != "none") {
			gSafariScrollHeightCache = A.offsetHeight;
		}
	}
}
function Safari_RestoreScroll(B) {
	if (GetBrowserType() == BROWSER_TYPE_SAFARI) {
		var A = document.getElementById(B);
		if (gSafariScrollHeightCache != 0 && gSafariScrollHeightCache == A.offsetHeight) {
			A.scrollTop = gSafariScrollCachePos;
		}
	}
}
function renderByteValueAsMostAppropriateString(B, C, A) {
	if (C == undefined) {
		C = "B";
	}
	if (A == undefined) {
		A = 0;
	}
	while (B > 1024 && (C == "B" || C == "KB" || C == "MB")) {
		B /= 1024;
		switch (C) {
		  case "B":
			C = "KB";
			break;
		  case "KB":
			C = "MB";
			break;
		  case "MB":
			C = "GB";
			break;
		}
	}
	B = roundToDecimalPlaces(B, A);
	return B + C;
}
function roundToDecimalPlaces(B, A) {
	return Math.round(B * Math.pow(10, A)) / Math.pow(10, A);
}
function setElementCursorStyle(B, A) {
	if (A == "pointer" && GetBrowserType() == BROWSER_TYPE_IE_PRE_6) {
		A = "hand";
	}
	B.style.cursor = A;
}
function IsBlankSrc(A) {
	return A.match(RegExp("[/]*loading.aspx$"));
}
function JSEscapeStr(B) {
	var A = "";
	A = B;
	A = A.replace(/'/g, "\\'");
	A = A.replace(/"/g, "\\\"");
	return A;
}

