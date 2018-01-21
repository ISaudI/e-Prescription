<html>
	<head>
	<title>Retrieve data from database </title>
	</head>
	<body>

	<% 
'declare the variables 
	Dim Connection
	Dim ConnString
	Dim Recordset
	Dim SQL

'define the connection string, specify database driver
	ConnString="DRIVER={SQL Server};SERVER=83.212.99.45,1433;UID=vissas;" & _ 
	"PWD=1T33W5Yrez3;DATABASE=ergasia"

'declare the SQL statement that will query the database
	SQL = "SELECT * FROM customers"

'create an instance of the ADO connection and recordset objects
	Set Connection = Server.CreateObject("ADODB.Connection")
	Set Recordset = Server.CreateObject("ADODB.Recordset")

'Open the connection to the database
	Connection.Open ConnString

'Open the recordset object executing the SQL statement and return records 
Recordset.Open SQL,Connection

'first of all determine whether there are any records 
If Recordset.EOF Then 
Response.Write("No records returned.") 
Else 
'if there are records then loop through the fields 
Do While NOT Recordset.Eof   
Response.write Recordset("cust_id")
'Response.write Recordset("SECOND_FIELD_NAME")
'Response.write Recordset("THIRD_FIELD_NAME")
Response.write "<br>"    
Recordset.MoveNext     
Loop
End If

'close the connection and recordset objects to free up resources
Recordset.Close
Set Recordset=nothing
Connection.Close
Set Connection=nothing

	</body>
	</html>