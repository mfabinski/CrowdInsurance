appController.controller('investitionCheckCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, apiendpoint, CacheHistoryReseter){

    /* Weiterleitung auf die Error-Page beim erneuten Laden der Seite */
     if ($stateParams.investition == null) {
        CacheHistoryReseter.reset();
        $state.go("app.error", {error: {message: "Fehler beim erneuten Laden der Seite.", status: "404"}});
    } else {

        $scope.investition = $stateParams.investition;

        $scope.disable = true;

        /* Laden der Versicherung */
        $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.investition.versicherungID).success(function(response) {
            $scope.versicherung = response[0];
        });

        /* Laden des bereits gedeckten Betrages */
        $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.investition.versicherungID + '/invest')
            .success(function(response) {
                if(angular.isDefined(response[0])) {
                    $scope.investitionBetrag = response[0].suminvestition;
                } else {
                    $scope.investitionBetrag = "0,00 €";
                }
            });

        /* Berechnung der Rendite */
        $scope.calculateRendite = function(field) {
            var gesamtbetrag = "0,00 €";
            if(angular.isDefined($scope.versicherung)){
                var monatsbeitrag = moneyParser.moneyparsen($scope.versicherung.beitrag);
                var investitionshoehe = moneyParser.moneyparsen($scope.investition.investitionshoehe);
                var versicherungshoehe = moneyParser.moneyparsen($scope.versicherung.versicherungshoehe);
                gesamtbetrag = monatsbeitrag * investitionshoehe /versicherungshoehe;
            }
            return moneyFormatter.formatMoney(gesamtbetrag);
        };

        /* Senden der Investition an die Datenbank und Weiterleitung auf die InvestitionAdded-Page */
        $scope.addInvestition = function() {

            $http.post(apiendpoint.url + '/api/smartinsurance/investieren', $scope.investition).success(function(data) {
                CacheHistoryReseter.reset();
                $state.go('app.investitionAdded',{id: data[0].createinvestition});
            });
        }
    }
});
