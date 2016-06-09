appController.controller('investitionCheckCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, apiendpoint){

    $scope.investition = $stateParams.investition;
    
    $scope.disable = true;
    
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.investition.versicherungID).success(function(response) {
         $scope.versicherung = response[0];
    });
    
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.investition.versicherungID + '/invest')
        .success(function(response) {
            $scope.investitionBetrag = response[0].suminvestition;
        })
        .error(function(response) {
            $scope.investitionBetrag = "0,00 €";
        })
    
     $scope.calculateRendite = function(field) {
        var gesamtbetrag = "0,00 €"
        if(angular.isDefined($scope.versicherung)){
            var monatsbeitrag = moneyParser.moneyparsen($scope.versicherung.beitrag);
            var investitionshoehe = moneyParser.moneyparsen($scope.investition.investitionshoehe);
            var versicherungshoehe = moneyParser.moneyparsen($scope.versicherung.versicherungshoehe);
            gesamtbetrag = monatsbeitrag * investitionshoehe /versicherungshoehe;
        }
        return moneyFormatter.formatMoney(gesamtbetrag);
    }
    
    $scope.addInvestition = function() {
       
        $http.post(apiendpoint.url + '/api/smartinsurance/investieren', $scope.investition).success(function(data) {
               $state.go('app.investitionAdded',{ids: {versicherungID: $scope.investition.versicherungID,
                                                      investitionID: data[0].createinvestition}});
        });
        
  

    }
    
});