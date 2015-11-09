<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Reports</title>
<!-- javascript and css -->
<%@include file="includes.jsp"%>

<script type="text/javascript" src="<c:url value="/resources/core/js/prettyprint.js" />" ></script>

<script>
$(document).ready(function() {

  var fmtFlag = $("#fmtFlag").html();
  if (fmtFlag == "true") {
    var jsonStr = $("#report-body").html();
    var reportJson = JSON.parse(jsonStr);
    var formattedReport = prettyPrint(reportJson);
    $("#report-body").html(formattedReport);
  }

});
</script>
</head>


<body>
  <!--  Navigation -->
  <%@include file="navigation.jsp"%>

  <div class="container">
    <br>
    <br>
    <a href="<%=request.getContextPath()%>">Home</a> >
    <a href="/Training/reports">Reports</a>
    <br>
    <hr/>
    <br>
    <div class="dropdown">
      <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
        Pick a report to view
        <span class="caret"></span>
      </button>
      <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
        <li><a href="/Training/reports/gameScores">Game Scores</a></li>
        <li><a href="/Training/reports/listUsers">List of Registered Users</a></li>
        <li><a href="/Training/reports/listAdmins">List of Admins</a></li>
      </ul>
    </div>
    <br><br>
    
    
    <div id="report-result" style="display: ${display };">
      <div id="fmtFlag" style="display: none;">${fmtFlag }</div>
      <h3 style="text-align: center;"><span class="label label-default">Reports for ${title }</span></h3>
      <br>
      <div id="report-body">
        ${report }
      </div>
    </div>
  </div>
  
  <div class="container">
  </div>
</body>
</html>