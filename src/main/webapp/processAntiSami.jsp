<!DOCTYPE html>
<%@page import="com.touchnet.test.antisamy.AntiSamyBean"%>
<html>
<head>
<title>AntiSamy Test Results</title>
<style type="text/css">
body,body *{font-family: arial;color:blue;}
.d{margin:5px 5px 5px 5px;padding:5px 5px 5px 5px;color:white;background:blue;}
textarea{
width:90%;
height:100px;
margin:5px 5% 5px 5%;
font-family: courier new;
font-size: 10.5px;
}
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

<div class="d">Html was clean: <%=passespolicy  %></div>
<div class="d">Html after cleaning: <br/>
<textarea>
<%= chtml %>
</textarea>
</div>
</body>
</html>