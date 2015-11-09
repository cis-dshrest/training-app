<!DOCTYPE html>
<html>
<head>
  <title>About</title>
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
    <a href="/Training/about">About</a>
    <br>
    <hr/>
    <br>
    
    <div id="desc">
      <h2>Training Registration Application</h2><br>
      <p>
        Application where you can track training provided and sign up for classes.
      </p>
    </div>

  
    <br>
    <hr/>
    <br>
    <!--  Help module -->
    <div id="helpbox">
      <%@include file="help.jsp"%>
    </div>

  </div>

</body>
</html>