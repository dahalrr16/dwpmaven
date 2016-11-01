<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" %>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%=new java.util.Date()  %>
 <br>
 <br>
 variable message(variable ): ${message}
 <br>
 <br> 
 variable msg: ${model}
 <br>
 variable from model: ${model.getBook().toString()}
 <br>
 variable book autowired in the TestController : ${bookString} 
 <br>
 subscription obtained from bookString: ${bookString.getSubscription()}
 <br>
 
 <% String x=System.getProperties().getProperty("java");%>
 
 <h1>x</h1>
 
 print model: <c:forEach items="${map}" var="thing" >
 printed thing is:${thing}<br>
 </c:forEach> <!--we can not get objects directly from model, no iteration from model directly 
 but can iterate through the list/map added to model  -->
 <br>
 
 
 
 
 
  variable subscription autowired in the TestController : ${subscriptionString} <br>
  isbn value obtained from subscriptionString.getIsbn(): ${subscriptionString.getIsbn()}<!--works well  -->
 <br>
 
 
Order obtained from subscriptionString.getOrder(): ${subscriptionString.getOrder()}<!--works well  -->
 <br>isbn obtained from : <%-- ${subscriptionString.isbn} --%><!-- does not work since isbn is not exposed
 as it is a private field -->
 
 
 
 
 lets print model object directly ok: ${model.book }<!-- does not work -->
 Dume is very bad person
<%--  ${model.getAttribute("message")}  --%>
<%--   ${model.getAttribute("book2")} --%>
   <%--  ${book2.AuthorName)} --%>
 
</body>
</html>