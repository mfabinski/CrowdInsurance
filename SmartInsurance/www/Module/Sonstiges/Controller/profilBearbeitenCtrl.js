appController.controller('profilBearbeitenCtrl',function($scope, $http, $state, $stateParams, apiendpoint){

    $scope.submitted = false;
    
    $http.get(apiendpoint.url + '/api/smartinsurance/profil').success(function(response) {
         $scope.profil = response[0];
         $scope.prename = response[0].prename;
         $scope.name = response[0].name;
         $scope.email = response[0].email;
         $scope.iban = response[0].iban ;
         $scope.email = response[0].bic;
    });
    

        $scope.checkIBAN = /[a-zA-Z]{2}[0-9]{2}[a-zA-Z0-9]{4}[0-9]{7}([a-zA-Z0-9]?){0,16}/;
    
         $scope.funcIBAN = function(str){
        
            return str.$error.pattern;
        }
        
       
                                                    
      
    
        $scope.profilBearbeiten = function(form) {

        $scope.submitted = true;
            
            
            if (form.$valid){
            
             $state.go('app.profil', {profil : $scope.profil});
        
          }
            
        }

});