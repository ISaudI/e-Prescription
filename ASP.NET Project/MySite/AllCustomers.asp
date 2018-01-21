<html>
<BODY style="background-color:RGB(0,162,232);">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <button onclick="goBack()">Go Back</button>
<BR>
<script>
function goBack() {
 window.history.back();
}
</script>
	<form action="res-received.asp"  method="GET"/ >
   	Κωδικός Πελάτη <input type="text" id="foo" name="CODE">
  	 <input type="submit" value="ΑΝΑΖΗΤΗΣΗ  ΣΥΝΤΑΓΩΝ" name="submit" id="submit">
	</form>

<%
	Dim conn
		Set conn = Server.CreateObject("ADODB.Connection")
		conn.Open "Provider=SQLOLEDB; Data Source = localhost; Initial Catalog = ergasia; User Id = vissas; Password=1T33w5Yrez3"

	If conn.errors.count = 0 Then
		Response.Write "ΚΑΤΑΛΟΓΟΣ ΠΕΛΑΤΩΝ"
	End If
set rs=Server.CreateObject("ADODB.recordset")

rs.Open "Select * from CUSTOMERS where Cust_Lname like '"&Request.QueryString("code")&"%'", conn
%>
<table border="2" width="100%">

<% do until rs.eof%>
<%for each x in rs.fields%>
<td><b><font face="Arial"  size=1><%response.write(x.value)%></font></b></td>
 
<%next
rs.movenext%>
</tr>
<%loop
rs.close
%>

</table>



</BODY>

</html>