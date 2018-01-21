<html>
<body>
<%
Dim conn

Set conn = Server.CreateObject("ADODB.Connection")

conn.Open "Provider=SQLOLEDB; Data Source = localhost; Initial Catalog = ergasia; User Id = vissas; Password=1T33w5Yrez3"

If conn.errors.count = 0 Then

Response.Write "Connected OK"

End If
set rs=Server.CreateObject("ADODB.recordset")


rs.Open "Select * from iatroi where firstname like 'd%'", conn

for each x in rs.fields

  response.write(x.name)
  response.write(" = ")
  response.write(x.value)

next

%>
</body>
</html>