appController.controller('schadensfaelleCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter){
    
    $scope.versicherungId = $stateParams.id;
    
    $scope.noSchaden = true;
    
    $http.get('http://localhost:3000/api/smartinsurance/versicherung/' + $scope.versicherungId).success(function(response) {
         $scope.versicherung = response[0];
    });
    
    
    $http.get('http://localhost:3000/api/smartinsurance/schadensfaelle/' + $scope.versicherungId).success(function(response) {
         $scope.schaeden = response;
         $scope.noSchaden = false;
    
    });
    
    
    $scope.schadensfallShow = function () {
        // Verweis auf Schadensfall bearbeiten
    }
    
    
});