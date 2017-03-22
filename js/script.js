$(document).ready(function() {
/*
 * Contains all Javascript/jQuery for the noneverything site.
 */


/*
 * Trigger actions when the browser window is resized.
 */
$(window).resize(function() {
    slideMenu();
});


/*
 * Enable a resonsive drop-down menu for narrow width screen sizes.
 */
function slideMenu() {

    // Return menu to normal expanded state.
    $(".sidebar .contents").remove();
    $(".post-button").off("click.list");
    $(".sidebar dl").show();

    // Convert to a drop-down menu if in single column mode.
    if( $(window).width() < 960 ) {

        // Hide the contents list.
        var sidebar  = $(".sidebar");
        var list = sidebar.find("dl");
        list.hide();
        
        // Add the "Contents" element.
        var contentsButton = document.createElement("h2");
        $(contentsButton).addClass("contents").text("Contents");
        sidebar.prepend(contentsButton);
        
        $(".post-button, .contents").on("click.list", function() {
            list.slideToggle();
        });
    }
}
slideMenu();


var baseUrl = window.location.pathname.replace("index.html", "");
$.ajaxSetup({ cache: false });

/*
 * Display post and change url when an item is clicked.

$(".post-button").click(function(event) {
    event.preventDefault();
    $(".post-button").removeClass("active");
    $(this).addClass("active");
	var href = baseUrl + $(this).attr("href");
	window.history.pushState(null, $(this).text(), href);
	displayPost();
});
 */

/*
 * Load post corresponding to address bar.

window.onpopstate = function() {
	console.log("hey");
	displayPost();
}
displayPost(window.location.pathname); //reqd on intial page load in FF, causes duplicate in chrome :(
 */

/*
 * Display contents of a file as a post.
 *
 * string: "path/to/filename"
 */
function displayPost() {

	var path = window.location.pathname;
	
   // if(path == baseUrl + "index.html") {
		path = baseUrl + "/posts/hello.html";
//	}
		
	$("#post").fadeOut(50, 0.0, function() {
		$(this).load(path+'?_ajax=1', function(response, status, xhr) {
		
			if (status == "error") {
				var msg = "Sorry but there was an error: ";
				console.log(msg + xhr.status + " " + xhr.statusText);
			}
			else {
				$(this).fadeIn(100).find("a img").click(function(event) {

					// This is the point at which I should be creating a PostContent
					// object, then using a constructor instead of all of these
					// chained functions.

					enlargeImage(event, this);
				});
			}
		});
	});
}
displayPost();

function enlargeImage(event, element) {
	
	event.preventDefault();
	$(element)
		.animate({"max-width": ($(document).width() * .7) + "px"}, 500)
		.unbind("click")
		.click(function(event) {
			shrinkImage(event, element);
		});
}


function shrinkImage(event, element) {
	
	event.preventDefault();
	$(element)
		.animate({"max-width": "100%"}, 500)
		.unbind("click")
		.click(function(event) {
			enlargeImage(event, element);
		});
}


/*
 * Display Branch discussion related to visible post.
 * Be sure to include the data-branch-embedid from Branch embed script
 * as an attribute of the posts sidebar link.

function displayBranchComments(id) {
	$("#branch").empty();
	var script = document.createElement( "script" );
	script.type = "text/javascript";
	script.src = "http://embed-script.branch.com/assets/embed/embed.m.js?body=0";
	script.setAttribute("data-branch-embedid", $("#"+id).attr("data-branch-embedid"));
	document.getElementById("branch").appendChild(script);
} */


});
