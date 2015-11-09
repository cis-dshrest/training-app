<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="sec"
  uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <title>Sign In</title>
  <!-- javascript and css -->
  <%@include file="includes.jsp"%>
</head>

<body>

  <!--  Navigation -->
  <%@include file="navigation.jsp"%>
  
  <div class="container">
  
    <br>
    <br>
    <a href="<%=request.getContextPath()%>">Home</a> >
    <a href="/Training/login">Sign In</a>
    <br>
    <h2>Sign In</h2>
    
    <br>
    
    
    <!-- Sign in -->
    <!-- ---------------------------------------------------------------------------------------------------- -->
    
    <!--  alert message -->
    <div class="alert alert-danger center" style="display: ${errorMsg}; " role="alert">
      <strong>${errorLogin}</strong>
    </div>
    <form name='loginForm' class='form-signin'
		  action="/Training/user/login" method='POST'>
      <h2 class="form-signin-heading">Please sign in</h2>
      
      <label for="inputUsername" class="sr-only">Username</label>
      <input type="text" class="form-control" name="username" placeholder="Username" required autofocus/>
      
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" class="form-control" name="password" placeholder="Password" required/>
      <input type="submit" class="btn btn-lg btn-primary" value="Sign In" />
      <br>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
    
    <div class="center">
    <a href="/Training/user/resetaccount">Can't access your account?</a>
    <br>
    <br>
    <a href="<c:url value="/register" />">Register</a>
    </div>
    <!-- ---------------------------------------------------------------------------------------------------- -->
    
    <!--  Help module -->
    <div id="helpbox" class="center">
      <%@include file="help.jsp"%>
    </div>
    <!-- ---------------------------------------------------------------------------------------------------- -->
    
  </div>
</body>
</html>