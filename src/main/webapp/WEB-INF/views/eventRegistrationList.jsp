<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Registered Events</title>
<!-- javascript and css -->
<%@include file="includes.jsp"%>

<style type="text/css">
#listTitleRow:first-child {
	font-weight: bold;
	background-color: #C6C9C4;
}
</style>

</head>

<body>

	<!--  Navigation -->
	<%@include file="navigation.jsp"%>

	<div class="container">

		<br> <br> <a href="<%=request.getContextPath()%>">Home</a> >
		<a href="/Training/event/list">Registered Events</a> <br> <br />

		<h2>You are registered for the following events:</h2>
		<table class="table">
			<tr id="listTitleRow">
				<td>Event Name</td>
				<td>Description</td>
				<td>Location</td>
				<td>Time Start</td>
				<td>Time End</td>
				<td></td>
			</tr>

			<c:forEach items="${eventRegistrations}" var="event">
				<tr>
					<td>${event.eventName}</td>
					<td>${event.description}</td>
					<td>${event.location}</td>
					<td>${event.startDate}</td>
					<td>${event.endDate}</td>
					<td><a onclick="return confirm('Are you sure?');" href="<c:url value='/event/unregister-${event.id}' />">
                <span class="glyphicon glyphicon-trash"></span></a>
              </td>
				</tr>
			</c:forEach>
		</table>
		<br />
	</div>

</body>
</html>
