<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<html>
<head>
  <title>Home</title>
  <!-- javascript and css -->
  <%@include file="includes.jsp"%>
  
</head>

<body>
  <!--  Navigation -->
  <%@include file="navigation.jsp"%>
  
  <div class="container">
    <div class="jumbotron">
      <h1>Training Registration</h1>

      <h2>${welcomeMessage}</h2>
      
      <sec:authorize access="hasRole('USER')">
        <!-- For login user -->
        <c:url value="/logout" var="logoutUrl" />
        <form action="${logoutUrl}" method="post" id="logoutForm">
          <input type="hidden" name="${_csrf.parameterName}"
            value="${_csrf.token}" />
        </form>
        <script>
          function formSubmit() {
            document.getElementById("logoutForm").submit();
          }
        </script>
    
        <c:if test="${pageContext.request.userPrincipal.name != null}">
          <h2>
            User : ${pageContext.request.userPrincipal.name} | <a
              href="javascript:formSubmit()"> Logout</a>
          </h2>
        </c:if>
      </sec:authorize>
    
      <!--  Help module -->
      <c:if test="${sessionScope.role == null}">
      	<%@include file="help.jsp"%>
      </c:if>
      
    </div>
  </div>
</body>

</html>