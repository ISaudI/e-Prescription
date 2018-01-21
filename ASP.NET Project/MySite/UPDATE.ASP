<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<BODY style="background-color:RGB(0,162,232);">
<BODY style="background-color:RGB(0,162,232);">
 <button onclick="goBack()">Go Back</button>
<BR>

<script>
function goBack() {

 window.history.back();

}
</script>


<button onclick="myFunction()">Εκτέλεση Συνταγής Νο  <%= Request.QueryString("code")%> </button>
<p id="demo"></p>		
<%
	Dim conn
		Set conn = Server.CreateObject("ADODB.Connection")
		conn.Open "Provider=SQLOLEDB; Data Source = localhost; Initial Catalog = ergasia; User Id = vissas; Password=1T33w5Yrez3"

	set rs=Server.CreateObject("ADODB.recordset")
	SET RS1=Server.CreateObject("ADODB.recordset")
	%>
	<script>
		function myFunction() {
    		var x;
   		 if (confirm("Press a button!") == true) {
       		 x = "update";
	<%rs1.Open "UPDATE ReceipsMain SET Res_descr=' ΕΧΕΙ ΕΚΤΕΛEΣΤΕΙ      ' where Res_Id =" &  Request.QueryString("code") , conn%>
   	 } else {
        		x = "Cancel";
	   	 }
   	 document.getElementById("demo").innerHTML = x;
}
	
</script>

</BODY>


</html>