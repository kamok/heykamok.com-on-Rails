angular
	.module("weatherApp")
  .controller("weatherCtrl", ['$scope','weatherService',
 
function($scope, weatherService) {
	
	function fetchWeather(locationQuery) {
		weatherService.getWeather(locationQuery).then(function(weatherData){
			$scope.currentTemp = weatherData;
			// $scope.currentSummary = weatherData.currently.summary;
			// $scope.todayMax = Math.round(weatherData.daily.data[0].temperatureMax);
			// $scope.todayMin = Math.round(weatherData.daily.data[0].temperatureMin);
			// $scope.forecast = buildForecast(dates, days, maxs, mins, summaries, icon);
		});
	};

	$scope.findWeather = function(locationQuery) {
    fetchWeather(locationQuery);
  };

fetchWeather("Central Park");
}]);