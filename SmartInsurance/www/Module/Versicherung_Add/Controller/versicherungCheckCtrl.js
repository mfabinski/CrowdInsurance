appController.controller('versicherungCheckCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, apiendpoint, CacheHistoryReseter){

    /* Weiterleitung auf die Error-Page beim erneuten Laden der Seite */
    if ($stateParams.versicherung == null) {
        CacheHistoryReseter.reset();
        $state.go("app.error", {error: {message: "Fehler beim erneuten Laden der Seite.", status: "404"}});
    } else {
        $scope.versicherung = $stateParams.versicherung;

        $scope.disable = true;

        /* Anlegen der Versicherung und Verweis auf die Abschlussseite */
        $scope.versicherungCheck = function (){
            $http.post(apiendpoint.url + '/api/smartinsurance/versicherung', $scope.versicherung).success(function(response) {
                CacheHistoryReseter.reset();
                $state.go('app.versicherungAdded',{id: response[0].createversicherung});
            });
        }
    }

});
