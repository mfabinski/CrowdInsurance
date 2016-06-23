appController.controller('profilBearbeitenCtrl',function($scope, $http, $state, $stateParams, apiendpoint){

    $scope.submitted = false;

    $http.get(apiendpoint.url + '/api/smartinsurance/profil').success(function(response) {
         $scope.profil = response[0];
    });


        $scope.checkIBAN = /[a-zA-Z]{2}[0-9]{2}[a-zA-Z0-9]{4}[0-9]{7}([a-zA-Z0-9]?){0,16}/;

         $scope.funcIBAN = function(field){
            return field.$error.pattern && (field.$touched || $scope.submitted);
        }

        $scope.isInvalid = function(field){
            return field.$error.required && (field.$touched || $scope.submitted);
        };




    $scope.profilBearbeiten = function(form) {

        $scope.submitted = true;

        if (form.$valid){
             $state.go('app.profil');
          }

    }

});
