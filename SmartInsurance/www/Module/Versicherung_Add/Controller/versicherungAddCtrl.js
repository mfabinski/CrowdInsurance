appController.controller('versicherungAddCtrl',function($scope, $http, $state, $location, moneyParser, moneyFormatter, checkCurrencyFormat, selectFormatter, apiendpoint){

    $scope.submitted = false;

    $scope.url = $location.absUrl();

    $http.get(apiendpoint.url + '/api/smartinsurance/kategorien').success(function(response) {
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
        return field.$error.required && (field.$touched || $scope.submitted);
    };


    $scope.isNaN = function(field) {
        return field.$error.pattern && (field.$touched || $scope.submitted);
    };




    $scope.versicherungAdd = function(form) {

        $scope.submitted = true;

        if(angular.isDefined($scope.versicherung.versicherungshoehe) && angular.isDefined($scope.versicherung.beitrag) ){
            $scope.versicherung.kategorie =  selectFormatter.formatSelect($scope.versicherung.kategorie);
            $scope.versicherung.versicherungshoehe = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.versicherung.versicherungshoehe));
            $scope.versicherung.beitrag = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.versicherung.beitrag));
        }

        if (form.$valid){
            $state.go('app.versicherungCheck', {versicherung : $scope.versicherung});
        }
    };
});
