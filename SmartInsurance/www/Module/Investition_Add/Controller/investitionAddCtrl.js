appController.controller('investitionAddCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, checkCurrencyFormat, apiendpoint){

    $scope.versicherungID = $stateParams.id;

    $scope.submitted = false;

    /* Laden der Versicherung */
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungID).success(function(response) {
        $scope.versicherung = response[0];
    });

    /* Erstellung eines Investitionsobjekts */
    $scope.investition = {
        versicherungID: $stateParams.id,
        investitionshoehe:""
    };

    /* Laden des bereits gedeckten Betrags */
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungID + '/invest')
        .success(function(response) {
            if(angular.isDefined(response[0])) {
                $scope.investitionBetrag = response[0].suminvestition;
            } else {
                $scope.investitionBetrag = "0,00 €";
            }
        });

    /* Regex für die Währung wird als Service geholt */
    $scope.checkCurrency = checkCurrencyFormat;

    /* Validierung der Felder */
    $scope.isNaN = function(field) {
        return (field.$error.required || field.$error.pattern) && (field.$touched || $scope.submitted);
    };

    /* Berechnung der Rendite */
    $scope.calculateRendite = function(field) {
        var gesamtbetrag = 0;
        if($scope.investition.investitionshoehe != "" && angular.isDefined($scope.versicherung) && !(field.$error.pattern)){
            var monatsbeitrag = moneyParser.moneyparsen($scope.versicherung.beitrag);
            var investitionshoehe = moneyParser.moneyparsen($scope.investition.investitionshoehe);
            var versicherungshoehe = moneyParser.moneyparsen($scope.versicherung.versicherungshoehe);
            gesamtbetrag = monatsbeitrag * investitionshoehe /versicherungshoehe;
        }
        $scope.rendite = moneyFormatter.formatMoney(gesamtbetrag);
    };

    /* Link zu Überprüfungsseite */
    $scope.save = function(form) {

        $scope.submitted = true;
        if (form.$valid) {
            $scope.investition.investitionshoehe = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.investition.investitionshoehe));
            $state.go('app.investitionCheck',{investition: $scope.investition});
        }
    }

});
