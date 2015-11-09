<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <title>Signup for events</title>
  <!-- javascript and css -->
  <%@include file="includes.jsp"%>
  
  <style>
    #listTitleRow:first-child{
      font-weight: bold;
      background-color: #C6C9C4;
    }
    
  </style>
  
</head>

<body>

  <!--  Navigation -->
  <%@include file="navigation.jsp"%>

  <div class="container">

    <br> <br> <a href="<%=request.getContextPath()%>">Home</a>
    > <a href="/Training/event/register">Register for events</a> <br>
    
    <br/>

	<form class="" action='<c:url value="/event/register" />' method="POST">  
	    <table class="table">
	      <tr id="listTitleRow">
	        <td>Event Name</td><td>Description</td><td>Location</td><td>Time Start</td><td>Time End</td><td></td>
	      </tr>
	
	      <c:forEach items="${events}" var="event">
	        <tr>
	          <td>${event.eventName}</td>
	          <td>${event.description}</td>
	          <td>${event.location}</td>
	          <td>${event.startDate}</td>
	          <td>${event.endDate}</td>
	          <td><input type="checkbox" name="registerCheck"
	              value="${event.id }"> <span
	              class="glyphicon glyphicon-plus"></span></td>        
	          
	        </tr>
	      </c:forEach>
	    </table>
	    <input style="float: right; clear: both;"class="btn btn-success" type="submit"  value="Register" />
	</form>
    <br/>
  </div>

</body>
</html>
