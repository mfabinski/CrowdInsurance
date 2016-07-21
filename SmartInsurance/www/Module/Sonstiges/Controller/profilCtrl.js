appController.controller('profilCtrl',function($scope, $http, $state, $stateParams, apiendpoint, datumFormatter){



    $http.get(apiendpoint.url + '/api/smartinsurance/profil').success(function(response) {
         $scope.profil = response[0];
         $scope.prename = response[0].prename;
         $scope.name = response[0].name;
         $scope.email = response[0].email;
         $scope.iban = response[0].iban;
         $scope.email = response[0].bic;
         $scope.birthday = datumFormatter.formatDatum(response[0].birthday);

    });

    $scope.editProfil = function () {
        $state.go('app.profilBearbeiten');
    };



});
