appController.controller('profilBearbeitenCtrl',function($scope, $http, $state, $stateParams, apiendpoint, $ionicPopup,CacheHistoryReseter, $rootScope){


    /* Laden des Profils und Anlegen eines neuen Profil-Objekts */
    $http.get(apiendpoint.url + '/api/smartinsurance/profil').success(function(response) {
        $scope.profil = response[0];
        $scope.profilNeu = {
            personID: $scope.profil.id,
            name: $scope.profil.name,
            prename: $scope.profil.prename,
            email: $scope.profil.email,
            iban: $scope.profil.iban,
            bic: $scope.profil.bic,
            bankinstitut: $scope.profil.bankinstitut,
            birthday: "01.01.1999"
        };
    }).error(function(error, status) {
        CacheHistoryReseter.reset();
        $state.go("app.error", {error: {message: error, status: status}});
    });


    /* Regex IBAN */
    $scope.checkIBAN = /[a-zA-Z]{2}[0-9]{2}[a-zA-Z0-9]{4}[0-9]{7}([a-zA-Z0-9]?){0,16}/;

    /* Regex EMail */
    $scope.checkEMail =/.{1,}@[_a-z0-9A-Z]+(\.[a-z0-9A-Z]+)+/;

    /* Überprüfung der Regex-Ausdrücke */
    $scope.check = function(field){
        return field.$error.pattern && (field.$touched || $scope.submitted);
    }

    /* Validierung */
    $scope.isInvalid = function(field){
        return field.$error.required && (field.$touched || $scope.submitted);
    };

    /* Speicherung der Bearbeitung */
    $scope.profilBearbeiten = function(form) {

        $scope.submitted = true;
        
        $rootScope.eProfilBild = document.getElementById("eProfil");

        if (form.$valid) {


                $ionicPopup.show({
                    title: 'Bestätigung',
                    template: 'Wollen Sie die Änderung speichern?',
                    buttons: [
                      { text: 'Cancel' },
                      {
                        text: '<b>Speichern</b>',
                        type: 'button-positive',
                        onTap: function(e) {
                            $http.post(apiendpoint.url + '/api/smartinsurance/profil', $scope.profilNeu).then(function(data) {
                                CacheHistoryReseter.reset();
                                $state.go('app.uebersicht');
                            });
                            
                            
                        }
                      }
                    ]
                });
        }
        }



});
