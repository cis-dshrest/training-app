<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<title>Create Game</title>
<!-- javascript and css -->
<%@include file="includes.jsp"%>


<script>
	function validate() {
		var date1 = $("#startDate").val();
		var date2 = $("#endDate").val();
		var pattern = /\d{4}-\d{2}-\d{2}\s\d{2}\:\d{2}\:\d{2}/;
		if (pattern.test(date1) && pattern.test(date2)) {
			return true;
		}
		$("#errorMsg").text("Date Invalid. Please retry");
		$("#errorMsg").show();
		return false;
	}
</script>
</head>

<body>

  <!--  Navigation -->
  <%@include file="navigation.jsp"%>

  <div class="container">
    <br> <br> <a href="<%=request.getContextPath()%>">Home</a>
    > <a href="/Training/event/edit">Edit Event</a> <br>
    <!-- New game form -->

    <h4>${username } | Edit Event</h4>
    <br>
    <table class="table">
      <tr id="listTitleRow">
        <td>Event Name</td><td>Description</td><td>Location</td><td>Start Date</td><td>End Date</td><td></td>
      </tr>
      <c:forEach items="${events}" var="event">
        <tr>
          <td>${event.eventName}</td>
          <td>${event.description}</td>
          <td>${event.location}</td>
          <td>${event.startDate}</td>
          <td>${event.endDate}</td>
          <td><a onclick="return confirm('Are you sure?');" href="<c:url value='/event/delete-${event.id}' />">
          	<span class="glyphicon glyphicon-trash"></span></a>
          </td>
        </tr>
      </c:forEach>
    </table>
    <br><br>
    
    <div id="errorMsg" class="alert alert-danger" role="alert" style="display:none"></div>
  </div>

</body>
</html>