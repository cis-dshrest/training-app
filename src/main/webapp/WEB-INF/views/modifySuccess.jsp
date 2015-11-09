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
      <strong>Updated!</strong> Go back to 
      <c:if test="${sessionScope.role == 'user'}">
        <a href="<c:url value="/user/profile" />">your profile.</a>
      </c:if>
      <c:if test="${sessionScope.role == 'admin'}">
        <a href="<c:url value="/admin/listusers" />">list of users.</a>
      </c:if>
      
    </div>
    <br>
    

  </div>
</body>
</html>