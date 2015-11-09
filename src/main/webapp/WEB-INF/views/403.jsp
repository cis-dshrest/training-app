<html>
<head>
  <title>403</title>
  <!-- javascript and css -->
  <%@include file="includes.jsp"%>
</head>

<body>

  <!--  Navigation -->
  <%@include file="navigation.jsp"%>

  <div class="container">
    <br>
    <br>
    <div class="alert alert-warning" role="alert">
      <p>${errorMsg }</p>
      <strong>Sorry, you don't have access to this page. <a href="<%=request.getContextPath()%>">Return to the homepage.</a></strong>
    </div>
       
  </div>

</body>
</html>