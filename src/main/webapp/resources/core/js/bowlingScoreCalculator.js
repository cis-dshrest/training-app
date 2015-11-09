/**
 * bowlingScoreCalculator.js
 * 
 * Calculate scores for a bowling game with 10 frames.
 * A game can have multiple users.
 * Eventually the score will be stored in the database.
 * 
 * @since 08/19/2015
 * 
 */


/////////////////////////////////////////////////////////////////////////////////////////
//
//Global vars initialization

var usernames = [];
var stillPlaying = []; //list of users that haven't finished 10 frames;


// Final structure for storing player.results.
var GameScores = {};
GameScores.players = [];


//Variables set when changing users. @see load_player(username)
var results = [];

//UI controllers
var buttonObjs = null;
var frameObjs = null;

// End Global variable declarations
/////////////////////////////////////////////////////////////////////////////////////////


window.onload = function() {
  
  //Initialize variables.
  init_vars();

  window.onbeforeunload = function (e) {
    e = e || window.event;

    // For IE and Firefox prior to version 4
    if ((stillPlaying.length != 0) && e) {
        e.returnValue = 'Your game scores will be lost.';
    }
  };
    
};



/**
 * Get query arguments with QueryString.var
 */
var QueryString = function () {
  // This function is anonymous, is executed immediately and 
  // the return value is assigned to QueryString!
  var query_string = {};
  var query = window.location.search.substring(1);
  var vars = query.split("&");
  for (var i=0;i<vars.length;i++) {
    var pair = vars[i].split("=");
        // If first entry with this name
    if (typeof query_string[pair[0]] === "undefined") {
      query_string[pair[0]] = decodeURIComponent(pair[1]);
        // If second entry with this name
    } else if (typeof query_string[pair[0]] === "string") {
      var arr = [ query_string[pair[0]],decodeURIComponent(pair[1]) ];
      query_string[pair[0]] = arr;
        // If third or later entry with this name
    } else {
      query_string[pair[0]].push(decodeURIComponent(pair[1]));
    }
  } 
    return query_string;
}();



/**
 * Initialize frame number and throw number for all players.
 */
var init_vars = function () {
  
  usernames = get_usernames();
  
  for(var i = 0; i < usernames.length; i++) {
    var playerUsername = usernames[i];
    
    var player = {};
    player.username = usernames[i];
    player.frame_no = 1;
    player.throw_no = 1;
    
    player.results = [];
    
    GameScores.players.push(player);
  }
    
  stillPlaying = get_usernames();

}


/**
 * Calculates player.results.
 */
function calc(op, username) {

  // Change player and set the variables. 
  var player = load_player(username);
  
  
  // First throw, reset player.results.  
  if (player.throw_no == 1) {
    player.results[player.frame_no] = [];
//    console.log("results: " + player.results[player.frame_no]);
  }
  
  //second throw, enable spare
  else if (player.throw_no == 2) {
    for (var j = 0; j < 10; j++) {
      buttonObjs.find("input[name='b-"+ j +"']").attr("disabled", false);
    }
    buttonObjs.find("input[name='b-/']").attr("disabled", false);
  }
  
  if (op == "1" || op == "2" || op == "3" || op == "4" || op == "5"
    || op == "6" || op == "7" || op == "8" || op == "9" || op == "0") {

    player.results[player.frame_no][player.throw_no] = parseInt(op);
    
    // For each throw, set score in UI and increase throw number.
    // Calculate the result on the 2nd throw.
    if (player.throw_no == 1) {

      frameObjs.find("#edit-frame"+ player.frame_no + "-1").val(op);
      player.throw_no++;
      
      //Disable Strike and enable Spare. Also disable other buttons
      buttonObjs.find("input[name='b-X']").attr("disabled", true);
      buttonObjs.find("input[name='b-/']").attr("disabled", false);
      for (var k = parseInt(10 - op); k < 10; k++) {
        buttonObjs.find("input[name='b-"+k+"']").attr("disabled", true);
      }
    }
    
    else if (player.throw_no == 2) {
      player.results[player.frame_no]['status'] = 'no';
      frameObjs.find("#edit-frame"+ player.frame_no + "-2").val(op);
    
      if (player.frame_no != 10) {
        calculate_frame_result(username, parseInt(player.results[player.frame_no][player.throw_no]
        + player.results[player.frame_no][player.throw_no - 1]));
        player.throw_no--;
        player.frame_no++;
        buttonObjs.find("input[name='b-/']").attr("disabled", true);
        buttonObjs.find("input[name='b-X']").attr("disabled", false);
      }
      
      else {
        if (player.results[player.frame_no]['1'] != 10 ) {
          calculate_frame_result(username, parseInt(parseInt(player.results[player.frame_no][player.throw_no])
              + parseInt(player.results[player.frame_no][player.throw_no - 1])));
          
          end_game(username);
        }
        else {
          player.throw_no++;
        }
      }
    }
    
    else {
      frameObjs.find("#edit-frame" + player.frame_no + "-3").val(op);
      
      calculate_frame_result(username, parseInt(parseInt(player.results[player.frame_no][player.throw_no])
          + parseInt(player.results[player.frame_no][player.throw_no - 1])
          + parseInt(player.results[player.frame_no][player.throw_no - 2])));
      
      if (player.frame_no == 10) {
        end_game(username);
      }
      else {
        player.throw_no = 1;
        player.frame_no++;
        for (var i = 1; i < 10; i++) {
          buttonObjs.find("input[name='b-"+ i +"']").attr("disabled", false);
        }
        buttonObjs.find("input[name='b-X']").attr("disabled", false);
        buttonObjs.find("input[name='b-/']").attr("disabled", true); 
      }
    }
    return;
  }
  
  if (op == "X") {
    
    if (player.frame_no == 10) {
      player.results[player.frame_no][player.throw_no] = '10';
      
      switch(player.throw_no) {
      case 1 :
        frameObjs.find("#edit-frame" + player.frame_no + "-1").val('X');
        break;
      case 2 :
        frameObjs.find("#edit-frame" + player.frame_no + "-2").val('X');
        buttonObjs.find("input[name='b-/']").attr("disabled", true);
        break;
      case 3 :
        frameObjs.find("#edit-frame" + player.frame_no + "-3").val('X');
        calculate_frame_result(username, parseInt(parseInt(player.results[player.frame_no]['1'])
            + parseInt(player.results[player.frame_no]['2'])
            + parseInt(player.results[player.frame_no]['3'])));
        end_game(username);
        break;
      }
      player.throw_no++;
    }
    else {
      player.results[player.frame_no]['status'] = 'X';
      player.results[player.frame_no][player.throw_no] = '10';
      player.results[player.frame_no][player.throw_no + 1] = '';
      calculate_frame_result(username, parseInt(10));
      frameObjs.find("#edit-frame" + player.frame_no + "-1").val('');
      frameObjs.find("#edit-frame" + player.frame_no + "-2").val('X');
      
      player.frame_no++;
      buttonObjs.find("input[name='b-/']").attr("disabled", true);
      
    }

    return;
  }
  
  if (op == "/") {
    
    if (player.frame_no == 10 ) {
      player.results[player.frame_no][player.throw_no] = parseInt(10 - parseInt(player.results[player.frame_no][player.throw_no - 1]));
      
      switch(player.throw_no) {
      case 2 :
        frameObjs.find("#edit-frame" + player.frame_no + "-2").val("/");
        buttonObjs.find("input[name='b-X']").attr("disabled", false);
        buttonObjs.find("input[name='b-/']").attr("disabled", true);
        player.throw_no++;
        break;
      case 3 :
        frameObjs.find("#edit-frame" + player.frame_no + "-3").val("/");
        calculate_frame_result(username, parseInt(parseInt(player.results[player.frame_no]['1'])
            + parseInt(player.results[player.frame_no]['2'])
            + parseInt(player.results[player.frame_no]['3'])));
        end_game(username);
        break;
      }
    }
    
    else {
      player.results[player.frame_no]['status'] = '/';
      player.results[player.frame_no][player.throw_no] = parseInt(10 - player.results[player.frame_no][player.throw_no - 1]);
      calculate_frame_result(username, parseInt(10));
      frameObjs.find("#edit-frame" + player.frame_no + "-2").val("/");
      
      player.frame_no++;
      player.throw_no--;
      buttonObjs.find("input[name='b-X']").attr("disabled", false);
      buttonObjs.find("input[name='b-/']").attr("disabled", true);
    }
    
    return;
  }
}

function calculate_frame_result(username, frame_res) {
  
  //Set player variables
  var player = load_player(username);
  
  
  switch (player.frame_no) {
  case 1 :
    player.results[player.frame_no]['result'] = frame_res;
    break;
  case 2 :
    if (player.results[player.frame_no - 1]['status'] == 'X') {
      player.results[player.frame_no - 1]['result'] = parseInt(player.results[player.frame_no - 1]['result'])
      + frame_res;
    } else if (player.results[player.frame_no - 1]['status'] == '/') {
      player.results[player.frame_no - 1]['result'] = parseInt(player.results[player.frame_no - 1]['result'])
      + parseInt(player.results[player.frame_no]['1']);
    }
    player.results[player.frame_no]['result'] = parseInt(player.results[player.frame_no - 1]['result']
    + frame_res);
    break;
    
  default : 
    if (player.results[player.frame_no - 1]['status'] == 'X') {
      if (player.results[player.frame_no - 2]['status'] == 'X') {
        player.results[player.frame_no - 2]['result'] = parseInt(player.results[player.frame_no - 2]['result'])
            + parseInt(player.results[player.frame_no]['1']);
        player.results[player.frame_no - 1]['result'] = parseInt(player.results[player.frame_no - 1]['result'])
            + parseInt(player.results[player.frame_no]['1']);
      }

      player.results[player.frame_no - 1]['result'] = parseInt(player.results[player.frame_no - 1]['result'])
          + parseInt(player.results[player.frame_no]['1'])
          + (player.results[player.frame_no]['2'] == '' ? parseInt(0)
              : parseInt(player.results[player.frame_no]['2']));
    }

    else if (player.results[player.frame_no - 1]['status'] == '/') {
      player.results[player.frame_no - 1]['result'] = parseInt(player.results[player.frame_no - 1]['result'])
          + parseInt(player.results[player.frame_no]['1']);
    }

    player.results[player.frame_no]['result'] = parseInt(player.results[player.frame_no - 1]['result']
        + frame_res);
    break;
  }
  
  update_frame_result(username);
  return;
}

function update_frame_result(username) {

  var player = load_player(username);
  
  switch (player.frame_no) {
  case 1 :
    frameObjs.find("input[name='frame" + player.frame_no + "-res']")
      .val(player.results[player.frame_no]['result']);
    break;
  case 2 :
    frameObjs.find("input[name='frame" + parseInt(player.frame_no -1) + "-res']")
    .val(player.results[player.frame_no - 1]['result']);
    
    frameObjs.find("input[name='frame" + player.frame_no + "-res']")
    .val(player.results[player.frame_no]['result']);
    break;
  default :
    frameObjs.find("input[name='frame" + parseInt(player.frame_no - 2) + "-res']")
    .val(player.results[player.frame_no - 2]['result']);
  
    frameObjs.find("input[name='frame" + parseInt(player.frame_no - 1) + "-res']")
    .val(player.results[player.frame_no - 1]['result']);
    
    frameObjs.find("input[name='frame" + player.frame_no + "-res']")
    .val(player.results[player.frame_no]['result']);
  break;
  }
  frameObjs.find("input[name='game_result']").val(player.results[player.frame_no]['result']);
  return;
}



function disable_other_players(username) {
  
  for (var i = 0; i < usernames.length; i++) {
    if (usernames[i] !== username) {
      var buttonObjs = $("#bowling-calc-buttons-container-" + usernames[i]);
      for (var j = 0; j < 10; j++) {
        buttonObjs.find("input[name='b-"+j+"']").attr("disabled", true);
      }
      buttonObjs.find("input[name='b-X']").attr("disabled", true);
      buttonObjs.find("input[name='b-/']").attr("disabled", true);
 
    }
  }
}

function enable_players() {

  for (var i = 0; i < usernames.length; i++) {
    var buttonObjs = $("#bowling-calc-buttons-container-" + usernames[i]);
    for (var j = 0; j < 10; j++) {
      
      if (finished[usernames[i]] == false) {
        buttonObjs.find("input[name='b-"+j+"']").attr("disabled", false);
      }
      
    }
    buttonObjs.find("input[name='b-X']").attr("disabled", false);
    buttonObjs.find("input[name='b-/']").attr("disabled", true);
  }
}

function get_usernames() {

  var usernames = [];
  
  var playerHTMLObjs = $("p.user-info");
  var re = /\(([^)]+)\)/;
  
  for(var i = 0; i < playerHTMLObjs.length; i++) {
    var playerUsername = playerHTMLObjs[i].innerHTML;
    playerUsername = (re.exec(playerUsername))[1];
    usernames.push(playerUsername);
  }
  
  return usernames;
}

function reset_game() {
  
  location.reload(); 
  
}


/**
 * Show a message when all players finish their games and let 
 * the players save the scores if they wish to do so.
 * 
 * @param username
 */
function end_game(username) {
  var buttonObjs = $("#bowling-calc-buttons-container-" + username);
  
  for (var i = 0; i < 10; i++) {
    buttonObjs.find("input[name='b-"+i+"']").attr("disabled", true);
  }
  
  buttonObjs.find("input[name='b-X']").attr("disabled", true);
  buttonObjs.find("input[name='b-/']").attr("disabled", true);
  
  
  //defining indexOf for ie8 because it doesn't have it..
  //very lame
  if (!Array.prototype.indexOf)
  {
    Array.prototype.indexOf = function(elt /*, from*/)
    {
      var len = this.length >>> 0;

      var from = Number(arguments[1]) || 0;
      from = (from < 0)
           ? Math.ceil(from)
           : Math.floor(from);
      if (from < 0)
        from += len;

      for (; from < len; from++)
      {
        if (from in this &&
            this[from] === elt)
          return from;
      }
      return -1;
    };
  }
  //remove player from ongoing games since their game is over
  var index = stillPlaying.indexOf(username);
  stillPlaying.splice(index, 1);
  
  
  //if all games are over, show a message and send result over to server.
  if (stillPlaying.length == 0 ) {
    $("#gameFinished").show();
    var oldmsg = $("#gameFinished").html();
    
    
    //If there is more than one player, get the winner. 
    //Look at get_winner() to get the actual winner. 
    if (usernames.length > 1) {
      var winner = usernames[0]; //get_winner();

      $("#gameFinished").html("<strong>Congratulations " + winner + ". You win! </strong><br>Click the save icon to save your scores. " + oldmsg);
    }
    else {
      $("#gameFinished").html("Game completed. Click the save icon to save your scores. " + oldmsg);
    }

  }
  
  $("#btnGameFinished").click(function() {
    send_results();
  });
  
}

/**
 * Gets the maximum score and returns the username associated with that score
 * 
 * @returns {String}
 */
function get_winner() {
  
  var scores = [];
  for(var i = 0; i < usernames.length; i++) {
    var frameObjs = $("#bowling-calc-container-"+usernames[i]+" .bowling-calc-score-table");
    scores[usernames[i]] = parseInt(frameObjs.find("input[name='game_result']").val());
  }
  
  var max = 0;
  var maxUser = "";
  for (var i = 0; i < usernames.length; i++) {
    if (scores[usernames[i]] >= max) {
      max = scores[usernames[i]];
      maxUser = usernames[i];
      
    }
  }
  
  return maxUser;
}

/**
 * Finds the player object that is bowling with their username.
 * 
 * @param username
 * @returns player object
 */
function load_player(username) {
  
  var player = {};
  for(var i = 0; i < GameScores.players.length; i++) {
    if(GameScores.players[i].username == username) {
      player = GameScores.players[i];
      break;
    }
  }
  
  //Set UI controllers
  buttonObjs = $("#bowling-calc-buttons-container-" + username);
  frameObjs = $("#bowling-calc-container-"+username+" .bowling-calc-score-table");
  
  return player;
}


/**
 * Send results to the server as JSON with ajax request to be saved in a database.
 */
function send_results() {
  
  GameScores.gameTitle = QueryString.gameTitle;
  GameScores.players = [];

  for(var i = 0; i < usernames.length; i++) {
    var frameObjs = $("#bowling-calc-container-"+usernames[i]+" .bowling-calc-score-table");

    var player = {};
    player.username = usernames[i];
    player.frames = [];
    
    for(var j = 1; j <= 9; j++) {
      var frame = {};
      frame.throw_1 = frameObjs.find("#edit-frame" + j + "-1").val();
      frame.throw_2 = frameObjs.find("#edit-frame" + j + "-2").val();
      frame.frame_res = frameObjs.find("input[name='frame" + j + "-res']").val();
      
      player.frames.push(frame);

    }
    
    var frame10 = {};
    frame10.throw_1 = frameObjs.find("#edit-frame10-1").val();
    frame10.throw_2 = frameObjs.find("#edit-frame10-2").val();
    frame10.throw_3 = frameObjs.find("#edit-frame10-3").val();
    frame10.frame_res = frameObjs.find("input[name='frame10-res']").val();
    player.frames.push(frame10);
    
    GameScores.players.push(player);
 
  }
    
  //Make ajax call
  $.ajax({
    type: "POST",
    contentType : 'application/json; charset=utf-8',
    dataType : 'text',
    url: "/Exploration/user/game/saveScore",
    data: JSON.stringify(GameScores), 
    success :function(result) {
//      console.log(result);
      var homeurl = window.location.origin;
      
      if(!homeurl) {
        window.location.origin = window.location.protocol + "//" + window.location.hostname + (window.location.port ? ':' + window.location.port: '');
      }

      var reportsUrl = window.location.origin + "/Exploration/reports";
      window.location.replace(reportsUrl);
    }
  });
  
}

