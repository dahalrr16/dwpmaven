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
<form:form name="relativeForm" modelAttribute="formBean" action="relativeRegister" method="Post">
Name of Student:<form:input path="name" size="30"/><br>
Id of Student: <form:input path="id" size="30"/><br>
Age of Student: <form:input path="age" size="30"/><br>
Country of Origin:
<form:select path="country.name">
<c:forEach var="country" items="${countryList }">
    <option value="${country.getName()}" >${country.getName()}</option><!-- we can put the value blank and get the job done -->
</c:forEach>
</form:select>
<br>
<input type="submit" value="submit" align="right">

</form:form>






<!-- this part works perfectly fine
<c:forEach items="${countryList}" var="country">
<c:out value="${country}">A</c:out>
<c:out value="${country.getName()}">B</c:out>
</c:forEach>

 -->
</body>
</html>