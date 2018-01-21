<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

 <button onclick="goBack()">Go Back</button>

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
		Response.Write "ΣΥΝΤΑΓΕΣ "
	End If
set rs=Server.CreateObject("ADODB.recordset")

rs.Open "Select * from CUSTOMERS where cust_id ="&  Request.QueryString("code"), conn
%>
<table border="1" width="100%">
<% do until rs.eof%>
<%for each x in rs.fields%>
<td><b><%response.write(x.value)%></b></td>
 
<%next
rs.movenext%>
</tr>
<%loop
rs.close
%>
</table>





</html>