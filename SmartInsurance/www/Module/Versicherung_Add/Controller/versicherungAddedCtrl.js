appController.controller('versicherungAddedCtrl',function($scope, $http, $state) {
    
    // soll beim Versicherung anlegen zurückgesendet werden
    $scope.versicherungId = '89';
 
    
    $http.get('http://localhost:3000/api/smartinsurance/versicherung/'+$scope.versicherungId).success(function(response) {
        $scope.versicherung = response[0];
    });
    
    
    $scope.navigate = function (to) { 
        switch (to) {
            case "teilen":
                
                break;
            case "hinzufügen":
                $state.go('app.versicherungAdd');
                break;
            case "Übersicht":
                $state.go('app.uebersicht');
                break;
        };
    };
    
});