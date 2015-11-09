<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Register</title>
<!-- javascript and css -->
<%@include file="includes.jsp"%>
</head>

<body>

  <!--  Navigation -->
  <%@include file="navigation.jsp"%>

  <div class="container">
   
    <div class="alert alert-success" role="alert">
      <strong>Registration successful!</strong> Please <a href="<c:url value="/login" />">Sign in here.</a>
    </div>
    <br>
    

  </div>
</body>
</html>