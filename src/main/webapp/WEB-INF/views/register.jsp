<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Register</title>
<!-- javascript and css -->
<%@include file="includes.jsp"%>

<style>
  .error {
    color: #ff0200;
  }
</style>
</head>

<body>

  <!--  Navigation -->
  <%@include file="navigation.jsp"%>

  <div class="container">

    <br> <br> <a href="<%=request.getContextPath()%>">Home</a>
    > <a href="/Training/register">Register</a> <br>

    <br>

    <!-- Register -->
    <!-- ---------------------------------------------------------------------------------------------------- -->
    <form:form class="form-horizontal" action="/Training/register" method="POST" modelAttribute="user">
      <fieldset>
        <div id="legend">Register</div>
        
        <form:input type="hidden" path="id" name="id"/>

        <div class="form-group">
          <!-- First Name -->
          <label class="control-label col-xs-2" for="firstName">First Name: </label>
          <div class="col-xs-4">
            <form:input class="form-control" type="text" path="firstName" id="firstName"/>
            <form:errors class="form-control" path="firstName" cssClass="error" />
          </div>
        </div>
        
        <div class="form-group">
          <!-- Last Name -->
          <label class="control-label col-xs-2" for="lastName">Last Name: </label>
          <div class="col-xs-4">
            <form:input class="form-control" type="text" path="lastName" id="lastName" />
            <form:errors path="lastName" cssClass="error" />
          </div>
        </div>
        
        <div class="form-group">
          <!-- Username -->
          <label class="control-label col-xs-2" for="name">Username: </label>
          <div class="col-xs-4">
            <form:input class="form-control" type="text" path="username" id="username" />
            <form:errors path="username" cssClass="error" />
          </div>
        </div>

        <div class="form-group">
          <!-- Username -->
          <label class="control-label col-xs-2" for="password">Password: </label>
          <div class="col-xs-4">
            <form:input class="form-control" type="password" path="password" id="password" />
            <form:errors path="password" cssClass="error" />
          </div>
        </div>
        
        <div class="form-group">
          <div class="col-xs-offset-2 col-xs-10">
            <input class="btn btn-primary" type="submit" value="Register" />
          </div>
        </div>

      </fieldset>

    </form:form>

  </div>
</body>
</html>