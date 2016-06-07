appController.controller('schadensfallMeldenCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, checkCurrencyFormat, apiendpoint){
    
    $scope.schaden =  $stateParams.schaden;
    
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.schaden.versicherungID).success(function(response) {
         $scope.versicherung = response[0];
    });
    
   $scope.edit = function() {
       if (angular.isDefined($scope.schaden.id)){
           return "Änderung speichern";
       }
       return "Schadensfall melden";
   }
     
        
    $scope.checkCurrency = checkCurrencyFormat;
    
    $scope.isInvalid = function(field){
        return field.$error.required && field.$touched;
     };
    
    
    $scope.isNaN = function(field) {  
        return field.$error.pattern && field.$touched;
    };
    
    
    $scope.reportSchaden = function (form) {
        
        $scope.schaden.schadenshoehe = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.schaden.schadenshoehe));
        console.log($scope.schaden);
        if(form.$valid && $scope.schaden.versicherungID != null){
            $http.post(apiendpoint.url + '/api/smartinsurance/schadensfallmelden', $scope.schaden).then(function(data) {
                $state.go('app.versicherungDetail',{id: $scope.schaden.versicherungID});
            }); 
        }
    }
    
    
});