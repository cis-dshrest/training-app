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
    > <a href="/Training/event/new">Create Event</a> <br>
    <!-- New game form -->

    <h4>${username } | Create a New Event</h4>
    <br>
    <form:form class="form-horizontal" action="/Training/event/new" method="POST" modelAttribute="event"
    	onsubmit="return validate()">
      <fieldset>
        <div id="legend">Create Event</div>
        
        <form:input type="hidden" path="id" name="id"/>

        <div class="form-group">
          <!-- Event Name -->
          <label class="control-label col-xs-2" for="eventName">Event Name: </label>
          <div class="col-xs-4">
            <form:input class="form-control" type="text" path="eventName" id="eventName"/>
            <form:errors path="eventName" cssClass="error" />
          </div>
        </div>
        
        <div class="form-group">
          <!-- Description -->
          <label class="control-label col-xs-2" for="description">Description: </label>
          <div class="col-xs-4">
            <form:input class="form-control" type="text" path="description" id="description" />
            <form:errors path="description" cssClass="error" />
          </div>
        </div>
        
        <div class="form-group">
          <!-- Location -->
          <label class="control-label col-xs-2" for="location">Location: </label>
          <div class="col-xs-4">
            <form:input class="form-control" type="text" path="location" id="location" />
            <form:errors path="location" cssClass="error" />
          </div>
        </div>

        <div class="form-group">
          <!-- Start Date -->
          <label class="control-label col-xs-2" for="startDate">Start Date: </label>
          <div class="col-xs-4">
            <form:input class="form-control" type="text" path="startDate" id="startDate" value="${dateString}" placeholder="YYYY-MM-DD HH:mm:ss"/>
            <form:errors path="startDate" cssClass="error" />
          </div>
        </div>
        
        <div class="form-group">
          <!-- End Date -->
          <label class="control-label col-xs-2" for="endDate">End Date: </label>
          <div class="col-xs-4">
            <form:input class="form-control" type="text" path="endDate" id="endDate" placeholder="YYYY-MM-DD HH:mm:ss"/>
            <form:errors path="endDate" cssClass="error" />
          </div>
        </div> 
        
        <div class="form-group">
          <div class="col-xs-offset-2 col-xs-10">
            <input class="btn btn-primary" type="submit" value="Create Event" />
          </div>
        </div>

      </fieldset>

    </form:form>
    <br><br>
    
    <div id="errorMsg" class="alert alert-danger" role="alert" hidden></div>
  </div>

</body>
</html>