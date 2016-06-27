appController.controller('profilFremdCtrl',function($scope, $http, $state, $stateParams, apiendpoint){

    
    
    $http.get(apiendpoint.url + '/api/smartinsurance/profil').success(function(response) {
         $scope.profil = response[0];
    });
    
    $scope.versicherungen= [];
    
        $http.get(apiendpoint.url + '/api/smartinsurance/versicherung').success(function(response) {
         $scope.versicherungen = response;
            
            $scope.gespos = 0;
            $scope.gesneg = 0;
          for (var i = 0; i < $scope.versicherungen.length; i++){
            $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungen[i].id + '/bewertungen').success(function(response) {
                if(angular.isDefined(response[0])) {
                    $scope.bewertung = response;
                    $scope.pos = bewertung[0];
                    $scope.neg = bewertung[1];
                    
                    $scope.gespos += $scope.pos;
                     $scope.gesneg += $scope.neg;
                }
            });
        }
        $scope.avg = $scope.gespos - $scope.gesneg;
            
             
    });
    
    
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungId + '/bewertungen').success(function(response) {
         if(angular.isDefined(response[0])) {
            $scope.bewertung = response;
        }
    });

        $scope.avgBew = function() {
            $scope.avg = (versicherungen[0].bewertung + versicherungen[1].bewertung)/2;
    }


});