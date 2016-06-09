appController.controller('investitionEditCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, checkCurrencyFormat, apiendpoint){

    $scope.investitionID = $stateParams.id;


    $http.get(apiendpoint.url + '/api/smartinsurance/investition/' + $scope.investitionID).success(function(response) {
        $scope.investition = response[0];
        $scope.investitionNeu = angular.copy($scope.investition);
        
        $http.get(apiendpoint.url + '/api/smartinsurance/investition/' + $scope.investitionID).success(function(response) {
            $scope.versicherung = response[0];
        });
    });


    $scope.save = function(form) {
        if (form.$valid) {

            $scope.investitionNeu.investitionshoehe = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.investitionNeu.investitionshoehe));

            if($scope.investitionNeu.investitionshoehe != "0,00 €" && $scope.investitionNeu.investitionshoehe != "0,00 €" ){
                $http.post(apiendpoint.url + '/api/smartinsurance/investition/' + $scope.investitionID, $scope.investitionNeu).then(function(data) {
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
    
     $scope.calculateRendite = function(field) {
        var gesamtbetrag = 0;
        if($scope.investitionNeu.investitionshoehe != "" && angular.isDefined($scope.versicherung) && !(field.$error.pattern)){
            var monatsbeitrag = moneyParser.moneyparsen($scope.versicherung.beitrag);
            var investitionshoehe = moneyParser.moneyparsen($scope.investition.investitionshoehe);
            var versicherungshoehe = moneyParser.moneyparsen($scope.versicherung.versicherungshoehe);
            gesamtbetrag = monatsbeitrag * investitionshoehe /versicherungshoehe;
        }
        $scope.rendite = moneyFormatter.formatMoney(gesamtbetrag);
    }

});
