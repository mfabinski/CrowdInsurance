appController.controller('investitionSearchCtrl',function($scope, $http, apiendpoint){

    $http.get(apiendpoint.url + '/api/smartinsurance/investition').success(function(response) {
         $scope.investitionen = response.data;

    });

    $scope.investitionShow = function() {

    }

    $scope.investitionSearch = function() {

    }



})
