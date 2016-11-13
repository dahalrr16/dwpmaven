var myApp=angular.module('myApp', []);

myApp.config(function ($httpProvider) {
  $httpProvider.defaults.headers.common = {};
  $httpProvider.defaults.headers.post = {};
  $httpProvider.defaults.headers.put = {};
  $httpProvider.defaults.headers.patch = {};
});

//angular.module('demo', [])
myApp.controller('myHttpGetController', function($scope,$http) {
 //$scope.keyword = '';
 
   $scope.GetAllData = function () {
            $http.get('http://localhost:8080/SpringRestfulWebServicesCRUDExample/country/1')
            .success(function (data, status, headers, config) {
		//	var keyword='';
                var keyword = data;
				 $scope.Details = data;
				//alert('countryId    '+Details.id);
				
				
            })
            .error(function (data, status, header, config) {
                $scope.ResponseDetails = "Data: " + data +
                    "<br />status: " + status +
                    "<br />headers: " + jsonFilter(header) +
                    "<br />config: " + jsonFilter(config);
            });
        };
 
 
   
});

myApp.controller('myHttpGetController2', function($scope,$http) {
 //$scope.keyword = '';
 
   $scope.GetAllData2 = function () {
            $http.get('http://localhost:8080/SpringRestfulWebServicesCRUDExample/country/2')
            .success(function (data, status, headers, config) {
		//	var keyword='';
                var keyword = data;
				 $scope.Details = data;
				//alert('countryId    '+Details.id);
				
				
            })
            .error(function (data, status, header, config) {
                $scope.ResponseDetails = "Data: " + data +
                    "<br />status: " + status +
                    "<br />headers: " + jsonFilter(header) +
                    "<br />config: " + jsonFilter(config);
            });
        };
		});
 
 
 // http post controller
 
 myApp.controller('myHttpPostController', function($scope,$http) {
 
   $scope.sendData = function () {   
   alert("send data");
   
    /*   var data = $.param({
                id: $scope.id,
                countryName: $scope.countryName,
				population: $scope.population
            });
		*/	
			var data = JSON.stringify({
                "id": $scope.id,
                "countryName": $scope.countryName,
				"population": $scope.population
            });
        
            var config = {
               headers : {
                    'Content-Type': 'application/json;charset=utf-8;'
                }
            };
    
   //  $http.defaults.headers.post['Content-Type'] = 'application/json;charset=utf-8';
	  
            $http.post('http://localhost:8080/SpringRestfulWebServicesCRUDExample/countries', data, config)
            .success(function (data, status, headers, config) {
			$scope.PostDataResponse = data;
		//	var keyword='';
                var keyword = data;
				 $scope.Details = data;
				//alert('countryId    '+Details.id);
				
				
            })
            .error(function (data, status, header, config) {
			alert("error");
              /*$scope.ResponseDetails = "Data: " + data +
                    "<br />status: " + status +
                    "<br />headers: " + jsonFilter(header) +
                    "<br />config: " + jsonFilter(config);
					*/
            });
			
        };
 
   
});

/*
myApp.controller('myHttpPostController', function($scope,$http) {
 
   $scope.PostAllData = function () {
   
    // use $.param jQuery function to serialize data from JSON 
            var data = $.param({
                id: $scope.id,
                countryName: $scope.countryName,
				population: $scope.population
            });
        
            var config = {
                headers : {
                    'Content-Type': 'application/json;'
                }
            };
      $http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
            $http.post('http://localhost:8080/SpringRestfulWebServicesCRUDExample/countries', data, config)
            .success(function (data, status, headers, config) {
			$scope.PostDataResponse = data;
		//	var keyword='';
                var keyword = data;
				 $scope.Details = data;
				//alert('countryId    '+Details.id);
				
				
            })
            .error(function (data, status, header, config) {
                $scope.ResponseDetails = "Data: " + data +
                    "<br />status: " + status +
                    "<br />headers: " + jsonFilter(header) +
                    "<br />config: " + jsonFilter(config);
            });
        };
 
   
});
*/
//http://localhost:8080/SpringRestfulWebServicesCRUDExample/countries
//http://rest-service.guides.spring.io/greeting
//
