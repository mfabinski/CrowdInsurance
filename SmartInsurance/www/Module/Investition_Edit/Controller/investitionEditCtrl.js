appController.controller('investitionEditCtrl',function($scope, $http, $state, $stateParams, $ionicPopup, moneyParser, moneyFormatter, checkCurrencyFormat, apiendpoint, CacheHistoryReseter){

    $scope.investitionID = $stateParams.id;

    $scope.submitted = false;

    /* Laden der Investition und des gedeckten Betrages  */
    $http.get(apiendpoint.url + '/api/smartinsurance/investition/' + $scope.investitionID).success(function(response) {
        $scope.investition = response[0];
        $scope.investitionNeu = {
            investitionID: $stateParams.id,
            investitionshoehe : ""
        };

        $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.investition.versicherungID + '/invest')
            .success(function(response) {
                if(angular.isDefined(response[0])) {
                    $scope.investitionBetrag = response[0].suminvestition;
                } else {
                    $scope.investitionBetrag = "0,00 €";
                }
            })

    }).error(function(error, status) {
        CacheHistoryReseter.reset();
        $state.go("app.error", {error: {message: error, status: status}});
    });

    /* Speichern der Investitionshöhenänderung  */
    $scope.save = function(form) {

        $scope.submitted = true;
        if (form.$valid) {

        $scope.investitionNeu.investitionshoehe = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.investitionNeu.investitionshoehe));

            if($scope.investitionNeu.investitionshoehe != "0,00 €" && $scope.investitionNeu.investitionshoehe != "0,00 €" ){

                $ionicPopup.show({
                    title: 'Bestätigung',
                    template: 'Wollen Sie die Änderung speichern?',
                    buttons: [
                      { text: 'Cancel' },
                      {
                        text: '<b>Speichern</b>',
                        type: 'button-positive',
                        onTap: function(e) {
                             $http.post(apiendpoint.url + '/api/smartinsurance/investition', $scope.investitionNeu).then(function(data) {
                                CacheHistoryReseter.reset();
                                $state.go('app.investitionDetail',{id: $scope.investitionID});
                            });
                        }
                      }
                    ]
                });
            }
        }
    };

    /* Kündigen der Investition */
    $scope.cancelInvestition = function () {
        $ionicPopup.show({
            title: 'Bestätigung',
            template: 'Wollen Sie die Änderung speichern?',
            buttons: [
              { text: 'Cancel' },
              {
                text: '<b>Speichern</b>',
                type: 'button-positive',
                onTap: function(e) {
                    $http.post(apiendpoint.url + '/api/smartinsurance/investition/' + $scope.investitionID + '/kuendigen').then(function(data) {
                        CacheHistoryReseter.reset();
                        $state.go('app.investitionDetail',{id: $scope.investitionID});
                    });
                }
              }
            ]
        });
    };

    $scope.checkCurrency = checkCurrencyFormat;

    /* Validierung des Betragsfeldes */
    $scope.isNaN = function(field) {
        return (field.$error.required || field.$error.pattern) && (field.$touched || $scope.submitted);
    };


    /* Berechnung der maximalen monatlichen Rendite */
    $scope.calculateRendite = function(investitionshoehe) {
        var gesamtbetrag = 0;
        if(angular.isDefined($scope.investition)){
            var monatsbeitrag = moneyParser.moneyparsen($scope.investition.beitrag);
            var investitionshoehe = moneyParser.moneyparsen(investitionshoehe);
            var versicherungshoehe = moneyParser.moneyparsen($scope.investition.versicherungshoehe);
            gesamtbetrag = monatsbeitrag * investitionshoehe /versicherungshoehe;
        }
        return moneyFormatter.formatMoney(gesamtbetrag);
    };

    /* Berechnung der neuen maximalen monatlichen Rendite */
    $scope.calculateNewRendite = function(field) {
        if($scope.investitionNeu.investitionshoehe != "" && !(field.$error.pattern)){
            $scope.rendite = $scope.calculateRendite($scope.investitionNeu.investitionshoehe);
        }
    }




});
