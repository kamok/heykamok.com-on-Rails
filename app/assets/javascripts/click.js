
$(function() {
	$("td").click(function() {
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

//var valid = ["a","b","c","d","e","f","1","2","3","4","5","6","7","8","9"]
	//var hex = "#"

	//for (i = 0; i < 6; i++) { 
  // var value = valid[Math.floor(Math.random() * valid.length)];
  // hex = hex.concat(value)
  // console.log(hex)
	//}
