appController.controller('versicherungAddCtrl',function($scope, $http, $state, moneyParser, moneyFormatter, checkCurrencyFormat, selectFormatter){
      
    $http.get('http://localhost:3000/api/smartinsurance/kategorien').success(function(response) {
         $scope.kategorien = response;
    });    
    
    
    $scope.versicherung = {
        name: "",
        versicherungshoehe: "",
        beitrag: "",
        beschreibung: "",
        kategorie: ""
    };
    
    
    $scope.checkCurrency = checkCurrencyFormat;
     
    
    $scope.isInvalid = function(field){
        return field.$error.required && field.$touched;
     };
    
    
    $scope.isNaN = function(field) {  
        return field.$error.pattern && field.$touched;
    };
    
   

    
    $scope.versicherungAdd = function(form) {
        
        if(angular.isDefined($scope.versicherung.versicherungshoehe) && angular.isDefined($scope.versicherung.beitrag) /* && angular.isDefined($scope.versicherung.wert) */ ){ 
            $scope.versicherung.kategorie =  selectFormatter.formatSelect($scope.versicherung.kategorie);
            $scope.versicherung.versicherungshoehe = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.versicherung.versicherungshoehe));
            $scope.versicherung.beitrag = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.versicherung.beitrag));
//          $scope.versicherung.wert = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.versicherung.wert));
        }
        
        if (form.$valid){
            $state.go('app.versicherungCheck', {versicherung : $scope.versicherung});
        } 
    };
});

