appController.controller('investitionAddCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, checkCurrencyFormat, apiendpoint){

    $scope.versicherungID = $stateParams.id;
    
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungID).success(function(response) {
         $scope.versicherung = response[0];
    });
    
    $scope.investition = {
        versicherungID: $stateParams.id,
        investitionshoehe:""
    }
    
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungID + '/invest')
        .success(function(response) {
            if(angular.isDefined(response[0])) {
                $scope.investitionBetrag = response[0].suminvestition;
            } else {
                $scope.investitionBetrag = "0,00 €";   
            }
        })
    
    $scope.checkCurrency = checkCurrencyFormat;

    $scope.isNaN = function(field) {
        return (field.$error.required || field.$error.pattern) && field.$touched;
    };
    
    // Validierung, dass der investitionshoehe geringer als der versicherungswert ist
    
    $scope.calculateRendite = function(field) {
        var gesamtbetrag = 0;
        if($scope.investition.investitionshoehe != "" && angular.isDefined($scope.versicherung) && !(field.$error.pattern)){
            var monatsbeitrag = moneyParser.moneyparsen($scope.versicherung.beitrag);
            var investitionshoehe = moneyParser.moneyparsen($scope.investition.investitionshoehe);
            var versicherungshoehe = moneyParser.moneyparsen($scope.versicherung.versicherungshoehe);
            gesamtbetrag = monatsbeitrag * investitionshoehe /versicherungshoehe;
        }
        $scope.rendite = moneyFormatter.formatMoney(gesamtbetrag);
    }
    
    $scope.save = function(form) {
        if (form.$valid) {

            $scope.investition.investitionshoehe = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.investition.investitionshoehe));
            $state.go('app.investitionCheck',{investition: $scope.investition});  
        }
    }

});