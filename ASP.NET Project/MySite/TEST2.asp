<%@ Page Language="VB" %>
<script runat="server">

    Sub Button1_Click(sender As Object, e As EventArgs)
       Response.Write("Postback!")
    End Sub

</script>
<html>
<head>
</head>
<body onload="javascript:document.forms[0]['Button1'].value=Date();">
    <form runat="server">
        <p>
            <asp:Button id="Button1" onclick="Button1_Click" 
             runat="server" Font-Bold="True" Font-Names="Verdana" 
             Font-Size="Larger"></asp:Button>
        </p>
    </form>
</body>
</html>