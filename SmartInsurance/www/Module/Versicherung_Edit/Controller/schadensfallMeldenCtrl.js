appController.controller('schadensfallMeldenCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, checkCurrencyFormat, apiendpoint, CacheHistoryReseter){

    $scope.schaden =  $stateParams.schaden;

    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.schaden.versicherungID).success(function(response) {
         $scope.versicherung = response[0];
    });

   $scope.edit = function() {
       if (angular.isDefined($scope.schaden.id)){
           return true;
       }
       return false;
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
        if(form.$valid && $scope.schaden.versicherungID != null){
            $scope.schadenNew = {
                versicherungID:$scope.schaden.versicherungID,
                bezeichnung:$scope.schaden.bezeichnung,
                beschreibung:$scope.schaden.beschreibung,
                schadenshoehe:$scope.schaden.schadenshoehe
            };
            $http.post(apiendpoint.url + '/api/smartinsurance/schadensfallmelden', $scope.schadenNew).then(function(data) {
                CacheHistoryReseter.reset();
                $state.go('app.versicherungDetail',{id: $scope.schaden.versicherungID});
            });
        }
    }

    $scope.editSchaden = function (form) {

        $scope.schaden.schadenshoehe = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.schaden.schadenshoehe));
        if(form.$valid && $scope.schaden.versicherungID != null){
            $scope.schadenNew = {
                schadensfallID:$scope.schaden.id,
                bezeichnung:$scope.schaden.bezeichnung,
                beschreibung:$scope.schaden.beschreibung,
                schadenshoehe:$scope.schaden.schadenshoehe
            };
            $http.post(apiendpoint.url + '/api/smartinsurance/schadensfall/', $scope.schadenNew).then(function(data) {
                CacheHistoryReseter.reset();
                $state.go('app.versicherungDetail',{id: $scope.schaden.versicherungID});
            });
        }
    }


});
