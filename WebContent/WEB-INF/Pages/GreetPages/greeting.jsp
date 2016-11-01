<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" %>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>spring greetings</title>
</head>
<body bgcolor='#<c:out value="${colorCode }"/>'>
<h1>Spring Greetings</h1>
Greeting by Anonymous
on <c:out value="<%=new Date() %>"></c:out><br>
<c:out value="${greeting.greetingText }"></c:out><br>
<br>
<c:out value="${order.orderType }"></c:out><br>
Lets print formName which is String object in Model attribute itself:  <c:out value="${formName }"></c:out><br>


<%-- <c:out value="${order.orderType }"></c:out><br> --%>


<p><a href="SpringMVCDWPCurrentAnnotated/class/addgreeting">add Greeting</a><br>
<a href="SpringMVCDWPCurrentAnnotated">Home</a>



</body>
</html>