appController.controller('profilCtrl',function($scope, $http, $state, $stateParams, apiendpoint, datumFormatter,$rootScope){


    /* Laden des Profils */
    $http.get(apiendpoint.url + '/api/smartinsurance/profil').success(function(response) {
         $scope.profil = response[0];
         $scope.birthday = datumFormatter.formatDatum($scope.profil.birthday);

    });

    /* Verweis zur Bearbeitung */
    $scope.editProfil = function () {
        $state.go('app.profilBearbeiten');
    };



});
