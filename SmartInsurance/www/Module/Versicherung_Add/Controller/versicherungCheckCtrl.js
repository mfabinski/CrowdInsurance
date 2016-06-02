appController.controller('versicherungCheckCtrl',function($scope, $http, $state, moneyParser, moneyFormatter, versicherungAdd){
   
    $scope.versicherung = versicherungAdd;
    
    console.log(JSON.stringify($scope.versicherung));
    
    
     /*    $http.post('http://localhost:3000/api/smartinsurance/versicherung', $scope.versicherung).then(function(data) {
            $scope.msg = 'Erfolgreich abgeschlossen.';
        });  */
    
});

