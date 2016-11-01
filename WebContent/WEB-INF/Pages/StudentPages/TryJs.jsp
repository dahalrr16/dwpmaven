<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>






















<body>
<p>what is going on guys after jquery library put back and p tag out of div</p><br>
<div id="loadHere" >
<p>what is going on guys after function put on main.js directly</p>
<input type="button" id="button1" value="button1" onclick="return(load2())"/>
<input type="button" id="button2" value="button2" />
<input type="button" id="button3" value="button3" onclick="return(loadA())"/>
</div>

<script type="text/javascript" >
function load1(){
	load();
return	alert("second  line of alert");
} // load2 closer

 function loadA(){
	$(document).ready(function(){
		$("p").toggle();
	});
}// loadA closer 

</script>
















<script src="<c:url value="/resources/mytheme/js/jquery-1.11.1.js" />"></script>
<script src="<c:url value="/resources/mytheme/js/main.js" />"></script>

<%-- <script src="<c:url value="/resources/js/main.js" />"></script> 
This is the way source should be declared if you map as in the second way of mapping
 in spring-servlet.xml --%>
</body>
</html>