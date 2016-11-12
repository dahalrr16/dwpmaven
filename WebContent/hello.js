var myApp=angular.module('myDemo', []);
//angular.module('demo', [])
myApp.controller('myHttpGetController', function($scope,$http) {
    $http.get('http://localhost:8080/SpringRestfulWebServicesCRUDExample/country/4').
        then(function(response) {
            $scope.greeting = response.data;
			alert('whats up!!!');
        });
});


//http://localhost:8080/SpringRestfulWebServicesCRUDExample/countries
//http://rest-service.guides.spring.io/greeting
//