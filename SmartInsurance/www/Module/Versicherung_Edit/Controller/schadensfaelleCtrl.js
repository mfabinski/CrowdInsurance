appController.controller('schadensfaelleCtrl',function($scope, $http, $state, moneyParser, moneyFormatter){
    
    $scope.versicherungId = '89';
    
    $http.get('http://localhost:3000/api/smartinsurance/versicherung/' + $scope.versicherungId).success(function(response) {
         $scope.versicherung = response[0];
    
    });
    
    /*
    $http.get('http://localhost:3000/api/smartinsurance/schadensfaelle/' + $scope.versicherungId).success(function(response) {
         $scope.schaeden = response;
    
    });
    */
    
    $scope.schadensfallShow = function () {
        // Verweis auf Schadensfall bearbeiten
    }
    
    
});