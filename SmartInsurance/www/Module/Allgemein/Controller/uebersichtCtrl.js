appController.controller('uebersichtCtrl', function($scope, $http, $state, moneyParser, moneyFormatter, apiendpoint){


    $scope.versicherungen= [];
    $scope.investitionen = [];

    $scope.versicherungsstatus = [];
    $scope.investitionsstatus = [];

    $scope.noVersicherung = true;
    $scope.noInvestition = true;


    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung').success(function(response) {
        $scope.versicherungen = response;
        $scope.noVersicherung = false;
         for (var i=0;i<$scope.versicherungen.length;i++){
            if($scope.versicherungen[i].wirdGekuendigt){
                $scope.versicherungsstatus.push("wird gekündigt")
            }
            if($scope.versicherungen[i].istGekuendigt){
                $scope.versicherungsstatus.push("gekündigt")
            }
            if (!$scope.versicherungen[i].laeuft) {
                 $scope.versicherungsstatus.push("keine Investoren")
            } else {
                $scope.versicherungsstatus.push("läuft")
            }
            $scope.versicherungen[i].versicherungsstatus = $scope.versicherungsstatus;
            $scope.versicherungsstatus = [];

        }

    });

    $http.get(apiendpoint.url + '/api/smartinsurance/investition').success(function(response) {
        $scope.investitionen = response;
        $scope.noInvestition = false;
        for (var i=0;i<$scope.investitionen.length;i++){
            if($scope.investitionen[i].iwirdGekuendigt){
                $scope.investitionsstatus.push("wird gekündigt")
            }
            if($scope.investitionen[i].iistGekuendigt || $scope.investitionen[i].vistGekuendigt){
                $scope.investitionsstatus.push("gekündigt")
            }
            if($scope.investitionen[i].vwirdGekuendigt){
                $scope.investitionsstatus.push("Versicherung wird beendet")
            }
             if($scope.investitionsstatus.length == 0){
                $scope.investitionsstatus.push("läuft")
            }
            $scope.investitionen[i].investitionsstatus = $scope.investitionsstatus;
            $scope.investitionsstatus = [];
        }

    });

    $scope.versicherungShow = function(id) {
        $state.go("app.versicherungDetail",{id: id});
    };

    $scope.investitionShow = function(id) {
        $state.go("app.investitionDetail",{id: id});
    };

    $scope.versicherungengesamt = function() {
        var gesamtbetrag=0;
        var versicherungshoehe = 0;
        for (var i = 0; i < $scope.versicherungen.length; i++){
            versicherungshoehe = moneyParser.moneyparsen($scope.versicherungen[i].versicherungshoehe);
            gesamtbetrag += versicherungshoehe;
        }
        return moneyFormatter.formatMoney(gesamtbetrag);
    };

    $scope.monatsbeitraggesamt = function() {
        var gesamtbetrag=0;
        for (var i = 0; i < $scope.versicherungen.length; i++){
            gesamtbetrag += moneyParser.moneyparsen($scope.versicherungen[i].beitrag);
        }
        return moneyFormatter.formatMoney(gesamtbetrag);
    };

    $scope.investhoehegesamt = function() {
        var gesamtbetrag=0;
        for (var i = 0; i < $scope.investitionen.length; i++){
            gesamtbetrag += moneyParser.moneyparsen($scope.investitionen[i].investitionshoehe);
        }
        return moneyFormatter.formatMoney(gesamtbetrag);
    };

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

    $scope.calculateRendite = function (investition) {
        var monatsbeitrag =  moneyParser.moneyparsen(investition.beitrag);
        var investitionshoehe = moneyParser.moneyparsen(investition.investitionshoehe);
        var versicherungshoehe = moneyParser.moneyparsen(investition.versicherungshoehe);

        return moneyFormatter.formatMoney(monatsbeitrag * investitionshoehe /versicherungshoehe);
    };


});
