 <!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<body style="background-color:RGB(153,217,234);">
<h3>Αναζήτηση Ιατρών</h3>
<img src="no_doctors1.png" alt="MM" style="width:50px;height:50px;">
		
		
	<form action="iatroi-name.asp"  method="GET"/ >
   	<input type="text" name="CODE" list="CODE">
	<input type="submit" value="Αναζήτηση Ιατρων με Ονομα  " name="submit" id="submit">
	</form>  

		<%Dim conn
		Set conn = Server.CreateObject("ADODB.Connection")
		conn.Open "Provider=SQLOLEDB; Data Source = localhost; Initial Catalog = ergasia; User Id = vissas; Password=1T33w5Yrez3"
		set rs=Server.CreateObject("ADODB.recordset")
		rs.Open "SELECT  distinct Specialty  from iatroi ORDER BY Specialty ", conn%>
		<form action="iatroi-REGION.asp"  method="GET"/ >
		
	<select name="CODE" onChange="combo(this, 'theinput')">
		<% do until rs.eof%>
		<%for each x in rs.fields%>
		<option><%response.write(x.value)%></option>
 		<%next
		rs.movenext%>
		<%loop
		rs.close
		%>
	</select)">	
  	 <input type="submit" value="Αναζήτηση Ιατρων με Ειδικότητα" name="submit" id="submit">
	</form>
<hr>
	<h3>Αναζήτηση Φαρμακείων</h3>
	<img src="pharmacy1.png" alt="MM" style="width:50px;height:50px;">
	<form action="DRAGSTORES.asp"  method="GET"/ >
   	<input type="text" name="CODE" list="CODE">
	<input type="submit" value="Αναζήτηση Φαρμακείων Περιοχής  " name="submit" id="submit">
	</form>  
<hr>
<h3>Κατάλογος Πελατών</h3>
	<img src="people2.jpg" alt="MM" style="width:50px;height:50px;">
	<form action="allcustomers.asp"  method="GET"/ >
   	<input type="text" name="CODE" list="CODE">
	<input type="submit" value="Κατάλογος Πελατών  " name="submit" id="submit">
	</form>  
<hr>
</body>
</html> 