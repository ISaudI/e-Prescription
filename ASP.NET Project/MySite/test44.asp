{
    var db = Database.Open("ergasia.accdb");
    var selectQueryString = "SELECT * FROM customers ORDER BY cust_id";
 }
<!DOCTYPE html>
<html>
 <head>
   <title>Small Bakery Products</title>
   <style>
       table, th, td {
         border: solid 1px #bbbbbb;
         border-collapse: collapse;
         padding: 2px;
       }
    </style>
 </head>
 <body>
   <h1>Small Bakery Products</h1>
   <table>
       <thead>
           <tr>
               <th>cust_id</th>
              
       <th>Price</th>
           </tr>
       </thead>
       <tbody>
           @foreach(var row in db.Query(selectQueryString)){
            <tr>
               <td>@row.Id</td>
                   <td>@row.Name</td>
                   <td>@row.Description</td>
                   <td>@row.Price</td>
            </tr>
           }
       </tbody>
   </table>
 </body>
</html>