appController.controller('investitionDetailCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, datumFormatter, apiendpoint, Status, CacheHistoryReseter){

    /* ID der Investition */
    $scope.investitionID = $stateParams.id;

    /* Laden der Investition, dann die Investoren, Schadensfälle und den gedeckten Betrag  */
    $http.get(apiendpoint.url + '/api/smartinsurance/investition/' + $scope.investitionID).success(function(response) {
        $scope.investition = Status.investition(response)[0];

        $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.investition.versicherungID +'/person').success(function(response) {
            $scope.investoren = response;
            for (var i=0;i<$scope.investoren.length;i++) {
                $scope.investoren[i].abschlussZeitpunkt = datumFormatter.formatDatum($scope.investoren[i].abschlussZeitpunkt);
            }
        });


        $http.get(apiendpoint.url + '/api/smartinsurance/schadensfaelle/' + $scope.investition.versicherungID).success(function(response) {
            $scope.schadensfaelle = response;
        });

        $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.investition.versicherungID + '/invest')
            .success(function(response) {
                if(angular.isDefined(response[0])) {
                    $scope.investitionBetrag = response[0].suminvestition;
                } else {
                    $scope.investitionBetrag = "0,00 €";
                }
            })

    }).error(function(error, status) {
        CacheHistoryReseter.reset();
        $state.go("app.error", {error: {message: error, status: status}});
    });

    /* Berechnung des Gesamtschadens */
    $scope.gesamtSchaden = function () {
        var gesamtSchaden = 0;
        if (angular.isDefined($scope.schadensfaelle)) {
            for (var i = 0; i < $scope.schadensfaelle.length; i++) {
                gesamtSchaden = gesamtSchaden + moneyParser.moneyparsen($scope.schadensfaelle[i].schadenshoehe);
            }
        }
        return moneyFormatter.formatMoney(gesamtSchaden);
    };

    /* Berechnung der maximalen monatlichen Rendite */
    $scope.calculateRendite = function(investitionshoehe) {
        var gesamtbetrag = 0;
        if(angular.isDefined($scope.investition)){
            var monatsbeitrag = moneyParser.moneyparsen($scope.investition.beitrag);
            var investitionshoehe = moneyParser.moneyparsen(investitionshoehe);
            var versicherungshoehe = moneyParser.moneyparsen($scope.investition.versicherungshoehe);
            gesamtbetrag = monatsbeitrag * investitionshoehe /versicherungshoehe;
        }
        return moneyFormatter.formatMoney(gesamtbetrag);
    };

    /* Verweis auf das Profil des Investors */
   $scope.showInvestor = function (investor) {
        $state.go('app.profilFremd',{investor: investor});
    };

    /* Verweis auf das Profil des Versicherungsnehmers */
    $scope.showVersicherer = function () {
        var investor = {
            personID: $scope.investition.vpersonID
        }
        $state.go('app.profilFremd',{investor: investor});
    };

    /* Verweis auf das Profil des Investors */
    $scope.editInvestition = function () {
        $state.go("app.investitionEdit", {id: $scope.investition.id});
    };

    /* Verweis auf die Schadensfälle */
    $scope.showSchadensfaelle = function() {
        $state.go("app.schadensfaelle", {id: $scope.investition.versicherungID});
    };

    /* Verweis auf den Social-Bereich */
    $scope.showSocial = function () {
        $state.go("app.investitionSocial", {id: $scope.investition.id});
    };

    /* Verweis auf die InvestitionAdd-Page */
    $scope.invest = function () {
        $state.go("app.investitionAdd", {id: $scope.investition.versicherungID});
    }

});
