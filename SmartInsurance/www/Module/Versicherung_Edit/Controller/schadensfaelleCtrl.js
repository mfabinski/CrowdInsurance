appController.controller('schadensfaelleCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, datumFormatter, apiendpoint, CacheHistoryReseter){

    $scope.versicherungId = $stateParams.id;


    /* Laden der Versicherung */
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungId).success(function(response) {
         $scope.versicherung = response[0];
    }).error(function(error, status) {
        CacheHistoryReseter.reset();
        $state.go("app.error", {error: {message: error, status: status}});
    });

    /* Laden der Schadensfälle  */
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

    /* Verweis auf die Bearbeiten-Seite  */
    $scope.schadensfallShow = function (id) {

        for (var i = 0; i < $scope.schaeden.length; i++){
            if ($scope.schaeden[i].id == id) {
                $state.go("app.schadensfallMelden", {schaden: $scope.schaeden[i]});
                break;
            }
        }
    };


});
