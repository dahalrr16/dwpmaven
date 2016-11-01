<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="java.util.*, spring.mvc.Book" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page isELIgnored="false"%>
    
    
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="inclued.jsp"></jsp:include>
<%-- <jsp:include page="/WEB-INF/Pages/header.jsp"></jsp:include>  --%>        <!--commented  -->
</head>
<body>
<jsp:include page="header.jsp"></jsp:include> <!-- the path should be relative to the page which includes  -->


<%-- <% 

Book bookFromRequest=(Book)request.getAttribute("myBook");
String name345=bookFromRequest.getAuthorName();
%>
HELLO <%=  name345%>! WELCOME TO ONLINE SHOPPING --%>



<!-- 
/* String s1=(String)request.getAttribute("rUserName");
String s2=(String) request.getAttribute("rPassWord"); */
 -->
 
my heart is beating: ${x.getSubscription()} Sahi hoina ta

${x.getPageList()}

<%-- 
<c:forEach items="${x}" var="element"> 
  <tr>
    <td>'${element.authorName}</td>
  </tr>
</c:forEach> --%>


<c:forEach var="i" begin="1" end="5">
   Item <c:out value="${i}"/><p>
</c:forEach>




<div id="center" align="center" >
<jsp:include page="header3.jsp"></jsp:include>
<table align="center" background="black" bgcolor="" class="myClass">
<tr>Nepal</tr>
<tr>India</tr>
<tr>China</tr>
</table>
</div>
</body>
</html>