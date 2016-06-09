appController.controller('investitionDetailCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, apiendpoint){


    $scope.investitionID = $stateParams.id;
    

     $http.get(apiendpoint.url + '/api/smartinsurance/investition/' + $scope.investitionID).success(function(response) {
        $scope.investition = response[0];
         
        $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.investition.versicherungID +'/person').success(function(response) {
            $scope.investoren = response;
        })

    
        $http.get(apiendpoint.url + '/api/smartinsurance/schadensfaelle/' + $scope.investition.versicherungID).success(function(response) {
             $scope.schadensfaelle = response;
        })
    
         $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.investition.versicherungID + '/invest')
            .success(function(response) {
                $scope.investitionBetrag = response[0].suminvestition;
            })
            .error(function(response) {
                $scope.investitionBetrag = "0,00 €";
            })
         
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
    


    $scope.showInvestor = function () {
        // Verweis auf die Seite des Investors
    };

    $scope.editInvestition = function () {
        $state.go("app.investitionEdit", {id: $scope.investition.id});
    };

    $scope.showSchadensfaelle = function() {
        $state.go("app.schadensfaelle", {id: $scope.investition.versicherungID});
    };

    $scope.showSocial = function () {
        $state.go("app.investitionSocial", {id: $scope.investition.id}); 
    };

});
