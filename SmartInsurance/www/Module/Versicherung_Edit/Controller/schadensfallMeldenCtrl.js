appController.controller('schadensfallMeldenCtrl',function($scope, $http, $state, $stateParams, $ionicPopup, moneyParser, moneyFormatter, checkCurrencyFormat, apiendpoint, CacheHistoryReseter){

    /* Weiterleitung auf die Error-Page beim erneuten Laden der Seite */
    if ($stateParams.schaden == null) {
        CacheHistoryReseter.reset();
        $state.go("app.error", {error: {message: "Fehler beim erneuten Laden der Seite.", status: ""}});
    } else {
        $scope.schaden =  $stateParams.schaden;


        $scope.submitted = false;

        /* Laden der Versicherung  */
        $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.schaden.versicherungID).success(function(response) {
            $scope.versicherung = response[0];
        });

        /* Unterscheidung, ob ein Schadensfall bearbeitet wird oder ein neuer Schadensfall erstellt wird  */
       $scope.edit = function() {
           if (angular.isDefined($scope.schaden.id)){
               return true;
           }
           return false;
       };


        $scope.checkCurrency = checkCurrencyFormat;

        /* Validierung Pflichtfeld */
        $scope.isInvalid = function(field){
            return field.$error.required && (field.$touched || $scope.submitted);
         };

        /* Validierung Währungsfeld */
        $scope.isNaN = function(field) {
            return field.$error.pattern && (field.$touched || $scope.submitted);
        };

        /* Neuen Schaden melden */
        $scope.reportSchaden = function (form) {

            $scope.submitted = true;

            $scope.schaden.schadenshoehe = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.schaden.schadenshoehe));
            if(form.$valid && $scope.schaden.versicherungID != null){
                $scope.schadenNew = {
                    versicherungID:$scope.schaden.versicherungID,
                    bezeichnung:$scope.schaden.bezeichnung,
                    beschreibung:$scope.schaden.beschreibung,
                    schadenshoehe:$scope.schaden.schadenshoehe
                };
                $ionicPopup.show({
                    title: 'Bestätigung',
                    template: 'Wollen Sie die Änderung speichern?',
                    buttons: [
                      { text: 'Cancel' },
                      {
                        text: '<b>Speichern</b>',
                        type: 'button-positive',
                        onTap: function(e) {
                            $http.post(apiendpoint.url + '/api/smartinsurance/schadensfallmelden', $scope.schadenNew).then(function(data) {
                                CacheHistoryReseter.reset();
                                $state.go('app.versicherungDetail',{id: $scope.schaden.versicherungID});
                            });
                        }
                      }
                    ]
                });
            }
        };

        /* Schaden bearbeiten */
        $scope.editSchaden = function (form) {

            $scope.submitted = true;
            
             $rootScope.sBild1 = document.getElementById("sBild1");
             $rootScope.sBild2 = document.getElementById("sBild2");
             $rootScope.sBild3 = document.getElementById("sBild3");
             $rootScope.sBild4 = document.getElementById("sBild4");

            $scope.schaden.schadenshoehe = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.schaden.schadenshoehe));
            if(form.$valid && $scope.schaden.versicherungID != null){
                $scope.schadenNew = {
                    schadensfallID:$scope.schaden.id,
                    bezeichnung:$scope.schaden.bezeichnung,
                    beschreibung:$scope.schaden.beschreibung,
                    schadenshoehe:$scope.schaden.schadenshoehe
                };
                $ionicPopup.show({
                    title: 'Bestätigung',
                    template: 'Wollen Sie die Änderung speichern?',
                    buttons: [
                      { text: 'Cancel' },
                      {
                        text: '<b>Speichern</b>',
                        type: 'button-positive',
                        onTap: function(e) {
                            $http.post(apiendpoint.url + '/api/smartinsurance/schadensfall/', $scope.schadenNew).then(function(data) {
                                CacheHistoryReseter.reset();
                                $state.go('app.versicherungDetail',{id: $scope.schaden.versicherungID});
                            });
                        }
                      }
                    ]
                });
            }
        }
    }

});
