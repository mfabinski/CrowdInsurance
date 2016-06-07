appController.controller('investitionAddedCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, apiendpoint){

    $scope.versicherungID = $stateParams.ids.versicherungID;
    
    $scope.investitionID = $stateParams.ids.investitionsID;
    
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungID).success(function(response) {
         $scope.versicherung = response[0];
    });
    
    $http.get(apiendpoint.url + '/api/smartinsurance/investition/' + $scope.investitionID).success(function(response) {
         $scope.investition = response[0];
    });
    
    
    
    $scope.navigate = function (to) {
        switch (to) {
            case "teilen":
                // Facebook
                break;
            case "suchen":
                $state.go('app.investitionSearch');
                break;
            case "Übersicht":
                $state.go('app.uebersicht');
                break;
        };
    };
    
});