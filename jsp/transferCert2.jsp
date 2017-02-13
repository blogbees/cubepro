<%@include file="/jsp/common/commonHeader.jsp"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cubepro.student.StudentDetails"%>
<%@page import="com.cubepro.registration.SchoolDetails"%>
<%@page import="com.cubepro.util.StringUtils"%>
<html>
<head></head>
<title>
</title>
<% List transferList = (ArrayList)request.getAttribute("TRANSFERCERT");
StudentDetails studentDetails = (StudentDetails) transferList.get(0);
SchoolDetails schoolDetails = (SchoolDetails) transferList.get(1);
%>
<body width="800px">
<table border="1px" width="800" height="1169" />
<tr>
<td>
<table width="100%">
<tr><td align="center" colspan="2">

<table width="100%" align="center" border="0" >
<tr><td colspan="3" >
<p align="right" class="alt" ><a href="javascript:print();"><b>Print</b></a>&nbsp;</p>
</td></tr>
<tr><td height="50">&nbsp;</td>
<td><p align="center" style="padding-left:80px;"><b>Government of TamilNadu. Department of School Education</b></p></td>
<td rowspan="3"><h1>HSC</h1></td>
</tr> 
<tr><td height="50">&nbsp;</td>
<td colspan="2"><p align="center"><b>TRANSFER CERTIFICATE</b></p></td></tr>
<tr>
<td>&nbsp;</td>
<td colspan="2"><p align="center">Recognized by the Director of School Education</p></td></tr>
</table> 

</td>
</tr>
<tr>
<td width="50%">
<table width="100%" border="1"><tr><td width="50%">SI.No :</td><td width="50%">
School Govt Reg No. :</td></tr><tr><td width="50%"><%=studentDetails.getStudentId() %></td><td width="50%"><%=schoolDetails.getGovtRegNo().toUpperCase() %></td></tr></table>
</td>
<td width="50%">
<table width="100%" border="1"><tr><td width="50%">Mark Sheet No/Date :</td><td width="50%">Admin No. :</td></tr><tr><td width="50%"><%=StringUtils.nullToBlank(request.getParameter("mark"))%></td> <td width="50%"><%=studentDetails.getAdmissionNo() %> </td></tr></table>
</td>
</tr>
</table>
<table border="0" width="100%">
<tr>
<td width="5%">1.</td>
<td width ="45%"><p>(a)Name of the School</p></td> 
<td width="5%">:</td>
<td width="45%"><%=schoolDetails.getSchoolName().toUpperCase()%></td>
</tr>
<tr>
<td width="5%">&nbsp;</td>
<td width ="45%"><p>(b)Name of the Educational District</p></td> 
<td width="5%">:</td>
<td width="45%"><%=schoolDetails.getEduDis().toUpperCase()%></td>
</tr>
<tr>
<td width="5%">&nbsp;</td>
<td width ="45%"><p>(c)Name of the Revenue District</p></td> 
<td width="5%">:</td>
<td width="45%"><%=schoolDetails.getRevDis().toUpperCase()%></td>
</tr>
<tr>
<td width="5%">2.</td>
<td width ="45%"><p>Name of the pupil (IN BLOCK LETTER)</p></td> 
<td width="5%">:</td>
<td width="45%"><%=studentDetails.getLastName().toUpperCase()%> <%=studentDetails.getStudentName().toUpperCase()%></td>
</tr>
<tr>
<td width="5%">3.</td>
<td width ="45%"><p>Name of the Father or Mother of the pupil</p></td> 
<td width="5%">:</td>
<td width="45%"><%=studentDetails.getFatherName().toUpperCase()%></td>
</tr>
<tr>
<td width="5%">4.</td>
<td width ="45%"><p>Nationality and Religion</p></td> 
<td width="5%">:</td>
<td width="45%"><%=studentDetails.getNationality()%> <%=studentDetails.getReligion().toUpperCase()%></td>
</tr>
<tr>
<td width="5%">5.</td>
<td width ="45%"><p><ul>Community</ul></p><p>Whether He/She belongs to</p></td> 
<td width="5%">:</td>
<td width="45%"><%=studentDetails.getCategory()%></td> 
</tr>
<tr>
<td width="5%">6.</td>
<td width ="45%"><p>Sex</p></td> 
<td width="5%">:</td>
<td width="45%"><%=studentDetails.getGender().toUpperCase()%></td>
</tr>
<tr>
<td width="5%">7.</td>
<td width ="45%"><p>Date of birth as entered in the admission Register,in figures and words</p></td> 
<td width="5%">:</td>
<td width="45%"><%=studentDetails.getDobString()%>
&nbsp;(&nbsp;
<%=studentDetails.getDobStringInWords()%>
&nbsp;)&nbsp;
</td> 
</tr>
<tr>
<td width="5%">8.</td>
<td width ="45%"><p>Personal marks of identification</p></td> 
<td width="5%">:</td>
<td width="45%"><%=studentDetails.getIdenMark1().toUpperCase()%> <%=studentDetails.getIdenMark2().toUpperCase()%> </td>
</tr>
<tr>
<td width="5%">9.</td>
<td width ="45%"><p>Date of admission and standard in which admitted(the year to be entered in words) </p></td> 
<td width="5%">:</td>
<td width="45%"><%=studentDetails.getDojString()%>
&nbsp;(&nbsp;
<%=studentDetails.getDojStringInWords()%>
&nbsp;)&nbsp;
</td>
</tr>
<tr>
<td width="5%">10.</td>
<td width ="45%"><p>(a) Standard in which the pupil was studying at the time of leaving (in words)</p></td> 
<td width="5%">:</td>
<td width="45%">
<%=studentDetails.getClassDetails().getClassWithSectionName()%>
&nbsp;(&nbsp;
<%=studentDetails.getClassDetails().getClassNameInWords()%>
&nbsp;)&nbsp;
</td>
</tr>
<tr>
<td width="5%">&nbsp;</td>
<td width ="45%"><p>(b)The course offered,i.e.,General Education or Vocational Education</p></td> 
<td width="5%">:</td>
<td width="45%"><%=studentDetails.getCourseIds()%></td>
</tr>
<tr>
<td width="5%">&nbsp;</td>
<td width ="45%"><p>(c)Subjects offered</p></td> 
<td width="5%">:</td>
<td width="45%"><%=StringUtils.nullToBlank(request.getParameter("subOff"))%></td>
</tr>
<tr>
<td width="5%">&nbsp;</td>
<td width ="45%"><p>(d)Language offered under Part I</p></td> 
<td width="5%">:</td>
<td width="45%"><%=StringUtils.nullToBlank(request.getParameter("langOff"))%></td>
</tr>
<tr>
<td width="5%">&nbsp;</td>
<td width ="45%"><p>(e)Medium of study</p></td> 
<td width="5%">:</td>
<td width="45%"><%=studentDetails.getMedium()%></td>
</tr>
<tr>
<td width="5%">11.</td>
<td width ="45%"><p>Whether qualified for promotion to higher Standard under Higher Secondary Education rules</p></td> 
<td width="5%">:</td>
<td width="45%"><%=StringUtils.nullToBlank(request.getParameter("qualified"))%></td>
</tr>
<tr>
<td width="5%">12.</td>
<td width ="45%"><p>Whether the pupil has paid all the fees due to the school</p></td> 
<td width="5%">:</td>
<td width="45%"><%=StringUtils.nullToBlank(request.getParameter("paidFee"))%></td>
</tr>
<tr>
<td width="5%">13.</td>
<td width ="45%"><p>Whether the pupil was in receipt of any Scholarship(Nature of the Scholarship to be specified)or any Educational Concessions</p></td> 
<td width="5%">:</td>
<td width="45%"><%=studentDetails.getScholarship()%></td>
</tr>
<tr>
<td width="5%">14.</td>
<td width ="45%"><p>Whether the pupil has undergone medical inspection if any during the academic year (First or repeat to be specified)</p></td> 
<td width="5%">:</td>
<td width="45%"><%=StringUtils.nullToBlank(request.getParameter("medIns"))%></td>
</tr>
<tr>
<td width="5%">15.</td>
<td width ="45%"><p>Date on which the pupil actually left the school</p></td> 
<td width="5%">:</td>
<td width="45%"><%=StringUtils.nullToBlank(request.getParameter("leftDate"))%></td>
</tr>
<tr>
<td width="5%">16.</td>
<td width ="45%"><p>The pupil's conduct and character</p></td> 
<td width="5%">:</td>
<td width="45%"><%=studentDetails.getRemarks()%></td>
</tr>
<tr>
<td width="5%">17.</td>
<td width ="45%"><p>Date on which application for Transfer certificate was made on behalf of the pupil by his parents or guardian.</p></td> 
<td width="5%">:</td>
<td width="45%"><%=StringUtils.nullToBlank(request.getParameter("appDate"))%></td>
</tr>
<tr>
<td width="5%">18.</td>
<td width ="45%"><p>Date of Transfer Certificate</p></td> 
<td width="5%">:</td>
<td width="45%">&nbsp;</td>
</tr>
<tr>
<td width="5%">19.</td>
<td width ="45%"><p>Course of Study</p></td> 
<td width="5%">:</td>
<td width="45%">&nbsp;</td>
</tr>
</table>
<br/>
<table width="100%"border="1">
<tr>
<td>Name of the School</td>
<td>Academic Year(s)</td>
<td>Standard Studied</td>
<td>First Language</td>
<td>Medium of Instruction</td>
</tr>
<tr>
<td width="150" height="100"><%=schoolDetails.getSchoolName().toUpperCase()%></td> 
<td><bean:write name="transferCertForm" property="acNo"/></td> 
<td><bean:write name="transferCertForm" property="standards"/></td> 
<td><%=studentDetails.getFirstLanguage()%></td> 
<td><%=studentDetails.getMedium()%></td> 
</tr>
</table> 
<table border="0" width="100%>
<tr><td width="70%"><p>20.Signature of the H.M. with date and school seal.</p></td></tr><br/><br/><br/>
<td align="center" width="30%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p>HEADMASTER</p></td></tr><br/>
<tr><td align="left" width="70%"><p>I hereby declare that the particulars recorded against items 2 to 7 are correct and that no changes will be demanded by me in future</p></td>
<td align="right" width="30%"><p>Signature of the Parent / Guardian.</p></td></tr>
</table></body>
</html>