<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <title>Edit Users</title>
  <!-- javascript and css -->
  <%@include file="includes.jsp"%>
  
  <style>
    #listTitleRow:first-child{
      font-weight: bold;
      background-color: #C6C9C4;
    }
    
  </style>
  
  <script>
    function deleteUser(username) {
      var result = confirm("Are you sure?");
      if (result) {
    	  window.location.replace("");
      }
    }

  </script>
</head>

<body>

  <!--  Navigation -->
  <%@include file="navigation.jsp"%>

  <div class="container">

    <br> <br> <a href="<%=request.getContextPath()%>">Home</a>
    > <a href="/Training/admin/listusers">List Users</a> <br>
    
    <br/>
    
    <table class="table">
      <tr id="listTitleRow">
        <td>First Name</td><td>Last Name</td><td>Username</td><td>Password</td><td>role</td><td>Active?</td><td></td>
      </tr>
      <c:forEach items="${users}" var="user">
        <tr>
          <td>${user.firstName}</td>
          <td>${user.lastName}</td>
          
          <td><a href="<c:url value='/admin/edit-${user.username}-user' />">${user.username} <span class="glyphicon glyphicon-pencil"></span></a></td>
          <td>${user.password}</td>
          <td>${user.role}</td>
          <td>${user.isActive}</td>
          
          <c:choose>
            <c:when test="${user.role == 'USER'}">
              <td><a onclick="return confirm('Are you sure?');" href="<c:url value='/admin/delete-${user.username}-user' />">
                <span class="glyphicon glyphicon-trash"></span></a>
              </td>
            </c:when>
            <c:otherwise>
              <td></td>
            </c:otherwise>
          </c:choose>
         
          
        </tr>
      </c:forEach>
    </table>
    <br />
    
    <!--  Help module -->
    <div id="helpbox">
      <%@include file="help.jsp"%>
    </div>


  </div>

</body>
</html>
