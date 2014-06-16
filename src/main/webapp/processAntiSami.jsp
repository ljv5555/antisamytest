<!DOCTYPE html>
<%@page import="com.touchnet.test.antisamy.AntiSamyBean"%>
<html>
<head>
<title>AntiSamy Test Results</title>
<style type="text/css">
body,body *{font-family: arial;background:white;}
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
.d{margin:5px 5px 5px 5px;padding:5px 5px 5px 5px;color:grey;background:#ccf;border-radius:4px;}
button,input{border-radius:4px;border:1px solid white;background:blue;color:white;}
.cleanhtmltrue{color:green;font-weight:800;}
.cleanhtmlfalse{color:red;font-weight:800;}
pre{background:white;}
</style>
<link rel="stylesheet" href="http://yandex.st/highlightjs/8.0/styles/default.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://yandex.st/highlightjs/8.0/highlight.min.js"></script>

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
<script>
function reformatdata()
{
	$('.formattedprefromta').each(function(i,e){$(e).prev.val($(e).text());$(e).remove();});
		
		
		

		setTimeout(function(){
		    $('textarea').each(function(i,e){
		  var tah = $(e).height();
		  var taw = $(e).width();
		  $(e).slideUp();      
		  var jqe = $(e);
		  var pre = $('<pre>');
		  pre.addClass('formattedprefromta');
		  var code = $('<code contenteditable="true"/>');
		  code.text(jqe.val());
		  pre.append(code);
		  jqe.after(pre);
		  pre.css('display','inline-block');
		  pre.css('overflow','scroll');
		  pre.css('height',tah+'px');
		  pre.css('width',taw+'px');
		  pre.css('resize','both');
		  hljs.highlightBlock(code[0]);
		  code.on('blur',
		       function(){hljs.highlightBlock(code[0]);code.parent().prev().val(code.text());}
		         );
		    
		    
		    });
		},1000);
		return true;
}

$(document).ready(function() {
reformatdata();  
});
</script>
</body>
</html>