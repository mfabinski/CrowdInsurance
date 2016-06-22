appController.controller('investitionDetailCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, datumFormatter, apiendpoint, Status, CacheHistoryReseter){


    $scope.investitionID = $stateParams.id;


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


    $scope.gesamtSchaden = function () {
        var gesamtSchaden = 0;
        if (angular.isDefined($scope.schadensfaelle)) {
            for (var i = 0; i < $scope.schadensfaelle.length; i++) {
                gesamtSchaden = gesamtSchaden + moneyParser.moneyparsen($scope.schadensfaelle[i].schadenshoehe);
            }
        }
        return moneyFormatter.formatMoney(gesamtSchaden);
    };

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


    $scope.showInvestor = function () {
        // Verweis auf die Seite des Investors
    };

    $scope.editInvestition = function () {
        $state.go("app.investitionEdit", {id: $scope.investition.id});
    };

    $scope.showSchadensfaelle = function() {
        $state.go("app.schadensfaelle", {id: $scope.investition.versicherungID});
    };

    $scope.showSocial = function () {
        $state.go("app.investitionSocial", {id: $scope.investition.id});
    };

});
