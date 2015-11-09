<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
Game view
Design credit: http://www.sportcalculators.com/bowling-score-calculator
 -->
<html>
<head>
<title>Playing | ${gameTitle }</title>
<!-- javascript and css -->
<%@include file="includes.jsp"%>
<script type="text/javascript"
  src='<c:url value="/resources/core/js/bowlingScoreCalculator.js" />'></script>
<link rel="stylesheet"
  href='<c:url value="/resources/core/css/gameView.css" />' />


</head>
<body>

  <!--  Navigation -->
  <%@include file="navigation.jsp"%>

  <div class="container">
    <br> <br> <a href="<%=request.getContextPath()%>">Home</a>
    > <a href="/Training/user/game/view">Playing Game :
      ${gameTitle }</a> <br>
    <h2>${gameTitle }</h2>
    <hr />

    <!-- Start game window -->
    
    <div class="bowling-calc-buttons-container new-game">
      <input class="btn btn-primary" type="button" name="b-new"
        value="Reset Game" onclick="reset_game()" />
    </div>
    <br><br>
    <div id="gameFinished" class="alert alert-success" style="display: none;"><button id='btnGameFinished' class='btn btn-default btn-lg' ><span class='glyphicon glyphicon-floppy-save'></span></button></div>
    <br>
    <c:forEach items="${players}" var="player">
      <div id="generate-bowling-score-calculator">
        
        <noscript>
          <p>Bowling score calculator requires javascript to be
            enabled to work.</p>
        </noscript>
      
      
        <div id="bowling-calc-container-${player.username}">
          <div class="bowling-calc-score-container">
          <p class="user-info">${player.firstName } ${player.lastName } (${player.username })</p>
          <br>
          <br>
            <table class="bowling-calc-score-table">
            <tr>
              <td class="first score">
                <div class="form-item form-type-textfield form-item-frame1-1">
                    <input type="text" id="edit-frame1-1" name="frame1-1" value="" size="1" maxlength="1" class="form-text" readonly />
                </div>
              </td>
              <td class="second score">
                <div class="form-item form-type-textfield form-item-frame1-2">
                  <input type="text" id="edit-frame1-2" name="frame1-2" value="" size="1" maxlength="1" class="form-text" readonly />
                </div>
              </td>
              <td class="first score">
                <div class="form-item form-type-textfield form-item-frame2-1">
                  <input type="text" id="edit-frame2-1" name="frame2-1" value="" size="1" maxlength="1" class="form-text" readonly />
                </div>
              </td>
              <td class="second score">
                <div class="form-item form-type-textfield form-item-frame2-2">
                  <input type="text" id="edit-frame2-2" name="frame2-2" value="" size="1" maxlength="1" class="form-text" readonly />
                </div>
              </td>
              <td class="first score">
                <div class="form-item form-type-textfield form-item-frame3-1">
                  <input type="text" id="edit-frame3-1" name="frame3-1" value="" size="1" maxlength="1" class="form-text" readonly />
                </div>
              </td>
              <td class="second score">
                  <div class="form-item form-type-textfield form-item-frame3-2">
                    <input type="text" id="edit-frame3-2" name="frame3-2" value="" size="1" maxlength="1" class="form-text" readonly />
                  </div>
              </td>
              <td class="first score">
                  <div class="form-item form-type-textfield form-item-frame4-1">
                    <input type="text" id="edit-frame4-1" name="frame4-1" value="" size="1" maxlength="1" class="form-text" readonly />
                  </div>
              </td>
              <td class="second score">
                  <div class="form-item form-type-textfield form-item-frame4-2">
                    <input type="text" id="edit-frame4-2" name="frame4-2" value="" size="1" maxlength="1" class="form-text" readonly />
                  </div>
              </td>
              <td class="first score">
                  <div class="form-item form-type-textfield form-item-frame5-1">
                    <input type="text" id="edit-frame5-1" name="frame5-1" value="" size="1" maxlength="1" class="form-text" readonly />
                  </div>
              </td>
              <td class="second score">
                  <div class="form-item form-type-textfield form-item-frame5-2">
                    <input type="text" id="edit-frame5-2" name="frame5-2" value="" size="1" maxlength="1" class="form-text" readonly />
                  </div>
              </td>
              <td class="first score">
                  <div class="form-item form-type-textfield form-item-frame6-1">
                    <input type="text" id="edit-frame6-1" name="frame6-1" value="" size="1" maxlength="1" class="form-text" readonly />
                  </div>
              </td>
              <td class="second score">
                  <div class="form-item form-type-textfield form-item-frame6-2">
                    <input type="text" id="edit-frame6-2" name="frame6-2" value="" size="1" maxlength="1" class="form-text" readonly />
                  </div>
              </td>
              <td class="first score">
                  <div class="form-item form-type-textfield form-item-frame7-1">
                    <input type="text" id="edit-frame7-1" name="frame7-1" value="" size="1" maxlength="1" class="form-text" readonly />
                  </div>
              </td>
              <td class="second score">
                  <div class="form-item form-type-textfield form-item-frame7-2">
                    <input type="text" id="edit-frame7-2" name="frame7-2" value="" size="1" maxlength="1" class="form-text" readonly />
                  </div>
              </td>
              <td class="first score">
                  <div class="form-item form-type-textfield form-item-frame8-1">
                    <input type="text" id="edit-frame8-1" name="frame8-1" value="" size="1" maxlength="1" class="form-text" readonly />
                  </div>
              </td>
              <td class="second score">
                  <div class="form-item form-type-textfield form-item-frame8-2">
                    <input type="text" id="edit-frame8-2" name="frame8-2" value="" size="1" maxlength="1" class="form-text" readonly />
                  </div>
              </td>
              <td class="first score">
                  <div class="form-item form-type-textfield form-item-frame9-1">
                    <input type="text" id="edit-frame9-1" name="frame9-1" value="" size="1" maxlength="1" class="form-text" readonly />
                  </div>
              </td>
              <td class="second score">
                  <div class="form-item form-type-textfield form-item-frame9-2">
                    <input type="text" id="edit-frame9-2" name="frame9-2" value="" size="1" maxlength="1" class="form-text" readonly />
                  </div>
              </td>
              <td class="first score">
                  <div class="form-item form-type-textfield form-item-frame10-1">
                    <input type="text" id="edit-frame10-1" name="frame10-1" value="" size="1" maxlength="1" class="form-text" readonly />
                  </div>
              </td>
              <td class="second score">
                  <div class="form-item form-type-textfield form-item-frame10-2">
                    <input type="text" id="edit-frame10-2" name="frame10-2" value="" size="1" maxlength="1" class="form-text" readonly />
                  </div>
              </td>
              <td class="third score">
                  <div class="form-item form-type-textfield form-item-frame10-3">
                    <input type="text" id="edit-frame10-3" name="frame10-3" value="" size="1" maxlength="1" class="form-text" readonly />
                  </div>
              </td>
              <td rowspan="2" class="game-result">
                  <div class="form-item form-type-textfield form-item-game-result">
                    <input type="text" id="edit-game-result" name="game_result" value="" size="10" maxlength="3" class="form-text" readonly />
                  </div>
              </td>
            </tr>

            <!-- score -->
            <tr>
              <td class="frame score" colspan="2">
                  <div class="form-item form-type-textfield form-item-frame1-res">
                    <input type="text" id="edit-frame1-res" name="frame1-res" value="" size="3" maxlength="3" class="form-text" readonly />
                  </div>
              </td>
              <td class="frame score" colspan="2">
                  <div class="form-item form-type-textfield form-item-frame2-res">
                    <input type="text" id="edit-frame2-res" name="frame2-res" value="" size="3" maxlength="3" class="form-text" readonly />
                  </div>
              </td>
              <td class="frame score" colspan="2">
                  <div class="form-item form-type-textfield form-item-frame3-res">
                    <input type="text" id="edit-frame3-res" name="frame3-res" value="" size="3" maxlength="3" class="form-text" readonly />
                  </div>
              </td>
              <td class="frame score" colspan="2">
                  <div class="form-item form-type-textfield form-item-frame4-res">
                    <input type="text" id="edit-frame4-res" name="frame4-res" value="" size="3" maxlength="3" class="form-text" readonly />
                  </div>
              </td>
              <td class="frame score" colspan="2">
                  <div class="form-item form-type-textfield form-item-frame5-res">
                    <input type="text" id="edit-frame5-res" name="frame5-res" value="" size="3" maxlength="3" class="form-text" readonly />
                  </div>
              </td>
              <td class="frame score" colspan="2">
                  <div class="form-item form-type-textfield form-item-frame6-res">
                    <input type="text" id="edit-frame6-res" name="frame6-res" value="" size="3" maxlength="3" class="form-text" readonly />
                  </div>
              </td>
              <td class="frame score" colspan="2">
                  <div class="form-item form-type-textfield form-item-frame7-res">
                    <input type="text" id="edit-frame7-res" name="frame7-res" value="" size="3" maxlength="3" class="form-text" readonly />
                  </div>
              </td>
              <td class="frame score" colspan="2">
                  <div class="form-item form-type-textfield form-item-frame8-res">
                    <input type="text" id="edit-frame8-res" name="frame8-res" value="" size="3" maxlength="3" class="form-text" readonly />
                  </div>
              </td>
              <td class="frame score" colspan="2">
                  <div class="form-item form-type-textfield form-item-frame9-res">
                    <input type="text" id="edit-frame9-res" name="frame9-res" value="" size="3" maxlength="3" class="form-text" readonly />
                  </div>
              </td>
              <td class="frame score" colspan="3">
                  <div class="form-item form-type-textfield form-item-frame10-res">
                    <input type="text" id="edit-frame10-res" name="frame10-res" value="" size="3" maxlength="3" class="form-text" readonly />
                  </div>
              </td>
            </tr>
          </table>
          </div>
          
          <!-- Buttons -->
          <div id="bowling-calc-buttons-container-${player.username }">
            <table class="bowling-calc-buttons-table"
              style="border-collapse: separate;">
              <tr>
                <td class="bowling-calc-buttons-container"><input type="button" name="b-0" value="0" onclick="calc('0', '${player.username }')" /></td>
                <td class="bowling-calc-buttons-container"><input type="button" name="b-1" value="1" onclick="calc('1', '${player.username }')" /></td>
                <td class="bowling-calc-buttons-container"><input type="button" name="b-2" value="2" onclick="calc('2', '${player.username }')" /></td>
                <td class="bowling-calc-buttons-container"><input type="button" name="b-3" value="3" onclick="calc('3', '${player.username }')" /></td>
                <td class="bowling-calc-buttons-container"><input type="button" name="b-4" value="4" onclick="calc('4', '${player.username }')" /></td>
                <td class="bowling-calc-buttons-container"><input type="button" name="b-5" value="5" onclick="calc('5', '${player.username }')" /></td>
              </tr>
              <tr>
                <td class="bowling-calc-buttons-container"><input type="button" name="b-6" value="6" onclick="calc('6', '${player.username }')" /></td>
                <td class="bowling-calc-buttons-container"><input type="button" name="b-7" value="7" onclick="calc('7', '${player.username }')" /></td>
                <td class="bowling-calc-buttons-container"><input type="button" name="b-8" value="8" onclick="calc('8', '${player.username }')" /></td>
                <td class="bowling-calc-buttons-container"><input type="button" name="b-9" value="9" onclick="calc('9', '${player.username }')" /></td>
                <td class="bowling-calc-buttons-container"><input type="button" name="b-X" value="X" onclick="calc('X', '${player.username }')" /></td>
                <td class="bowling-calc-buttons-container"><input type="button" name="b-/" value="/" disabled onclick="calc('/', '${player.username }')" /></td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </c:forEach>

    <!--  Help module -->
    <br>
    <div id="helpbox">
      <%@include file="help.jsp"%>
    </div>

  </div>

</body>
</html>
