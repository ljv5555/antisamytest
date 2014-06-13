<!DOCTYPE html>
<%@page import="com.touchnet.test.antisamy.AntiSamyBean"%>
<html>
<head>
<title>AntiSamy Test Results</title>
<style type="text/css">
body,body *{font-family: arial;color:blue;}
textarea,iframe{
resize: both;
width:90%;
height:100px;
margin:5px 5% 5px 5%;
font-family: courier new;
font-size: 10.5px;
border-radius:4px;
}
iframe{height:227px;border:1px solid white;border-radius:4px;}
.d{margin:5px 5px 5px 5px;padding:5px 5px 5px 5px;color:white;background:blue;border-radius:4px;}
button,input{border-radius:4px;border:1px solid white;background:blue;color:white;}
.cleanhtmltrue{color:green;font-weight:800;}
.cleanhtmlfalse{color:red;font-weight:800;}

</style>
</head>
<body>
<% 

AntiSamyBean asb = new AntiSamyBean(request);

String text = String.valueOf(request.getParameter("inputhtml")).trim();
String policy = String.valueOf(request.getParameter("policy")).trim();
System.out.println("input: \r\n"+text);
System.out.println("policy: \r\n"+policy);
boolean passespolicy = asb.passesPolicy(text, policy);
String chtml = asb.scrubHtml(text, policy);

%>

<div class="d">Html was clean: <span class="cleanhtml<%=passespolicy  %>"><%=passespolicy  %></span></div>
<div class="d">Html after cleaning: <br/>
<textarea>
<%= chtml %>
</textarea>
</div>
</body>
</html>