<!DOCTYPE html>
<html>
<head>
<title>Create Game</title>
<!-- javascript and css -->
<%@include file="includes.jsp"%>


<script>
function validate() {

  var gameTitle = $("#gameTitle").val();

  if (gameTitle.length == 0) {
    $("#emptyTitle").html("Please enter a game title");
    return false;
  }
}
</script>
</head>

<body>

  <!--  Navigation -->
  <%@include file="navigation.jsp"%>

  <div class="container">
    <br> <br> <a href="<%=request.getContextPath()%>">Home</a>
    > <a href="/Training/user/game/new">Create Game</a> <br>
    <!-- New game form -->

    <h4>${username } | Create a New Game</h4>
    <br>

    <form class="" action='<c:url value="/user/game/view" />'
      onsubmit="return validate()" method="GET">

      <!-- Game Title -->
      <div>
        <label class=" " for="gameTitle">Game Title: </label>
        <input class=" " type="text" id="gameTitle" name="gameTitle"/>
        <div id="emptyTitle" style="color: red"></div>
      </div>
      <br>
      <h5>Add other players:</h5>
      <br>
      <!-- List of users to add -->
      <table class="table">
        <tr>
          <td>First Name</td>
          <td>Last Name</td>
          <td>Username</td>
          <td>Add</td>
        </tr>
        <c:forEach items="${users}" var="user">
          <tr>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.username}</td>
            <td><input type="checkbox" name="addUser"
              value="${user.username }"> <span
              class="glyphicon glyphicon-user"></span></td>
          </tr>
        </c:forEach>
      </table>
      
      <input class="btn btn-success" type="submit"  value="Play" />
    </form>
    <!-- End new game form -->
    <br><br>
    <!--  Help module -->
    <div id="helpbox">
      <%@include file="help.jsp"%>
    </div>
  </div>

</body>
</html>