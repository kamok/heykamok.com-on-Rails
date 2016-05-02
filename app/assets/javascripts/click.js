$(function() {
	$("table#random_table tr td").click(function() {
		var td = $(this);
		$.ajax({
			url: "/get-hex",
			method: "GET",

			success: function(response) {
				var hex = response["code"]
				td.html(hex)

				td.css({
					'background-color': hex
				});

				console.log(td);
			},
			error: function(response) {
				console.log("ERROR");
			}
		});
	});
});