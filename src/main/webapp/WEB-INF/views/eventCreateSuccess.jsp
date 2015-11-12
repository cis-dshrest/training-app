<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Success</title>
<!-- javascript and css -->
<%@include file="includes.jsp"%>
</head>

<body>

  <!--  Navigation -->
  <%@include file="navigation.jsp"%>

  <div class="container">
   
    <div class="alert alert-success" role="alert">
      <strong>Event Created!</strong> Go back to 
      <c:if test="${sessionScope.role == 'admin'}">
        <a href="<c:url value="/event/register" />">list of events.</a>
      </c:if>
      
    </div>
    <br>
    

  </div>
</body>
</html>