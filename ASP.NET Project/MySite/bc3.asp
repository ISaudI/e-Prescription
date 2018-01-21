<html>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=windows-1252">
<body>
<p>  ??????? </p>
 <input type="text" name="firstname"><br>
 <button onclick="myFunction()">I?a??s</button> 
<%
Dim conn

Set conn = Server.CreateObject("ADODB.Connection")

conn.Open "Provider=SQLOLEDB; Data Source = localhost; Initial Catalog = ergasia; User Id = vissas; Password=1T33w5Yrez3"

If conn.errors.count = 0 Then

Response.Write "Connected OK"

End If
set rs=Server.CreateObject("ADODB.recordset")
rs.Open "Select * from iatroi where firstname like 'd%'", conn
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


</body>
</html>