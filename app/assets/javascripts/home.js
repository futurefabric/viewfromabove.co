

if($(window).width() >= 900) {

	// close modal on scroll
	$(window).scroll(function() {
		$(".modal").hide();
	});

	// close modal when clicked
	$(".modal").click(function(e) {
		$(this).hide();
	});

	$(".iss_photo").each(function(n) {
		$(this).click(function() {
			if($(window).width() >= 900) {

				$(".modal img").attr("src", $(this).attr("data-large-src"));
				//var width = $(".modal img").width;
				//var height = $(".modal img").height;
				//var w_offset = (width/2) * -1;
				//var h_offset = (height/2) * -1;
				//$(".modal img").css({ "margin-top": "" + h_offset + "px", "margin-left": "" + w_offset + "px" });
				//console.log(width);
				$(".modal").show();
			}
		});
	});

}