appController.controller('uebersichtCtrl', function($scope, $http, $state, moneyParser, moneyFormatter, apiendpoint, Status){


    $scope.versicherungen= [];
    $scope.investitionen = [];

    $scope.noVersicherung = true;
    $scope.noInvestition = true;

    /* Laden aller Versicherungen der Person */
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung').success(function(response) {
        $scope.versicherungen = Status.versicherung(response);

        $scope.noVersicherung = false;      


    });

    /* Laden aller Investitionen der Person */
    $http.get(apiendpoint.url + '/api/smartinsurance/investition').success(function(response) {
        $scope.investitionen = Status.investition(response);
        $scope.noInvestition = false;
    });

    /* Link zu Detailseite einer Versicherung */
    $scope.versicherungShow = function(id) {
        $state.go("app.versicherungDetail",{id: id});
    };

    /* Link zu Detailseite einer Investition */
    $scope.investitionShow = function(id) {
        $state.go("app.investitionDetail",{id: id});
    };

    /* Berechnung des gesamten Versicherungsvolumens der Person */
    $scope.versicherungengesamt = function() {
        var gesamtbetrag=0;
        var versicherungshoehe = 0;
        for (var i = 0; i < $scope.versicherungen.length; i++){
            versicherungshoehe = moneyParser.moneyparsen($scope.versicherungen[i].versicherungshoehe);
            gesamtbetrag += versicherungshoehe;
        }
        return moneyFormatter.formatMoney(gesamtbetrag);
    };

    /* Berechnung des gesamten Monatsbeitrags der Person */
    $scope.monatsbeitraggesamt = function() {
        var gesamtbetrag=0;
        for (var i = 0; i < $scope.versicherungen.length; i++){
            gesamtbetrag += moneyParser.moneyparsen($scope.versicherungen[i].beitrag);
        }
        return moneyFormatter.formatMoney(gesamtbetrag);
    };

    /* Berechnung des gesamten Investitionsvolumens der Person */
    $scope.investhoehegesamt = function() {
        var gesamtbetrag=0;
        for (var i = 0; i < $scope.investitionen.length; i++){
            gesamtbetrag += moneyParser.moneyparsen($scope.investitionen[i].investitionshoehe);
        }
        return moneyFormatter.formatMoney(gesamtbetrag);
    };

    /* Berechnung der maximalen monatlichen Rendite der Person */
    $scope.renditemax = function() {
        var gesamtbetrag=0;
        var monatsbeitrag = 0;
        var investitionshoehe = 0;
        var versicherungshoehe = 0;
        for (var i = 0; i < $scope.investitionen.length; i++){
            monatsbeitrag = moneyParser.moneyparsen($scope.investitionen[i].beitrag);
            investitionshoehe = moneyParser.moneyparsen($scope.investitionen[i].investitionshoehe);
            versicherungshoehe = moneyParser.moneyparsen($scope.investitionen[i].versicherungshoehe);
            gesamtbetrag += monatsbeitrag * investitionshoehe /versicherungshoehe;
        }
        return moneyFormatter.formatMoney(gesamtbetrag);
    };

    /* Berechnung der monatlichen Rendite einer Investition */
    $scope.calculateRendite = function (investition) {
        var monatsbeitrag =  moneyParser.moneyparsen(investition.beitrag);
        var investitionshoehe = moneyParser.moneyparsen(investition.investitionshoehe);
        var versicherungshoehe = moneyParser.moneyparsen(investition.versicherungshoehe);

        return moneyFormatter.formatMoney(monatsbeitrag * investitionshoehe /versicherungshoehe);
    };
    



});
