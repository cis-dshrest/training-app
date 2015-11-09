/**
 * helpModule.js
 * 
 * Date Created: 07/17/2015
 */


/**
 * Function to toggle the help Menu.
 * It gets the page title and sends a GET request to the servlet to get
 * the help message.
 */
function expandCollapse(showHide) {
	
	var pageTitle = document.title;
	
	var hideShowDiv = document.getElementById("showHide");
	var label = document.getElementById("expand");
	
	// show it
	if(hideShowDiv.style.display == 'none') {
		label.innerHTML = label.innerHTML.replace("Need Help?", "Hide");
		label.className = "btn btn-danger"
		hideShowDiv.style.display = 'block';
		
		//make ajax call
		var divMessage = $("#helpBody");
		if ($("#helpBody").is(":empty")) {
			$.get("/Training/help?title="+pageTitle, function(data, status) {
				divMessage.text(data);
			});
		}
	}
	
	// hide it
	else {
		label.innerHTML = label.innerHTML.replace("Hide", "Need Help?");
		label.className = "btn btn-primary"
		hideShowDiv.style.display = 'none';
	}
}

