<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<title>Spring Greetings</title>
</head>

<body>

<h1>Spring Greetings</h1>
<form:form action="greeting" modelAttribute="greetingForm"> 

	<input type="radio" id="myRadio"  value="texas" name="city">Texas
		<input type="radio" id="myRadio"  value="cincinnati" name="city"> Cincinnati
	<table>
		<tr>
			<td>Add your greeting:</td><td><form:input path="greeting.greetingText" size="100"/></td>
		</tr>
		
		<tr>
			<td>Add your greeting Id:</td><td><form:input path="greeting.greetingId"   size="100"/></td>
		</tr>
		
		<tr>
			<td>Add your formName from greeting:</td><td><form:input path="formName"   size="100"/></td>
		</tr>
		
		
		<tr>
			<td>Add your orderType:</td><td><form:input path="order.orderType" size="100"/></td>
		</tr>
		
		<tr>
			<td>What's your favorite color?</td>
			<td> 
				<form:select path="color.colorCode">
            		<form:option value="" label="--Please Select"/>
            		<form:options items="${colorList}" itemValue="colorCode" itemLabel="colorName"/>
        		</form:select>
			</td>
		</tr>
		
		<tr><td><select  id="simpleSelect" name="mySelect" title="whatever" multiple="multiple" ></select></td></tr>
			
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="Submit" />	
			</td>
		</tr>
		
	</table>
		
	<table>
  <c:forEach  items="${stringList}"  var="item"   >
    <tr> 
      <td> city:</td> <td ><c:out   value="${item}" /> </td>
    </tr>
  </c:forEach>
</table>

</form:form>

</body>
</html>