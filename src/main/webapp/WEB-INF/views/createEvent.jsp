<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<title>Create Event</title>
<!-- javascript and css -->
<%@include file="includes.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/core/css/bootstrap-datetimepicker.min.css" />" />

<script type="text/javascript" src="<c:url value="/resources/core/js/bootstrap-datetimepicker.min.js" />" ></script>

<script>
	$(function() {
	    $('.datetimepicker').datetimepicker();
	});
 
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
            <form:errors style="color: red;" path="eventName" cssClass="error" />
          </div>
        </div>
        
        <div class="form-group">
          <!-- Description -->
          <label class="control-label col-xs-2" for="description">Description: </label>
          <div class="col-xs-4">
            <form:input class="form-control" type="text" path="description" id="description" />
            <form:errors style="color: red;" path="description" cssClass="error" />
          </div>
        </div>
        
        <div class="form-group">
          <!-- Location -->
          <label class="control-label col-xs-2" for="location">Location: </label>
          <div class="col-xs-4">
            <form:input class="form-control" type="text" path="location" id="location" />
            <form:errors style="color: red;" path="location" cssClass="error" />
          </div>
        </div>

        <div class="form-group">
          <!-- Start Date -->
          <label class="control-label col-xs-2" for="startDate">Start Date: </label>
          <div class="col-xs-4">
	          <div class="well">
				  <div class="datetimepicker input-append date">
				  	<form:input data-format="yyyy-MM-dd hh:mm:ss" class="form-control" type="text" path="startDate" id="startDate" placeholder="2015-01-14 09:15:00"/>
				    <span class="add-on">
				      <i data-time-icon="glyphicon glyphicon-time" data-date-icon="glyphicon glyphicon-calendar">
				      </i>
				    </span>
				  </div>
				  <form:errors style="color: red;" path="startDate" cssClass="error" /> 
			  </div>
		  </div>
        </div>
        
        <div class="form-group">
          <!-- End Date -->
          <label class="control-label col-xs-2" for="endDate">End Date: </label>
          <div class="col-xs-4">
          <div class="well">
			  <div id="" class="datetimepicker input-append date">
			  	<form:input data-format="yyyy-MM-dd hh:mm:ss" class="form-control" type="text" path="endDate" id="endDate" placeholder="2015-01-14 15:15:00"/>
			    <span class="add-on">
			      <i data-time-icon="glyphicon glyphicon-time" data-date-icon="glyphicon glyphicon-calendar">
			      </i>
			    </span>
			  </div>
			  <form:errors style="color: red;" path="endDate" cssClass="error" /> 
		  </div>
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
    
    <div id="errorMsg" class="alert alert-danger" role="alert" style="display: none;"></div>
  </div>

</body>
</html>