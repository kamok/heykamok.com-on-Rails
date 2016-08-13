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
			
			var carousel = {}
			carousel["set1"] = {}
			carousel["set2"] = {}

			var set1 = Object.keys(weatherData.weekly_forecast).slice(0, 4)
			for (i in set1) {
				var key = String(set1[i]);
				var value = weatherData.weekly_forecast[key];
				carousel["set1"][key] = value;
			};

			var set2 = Object.keys(weatherData.weekly_forecast).slice(4, 8)
			for (i in set2) {
				var key = String(set2[i]);
				var value = weatherData.weekly_forecast[key];
				carousel["set2"][key] = value;
			};

			$scope.testing = carousel
		});
	};

	$scope.findWeather = function(locationQuery) {
    fetchWeather(locationQuery);
  };

fetchWeather("Central Park");
}]);