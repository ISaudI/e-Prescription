<html>

<form action="param-received.asp"  method="GET"/ >
   <input type="text" id="foo" name="foo">
   <input type="submit" value="Send" name="submit" id="submit">
</form>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
	Dim conn
		Set conn = Server.CreateObject("ADODB.Connection")
		conn.Open "Provider=SQLOLEDB; Data Source = localhost; Initial Catalog = ergasia; User Id = vissas; Password=1T33w5Yrez3"

	set rs=Server.CreateObject("ADODB.recordset")

rs.Open "Select * from CUSTOMERS order by cust_id", conn
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