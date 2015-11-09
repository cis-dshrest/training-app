<!DOCTYPE html>
<html>
<head>
  <title>Reset Account</title>
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
    <a href="/Training/user/resetaccount">Reset Account</a>
    <br>
    <h2>Reset Account</h2>
    <p>
      If you cannot remember your username, password or would like to reset your account password, please contact an admin.
      You can find a <a href="/Training/reports/listAdmins">list of admins here</a>
    </p>
    
  </div>

</body>
</html>