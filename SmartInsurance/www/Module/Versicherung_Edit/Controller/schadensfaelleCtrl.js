appController.controller('schadensfaelleCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, datumFormatter, apiendpoint){

    $scope.versicherungId = $stateParams.id;

    

    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungId).success(function(response) {
         $scope.versicherung = response[0];
    });


    $http.get(apiendpoint.url + '/api/smartinsurance/schadensfaelle/' + $scope.versicherungId).success(function(response) {
        if(angular.isDefined(response[0])){
            $scope.schaeden = response;
            for (var i=0;i<$scope.schaeden.length;i++) {
                $scope.schaeden[i].zeitpunkt = datumFormatter.formatDatum($scope.schaeden[i].zeitpunkt);
            }
            $scope.noSchaden = false;
        } else {
           $scope.noSchaden = true; 
        }
    });


    $scope.schadensfallShow = function (id) {
        // eigene ID muss bekannt sein
        if(true) {
            for (var i = 0; i < $scope.schaeden.length; i++){
                if ($scope.schaeden[i].id == id) {
                    $state.go("app.schadensfallMelden", {schaden: $scope.schaeden[i]});
                    break;
                };
            };
        }
    };


});
