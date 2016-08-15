angular
	.module("weatherApp")
  .controller("weatherCtrl", ['$scope','weatherService',
 
function($scope, weatherService) {
	
	function fetchWeather(locationQuery) {
		weatherService.getWeather(locationQuery).then(function(weatherData){
			console.log(weatherData)
			$scope.currentTemp = Math.round(weatherData.current_temp);
			$scope.address = weatherData.location;
			$scope.currentSummary = weatherData.current_summary;
			$scope.todayMax = Math.round(weatherData.weekly_forecast.day0.max);
			$scope.todayMin = Math.round(weatherData.weekly_forecast.day0.min);
			$scope.forecast = weatherData.weekly_forecast;
		});
	};

	$scope.findWeather = function(locationQuery) {
    fetchWeather(locationQuery);
  };


  $scope.active = 0;

  // var slides = $scope.slides = [];

  // $scope.addSlide = function() {
  //   var newWidth = 600 + slides.length + 1;
  //   slides.push({
  //     image: 'http://lorempixel.com/' + newWidth + '/300',
  //     text: ['Nice image','Awesome photograph','That is so cool','I love that'][slides.length % 4],
  //     id: currIndex++
  //   });
  // };

  // for (var i = 0; i < 4; i++) {
  //   $scope.addSlide();
  // }

fetchWeather("Central Park");
}]);