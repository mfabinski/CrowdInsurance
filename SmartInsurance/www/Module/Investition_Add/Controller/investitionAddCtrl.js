appController.controller('investitionAddCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, checkCurrencyFormat, apiendpoint){

    $scope.versicherungID = $stateParams.id;
    
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungID).success(function(response) {
         $scope.versicherung = response[0];
    });
    
    $scope.investition = {
        versicherungID: $stateParams.id,
        investitionswert:""
    }
    
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungID + '/invest')
        .success(function(response) {
            $scope.investitionBetrag = response[0].suminvestition;
        })
        .error(function(response) {
            $scope.investitionBetrag = "0,00 €";
        })
    
    $scope.checkCurrency = checkCurrencyFormat;

    $scope.isNaN = function(field) {
        return (field.$error.required || field.$error.pattern) && field.$touched;
    };
    
    $scope.calculateRendite = function(field) {
        var gesamtbetrag = 0;
        if($scope.investition.investitionswert != "" && angular.isDefined($scope.versicherung) && !(field.$error.pattern)){
            var monatsbeitrag = moneyParser.moneyparsen($scope.versicherung.beitrag);
            var investitionswert = moneyParser.moneyparsen($scope.investition.investitionswert);
            var versicherungshoehe = moneyParser.moneyparsen($scope.versicherung.versicherungshoehe);
            console.log(monatsbeitrag);
            console.log(investitionswert);
            console.log(versicherungshoehe);
            gesamtbetrag = monatsbeitrag * investitionswert /versicherungshoehe;
            console.log(gesamtbetrag);
        }
        $scope.rendite = moneyFormatter.formatMoney(gesamtbetrag);
    }
    
    $scope.save = function(form) {
        if (form.$valid) {

            $scope.investition.investitionswert = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.investition.investitionswert));
            $state.go('app.investitionCheck',{investition: $scope.investition});  
        }
    }

});