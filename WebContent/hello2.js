var myApp=angular.module('myApp', []);
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

//http://localhost:8080/SpringRestfulWebServicesCRUDExample/countries
//http://rest-service.guides.spring.io/greeting
//
