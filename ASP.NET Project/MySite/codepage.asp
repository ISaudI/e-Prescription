<html>
<% Response.Charset = "windows-1253" %> 
 <h1 style="font-family:newathu;">παπαριεσ</h1>
<p style="font-family:courier;">This is a paragraph.</p>

<!-- Welcome to my home page in UTF-8 --> 
<% 
  Response.Write "The Session code page is δοκιμη 1 " & Session.CodePage & "<BR>" 
  Response.CodePage =1253
  Response.Write "δοκιμη 2The code page for this page has been changed with Response.CodePage<BR>" 
  Response.Write "δοκιμη 3The Response code page is " & Response.CodePage & "<BR>" 
  Response.Write "The Session code page is still " & Session.CodePage & "<BR>" 
%>
</html>