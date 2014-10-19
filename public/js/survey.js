
all_option_buttons = $(".option_button")



$(document).ready(function(){

	// function add_option_button(target){
	// 	var choice = $('<input type="text" name="choice" placeholder="Option">');
	// 	target.before( choice);
	// }

	// // all_option_buttons = $(".option_button")

	// $(".option_button").on("click", function(event){
	// 	add_option_button($(event.target));
	// });


	function add_option_button(target){
		var choice = $('<input type="text" name="choice" placeholder="Option">');
		target.before( choice);
	}

	// all_option_buttons = $(".option_button")


	$(".question_button").click(function(){
			var question = $('<div class="question"><textarea name="question" class="question" placeholder="Type your question here"></textarea><input type="text" name="choice" class="option_field" placeholder="Option"><input type="text" name="choice" class="option_field" placeholder="Option"><input type="button" class="option_button" value="Add option"></div>');

			$( this ).before(question);
			// all_option_buttons = $(".option_button")
	});

	$(".question").on("click",".option_button",function(){
		add_option_button($(this));
	});


	
	$( "form" ).on( "submit", function( event ) {	
	  event.preventDefault();
	  var survey_data = $(this).serializeArray();
	  $.ajax({
	  	url: '/',
	  	type: "POST",
	  	data: survey_data,
	  	dataType: "JSON",
	  	success: function(){
	  		console.log("in success");
	  		console.log(survey_data);	  		
	  	}

	  });
	});




});