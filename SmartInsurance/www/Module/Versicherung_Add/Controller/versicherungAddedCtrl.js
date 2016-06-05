appController.controller('versicherungAddedCtrl',function($scope, $http, $state, apiendpoint) {

    // soll beim Versicherung anlegen zurückgesendet werden
    $scope.versicherungId = 103;


    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/'+$scope.versicherungId).success(function(response) {
        $scope.versicherung = response;
        console.log($scope.versicherung);
    });


    $scope.navigate = function (to) {
        switch (to) {
            case "teilen":

                break;
            case "hinzufügen":
                $state.go('app.versicherungAdd');
                break;
            case "Übersicht":
                $state.go('app.uebersicht');
                break;
        };
    }

});
