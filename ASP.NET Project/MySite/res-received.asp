<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<BODY style="background-color:RGB(0,162,232);">
 <button onclick="goBack()">Go Back</button>
<BR>

<script>
function goBack() {

 window.history.back();

}
</script>

<%
	Dim conn
		Set conn = Server.CreateObject("ADODB.Connection")
		conn.Open "Provider=SQLOLEDB; Data Source = localhost; Initial Catalog = ergasia; User Id = vissas; Password=1T33w5Yrez3"

	If conn.errors.count = 0 Then
		Response.Write "ΠΕΛΑΤΗΣ  " & Request.QueryString("code")
	End If
	set rs=Server.CreateObject("ADODB.recordset")
	rs.Open "Select * from syntages where Res_Cust = "&  Request.QueryString("code"), conn
	SET RS1=Server.CreateObject("ADODB.recordset")
	rs1.Open "Select * from CUSTOMERS where CUST_ID = "&  Request.QueryString("code"), conn%>

<table border="1" width="100%">
<% do until rs1.eof%>
<%for each x in rs1.fields%>
<td><b><font face="Arial"  size=1><%response.write(x.value)%></FONT></b></td>
 <%next
rs1.movenext%>
</tr>
<%loop
rs1.close
%>
</table>

<%Response.Write "ΣΥΝΤΑΓΕΣ" %>

<table border="1" width="100%">
<% do until rs.eof%>
<%for each x in rs.fields%>

<td><b><font face="Arial"  size=1><%response.write(x.value)%></FONT></b></td>
 <%next
rs.movenext%>
</tr>
<%loop
rs.close
%>
</table>
		
	<form action="UPDATE.asp"  method="GET"/ >
   	<input type="text" name="CODE" list="CODE">
	<input type="submit" value="Εκτλεσης Συνταγης Με Α/Α  " name="submit" id="submit">

</form>  

</BODY>


</html>