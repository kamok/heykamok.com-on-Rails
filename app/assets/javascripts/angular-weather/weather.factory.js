angular
	.module("weatherApp")
	.factory('weatherService', ['$http', '$q', 
	
function ($http, $q) {
  var getWeather = function(query) {
  	var deferred = $q.defer();
    var locationQuery = {}
    locationQuery["location_query"] = query;
    $http.post('/weather', locationQuery )
      .success(function(data){
        deferred.resolve(data);
      })
      .error(function(err){
        console.log('Error retrieving data.');
        deferred.reject(err);
      });
    return deferred.promise;
  };

	return {
 		getWeather: getWeather
	};
	
}]);