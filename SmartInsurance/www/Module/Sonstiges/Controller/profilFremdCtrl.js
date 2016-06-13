appController.controller('profilFremdCtrl',function($scope, $http, $state, $stateParams, apiendpoint){

    
    
    $http.get(apiendpoint.url + '/api/smartinsurance/profil').success(function(response) {
         $scope.profil = response[0];
         $scope.prename = response[0].prename;
         $scope.name = response[0].name;
         $scope.email = response[0].email;
         $scope.iban = response[0].iban;
         $scope.email = response[0].bic;
    });
    
    $scope.versicherungen= [];
    
        $http.get(apiendpoint.url + '/api/smartinsurance/versicherung').success(function(response) {
         $scope.versicherungen = response;

    });

        $scope.avgBew = function() {
            $scope.avg = (versicherungen[0].bewertung + versicherungen[1].bewertung)/2;
    }


});