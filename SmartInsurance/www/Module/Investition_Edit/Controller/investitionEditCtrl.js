appController.controller('investitionEditCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, checkCurrencyFormat, apiendpoint){

    $scope.investitionID = $stateParams.id;


    $http.get(apiendpoint.url + '/api/smartinsurance/investition/' + $scope.investitionID).success(function(response) {
        $scope.investition = response[0];
        $scope.investitionNeu = {
            investitionID: $stateParams.id,
            investitionshoehe : ""
        };
         
        $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.investition.versicherungID + '/invest')
            .success(function(response) {
                $scope.investitionBetrag = response[0].suminvestition;
            })
            .error(function(response) {
                $scope.investitionBetrag = "0,00 €";
            })
    });


    $scope.save = function(form) {
        if (form.$valid) {

            $scope.investitionNeu.investitionshoehe = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.investitionNeu.investitionshoehe));

            if($scope.investitionNeu.investitionshoehe != "0,00 €" && $scope.investitionNeu.investitionshoehe != "0,00 €" ){
                console.log($scope.investitionNeu);
                // Schnittstelle noch nicht implementiert
                $http.post(apiendpoint.url + '/api/smartinsurance/investition', $scope.investitionNeu).then(function(data) {
                    console.log("erfolgreich");
                    $state.go('app.investitionDetail',{id: $scope.investitionID});
                });
            }
        }
    }

    $scope.cancelInvestition = function () {
         $http.post(apiendpoint.url + '/api/smartinsurance/investition/' + $scope.investitionID + '/kuendigen').then(function(data) {
            console.log("erfolgreich");
            $state.go('app.investitionDetail',{id: $scope.investitionID});
        });
    };

    $scope.checkCurrency = checkCurrencyFormat;

    $scope.isNaN = function(field) {
        return (field.$error.required || field.$error.pattern) && field.$touched;
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
    }
    
    $scope.calculateNewRendite = function(field) {
        if($scope.investitionNeu.investitionshoehe != "" && !(field.$error.pattern)){
             $scope.rendite = $scope.calculateRendite($scope.investitionNeu.investitionshoehe);
        }
    }
     
     


});
