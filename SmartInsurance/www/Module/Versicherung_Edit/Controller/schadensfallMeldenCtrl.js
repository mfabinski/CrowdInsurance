appController.controller('schadensfallMeldenCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, checkCurrencyFormat, apiendpoint){
    
    $scope.versicherungId = $stateParams.id;
    
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungId).success(function(response) {
         $scope.versicherung = response[0];
    });
    
     $scope.schaden = {
        versicherungID:  $scope.versicherungId,
        beschreibung: "",
/*      name: "",
        datum: "",
        uhrzeit: "",  */
        schadenshoehe: ""
    };
        
    $scope.checkCurrency = checkCurrencyFormat;
    
    $scope.isInvalid = function(field){
        return field.$error.required && field.$touched;
     };
    
    
    $scope.isNaN = function(field) {  
        return field.$error.pattern && field.$touched;
    };
    
    
    $scope.reportSchaden = function (form) {
        
        $scope.schaden.schadenshoehe = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.schaden.schadenshoehe));
        
        if(form.$valid && $scope.versicherungId != null){
            $http.post(apiendpoint.url + '/api/smartinsurance/schadensfallmelden', $scope.schaden).then(function(data) {
                console.log("erfolgreich");
                // id übergeben
                $state.go('app.versicherungDetail',{id: $scope.versicherungId});
            }); 
        }
    }
    
    
});