<!DOCTYPE html>
<%@page import="com.touchnet.test.antisamy.AntiSamyBean"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AntiSamy Test</title>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
<form target="oframe" method="post" action="processAntiSami.jsp">
<h2>AntiSamy Test</h2>
<% AntiSamyBean asb = new AntiSamyBean(request);   %>
<div class="d">
	policy file:  - others available from <a href="https://code.google.com/p/owaspantisamy/downloads/list" target="_blank">owaspantisamy</a><br/>
<textarea name="policy">
<?xml version="1.0" encoding="ISO-8859-1"?>
	
<!-- 
W3C rules retrieved from:
http://www.w3.org/TR/html401/struct/global.html
-->
	
<anti-samy-rules xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		xsi:noNamespaceSchemaLocation="antisamy.xsd">
	
	<directives>
		<directive name="omitXmlDeclaration" value="true"/>
		<directive name="omitDoctypeDeclaration" value="true"/>
		<directive name="maxInputSize" value="200000"/>
		<directive name="useXHTML" value="true"/>
		<directive name="formatOutput" value="true"/>
		
		<directive name="embedStyleSheets" value="false"/>
	</directives>
	
	<common-regexps>
	</common-regexps>
	
	<common-attributes>
	</common-attributes>

	<global-tag-attributes>
	</global-tag-attributes>

	<tag-rules>

		<!-- Tags related to JavaScript -->

		<tag name="script" action="remove"/>
		<tag name="noscript" action="remove"/>
		
		<!-- Frame & related tags -->
		
		<tag name="iframe" action="remove"/>
		<tag name="frameset" action="remove"/>
		<tag name="frame" action="remove"/>
		<tag name="noframes" action="remove"/>
		
		<!-- CSS related tags -->
		<tag name="style" action="remove"/>

	</tag-rules>

	<!--  No CSS -->

	<css-rules>
	</css-rules>

</anti-samy-rules>
</textarea>
</div>
<div class="d">
	test input:<br/>
<textarea name="inputhtml" id="inputhtml">

</textarea>
	<br/><input type="submit" value="run test"/>
</div>
<div class="d">
	<iframe  name="oframe" id="oframe" src="about:blank"></iframe>
</div>
</form>
<script>
setTimeout(function(){
var h = '<div>\r\n<span>in span&nbsp;-&nbsp;</span>\r\n<textarea>in ta</textarea>\r\n<br/><b>this is bold!</b>\r\n</div>\r\n';
document.getElementById('inputhtml').value=h;
},1000);
</script>
</body>
</html>
