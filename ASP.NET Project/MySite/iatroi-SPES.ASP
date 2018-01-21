<html>
<BODY style="background-color:RGB(0,162,232);">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<body>

<%
Dim conn
Set conn = Server.CreateObject("ADODB.Connection")

conn.Open "Provider=SQLOLEDB; Data Source = localhost; Initial Catalog = ergasia; User Id = vissas; Password=1T33w5Yrez3"

If conn.errors.count = 0 Then

Response.Write "Κατάλογος Ιατρών"
	else
Response.Write "Αγνωστος Ιατρός"
End If
set rs=Server.CreateObject("ADODB.recordset")
rs.Open "SELECT  distinct Specialty  from iatroi ", conn
%>
<table border="1" width="100%">
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


</body>
</html>