appController.controller('versicherungAddedCtrl',function($scope, $http, $state, $stateParams, apiendpoint, CacheHistoryReseter) {

    $scope.versicherungId = $stateParams.id;

    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/'+$scope.versicherungId).success(function(response) {
        $scope.versicherung = response[0];
    });


    $scope.navigate = function (to) {
        CacheHistoryReseter.reset();
        switch (to) {
            case "teilen":
                // Facebook
                break;
            case "hinzufügen":
                $state.go('app.versicherungAdd');
                break;
            case "Übersicht":
                $state.go('app.uebersicht');
                break;
        }
    };

});
