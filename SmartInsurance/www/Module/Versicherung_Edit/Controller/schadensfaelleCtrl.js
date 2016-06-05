appController.controller('schadensfaelleCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, apiendpoint){

    $scope.versicherungId = $stateParams.id;

    $scope.noSchaden = true;

    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungId).success(function(response) {
         $scope.versicherung = response[0];
    });


    $http.get(apiendpoint.url + '/api/smartinsurance/schadensfaelle/' + $scope.versicherungId).success(function(response) {
         $scope.schaeden = response;
         $scope.noSchaden = false;

    });


    $scope.schadensfallShow = function () {
        // Verweis auf Schadensfall bearbeiten
    }


});
