<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
What up Java Guys
<a href="/DWPMaven/WEB-INF/Pages/StudentPages/AjaxTry.jsp">Go to AjaxTry page</a>

<br><br>
<a href="StudentPages/AjaxTry">Go to AjaxTry page</a><br>
<a href="jpt.jsp">Go to AjaxTry page through jpt.jsp</a>
<br><br>


<a href="http://localhost:8070/DWPMaven/start/checkJS"> Go to TryJs.jsp</a>

<br>
<br>
<a href="http://localhost:8070/DWPMaven/start/goAjax"> Go to TryAjax.jsp</a>
<br><br>
<a href="start/goSimple"> Go to simple.jsp</a>

<br>
<h1>Another takeaway from here:</h1>
<br> When the redirction is directly done through any jsp page like 
index.jsp, the target jsp file should be under the webContent directly or any folder made
under the web content but not the WEB-INF. This holds good for both spring-servlet mapping or simple servlet 
without any particular mapping as in ""LoginProject. To redirect to any target jsp under WEB-INF,
it should be done through proper mapping.( 05/20/14)





</body>
</html>