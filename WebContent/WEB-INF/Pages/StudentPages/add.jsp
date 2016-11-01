<%@ page  language="java"  contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Java is <h1>diffi</h1>... wait for wait for it ....<h1>cult.</h1>
<br>
<form:form name="addForm" modelAttribute="formBean" action="registered" method="Post">
Name of Student:<form:input path="name" size="30" placeholder="enter your Name" /><br>
Id of Student: <form:input path="id" size="30" /><br>
Age of Student: <form:input path="age" size="30"/><br>
<input type="submit" value="submit">

</form:form>



</body>
</html>