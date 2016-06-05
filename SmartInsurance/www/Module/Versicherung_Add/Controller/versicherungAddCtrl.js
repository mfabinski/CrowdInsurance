appController.controller('versicherungAddCtrl',function($scope, $http, $state, moneyParser, moneyFormatter, versicherungAdd, checkCurrencyFormat, apiendpoint){

    $http.get(apiendpoint.url + '/api/smartinsurance/kategorien').success(function(response) {
         $scope.kategorien = response;
    });


    $scope.versicherung = versicherungAdd.getVersicherung();


    $scope.checkCurrency = checkCurrencyFormat;


    $scope.isInvalid = function(field){
        return field.$error.required && field.$touched;
     };


    $scope.isNaN = function(field) {
        return field.$error.pattern && field.$touched;
    };


    $scope.versicherungAdd = function(form) {

        if(angular.isDefined($scope.versicherung.versicherungshoehe) && angular.isDefined($scope.versicherung.beitrag) /* && angular.isDefined($scope.versicherung.wert) */ ){
            $scope.versicherung.versicherungshoehe = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.versicherung.versicherungshoehe));
            $scope.versicherung.beitrag = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.versicherung.beitrag));
//          $scope.versicherung.wert = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.versicherung.wert));
        }

        if (form.$valid){
            versicherungAdd.setVersicherung($scope.versicherung);
            $state.go('app.versicherungCheck');
        }
    };
});
