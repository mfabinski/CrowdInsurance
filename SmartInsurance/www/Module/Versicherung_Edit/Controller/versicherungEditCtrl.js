appController.controller('versicherungEditCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, checkCurrencyFormat, apiendpoint){

    $scope.versicherungId = $stateParams.id;


    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungId).success(function(response) {
        $scope.versicherung = response[0];
        $scope.versicherungNeu = angular.copy($scope.versicherung);
    });


    $scope.save = function(form) {
        if (form.$valid) {

            $scope.versicherungNeu.versicherungshoehe = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.versicherungNeu.versicherungshoehe));
            $scope.versicherungNeu.beitrag = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.versicherungNeu.beitrag));

            if($scope.versicherungNeu.versicherungshoehe != "0,00 €" && $scope.versicherungNeu.beitrag != "0,00 €" ){
                // Schnittstelle ist noch nicht implementiert
                $http.post(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungId, $scope.versicherungNeu).then(function(data) {
                    console.log("erfolgreich");
                    $state.go('app.versicherungDetail',{id: $scope.versicherungId});
                });
            }
        }
    }

    $scope.cancelVersicherung = function () {
         $http.post(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungId + '/kuendigen').then(function(data) {
            console.log("erfolgreich");
            $state.go('app.versicherungDetail',{id: $scope.versicherungId});
        });
    };

    $scope.checkCurrency = checkCurrencyFormat;

    $scope.isNaN = function(field) {
        return (field.$error.required || field.$error.pattern) && field.$touched;
    };

});
