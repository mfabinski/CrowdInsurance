appController.controller('investitionInfoCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, apiendpoint){

    $scope.versicherungID = $stateParams.id;
    
    $scope.noComment = true;
    
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungID).success(function(response) {
         $scope.versicherung = response[0];
    });

     
    $http.get(apiendpoint.url + '/api/smartinsurance/schadensfaelle/' + $scope.versicherungID).success(function(response) {
         $scope.schadensfaelle = response;
    });


    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungID + '/invest')
        .success(function(response) {
            if(angular.isDefined(response[0])) {
                $scope.investitionBetrag = response[0].suminvestition;
            } else {
                $scope.investitionBetrag = "0,00 €";   
            }
        })
    
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungID + '/bewertungen').success(function(response) {
        $scope.bewertung = response;
    });
    
    $http.get(apiendpoint.url + '/api/smartinsurance/kommentare/' + $scope.versicherungID).success(function(response) {
            $scope.comments = response;
            $scope.noComment = false;
    });
    
      
    $scope.gesamtSchaden = function () {
        var gesamtSchaden = 0;
        if (angular.isDefined($scope.schadensfaelle)) {
            for (var i = 0; i < $scope.schadensfaelle.length; i++) {
                gesamtSchaden = gesamtSchaden + moneyParser.moneyparsen($scope.schadensfaelle[i].schadenshoehe);
            };
        };
        return moneyFormatter.formatMoney(gesamtSchaden);
    };
    

    $scope.showSchadensfaelle = function() {
        $state.go("app.schadensfaelle", {id: $scope.versicherungID});
    };

    $scope.becomeInvestor = function () {
        $state.go("app.investitionAdd", {id: $scope.versicherungID});
    };

})
