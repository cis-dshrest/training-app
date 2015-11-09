<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css" scoped>
nav>ul { list-style-type:none;
    margin: 0;
    padding: 0;
  }
  
nav ul>li {
    display: inline;
}

.navbar-collapse.collapse {
  display: block!important;
}

.navbar-nav>li, .navbar-nav {
  float: left !important;
}

.navbar-nav.navbar-right:last-child {
  margin-right: -15px !important;
}

.navbar-right {
  float: right!important;
}

</style>

<!-- static navbar -->
<nav class="navbar navbar-default navbar-static-top">
<div class="container">
  <div class="navbar-header">
    <a class="navbar-brand" href="<%=request.getContextPath()%>">LETS</a>
  </div>
  
  <div id="navbar" class="navbar-collapse collapse">
    <ul class="nav navbar-nav">
      
      <li><a href="/Training/about">About</a></li>
      <!--   <li><a href="/Training/reports">Reports</a></li> -->
      <c:choose>
        <c:when test="${sessionScope.role != null}">
          <li><a href="/Training/user/profile">Profile</a></li>
          <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Events <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="/Training/event/register">Register for an Event</a></li>
                <li><a href="/Training/event/list">View Registered Events</a></li>
              </ul>
          </li>
        </c:when>
        <c:otherwise>
          <li><a href="/Training/login">Sign In</a></li>
        </c:otherwise>
      </c:choose>
      <c:if test="${sessionScope.role == 'admin'}">
      
      	<li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin <span class="caret"></span></a>
            <ul class="dropdown-menu">
            	<li class="dropdown-header">Event Management</li>
                <li><a href="/Training/event/new">Create an Event</a></li>
                <li><a href="/Training/event/edit">Edit Events</a></li>
                <li class="dropdown-header">User Management</li>
                <li><a href="/Training/admin/listusers">Edit Users</a></li>
            </ul>
          </li>
      </c:if>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <c:if test="${sessionScope.role != null}">
        <li><a href="/Training/user/logout">Logout</a></li>
      </c:if>
    </ul>
    
  </div>
</div>
</nav>

