﻿<!DOCTYPE html>
<html>
<body>

<p>Click the button to display a confirm box.</p>

<button onclick="myFunction()">Try it</button>

<p id="demo"></p>

<script>
function myFunction() {
    var x;
    if (confirm("Press a button!") == true) 
{
        x = "update";
  alert ('Please enter your name');
}


else {
        x = "Cancel";
    }
    document.getElementById("demo").innerHTML = x;

}
</script>

</body>
</html>
