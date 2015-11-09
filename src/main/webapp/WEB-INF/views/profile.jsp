<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <title>Profile</title>
  <!-- javascript and css -->
  <%@include file="includes.jsp"%>
  
  <script>
    $(function() {
        // disable all the input boxes
        $("input, submit").attr("disabled", "disabled");
  
        // add handler to re-enable input boxes on click
        $("#userPrefButton").click(function() {
            $("input").removeAttr("disabled");
            $("#userpref").show();
        });
    });
  </script>
</head>

<body>

  <!--  Navigation -->
  <%@include file="navigation.jsp"%>

  <div class="container">

    <br> <br> <a href="<%=request.getContextPath()%>">Home</a>
    > <a href="/Training/user/profile">Profile</a> <br>

    <c:if test="${realName != null}">
      <h2>Welcome : ${realName} !</h2>
    </c:if>

    <div class="container">
      <div class="jumbotron">
        <button id="userPrefButton" class="btn btn-default">Edit
          Preferences</button>
        <br>
        <br>
        <div id="userpref" style="display: none;">
          <form:form action="/Training/user/modify" method="POST"
            modelAttribute="user">
            <form:input type="hidden" path="id" name="id" />
            <table>
              <tr>
                <td><label for="firstName">First Name: </label></td>
                <td><form:input path="firstName" id="firstName" /></td>
                <td><form:errors path="firstName" cssClass="error" /></td>
              </tr>

              <tr>
                <td><label for="lastName">Last Name: </label></td>
                <td><form:input path="lastName" id="lastName" /></td>
                <td><form:errors path="lastName" cssClass="error" /></td>
              </tr>

              <tr>
                <td><label for="name">Username: </label></td>
                <td><form:input path="username" id="username" /></td>
                <td><form:errors path="username" cssClass="error" /></td>
              </tr>

              <tr>
                <td><label for="password">Password: </label></td>
                <td><form:input type="password" path="password"
                    id="password" /></td>
                <td><form:errors path="password" cssClass="error" /></td>
              </tr>

              <tr>
                <td><input class="btn btn-warning"
                  type="submit" value="Update" /></td>
              </tr>
              
              <form:input type="hidden" path="role" name="role" />
            </table>
          </form:form>
        </div>

        <br>
        <hr>
        <br>
      </div>
    </div>

    <!--  Help module -->
    <div id="helpbox">
      <%@include file="help.jsp"%>
    </div>


  </div>
</body>
</html>
