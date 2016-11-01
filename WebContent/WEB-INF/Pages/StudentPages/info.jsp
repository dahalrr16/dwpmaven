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
From studetn List: ${studentList}
 <br>
From foreach loop:<c:forEach items="${studentList}" var="stud"  >
<br>
Printed from variable of foreach: ${stud.getName()}<br>
printed from value of variable: <c:out value="${stud}"></c:out>  </c:forEach> 
<br>
  from student object: ${student.getName() }



</body>
</html>