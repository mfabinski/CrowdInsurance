appController.controller('profilFremdCtrl',function($scope, $http, $state, $stateParams, apiendpoint, CacheHistoryReseter){

    /* Überprüfung, ob der Parameter gesetzt ist */
    if ($stateParams.investor == null) {
        CacheHistoryReseter.reset();
        $state.go("app.error", {error: {message: "Fehler beim erneuten Laden der Seite.", status: "404"}});
    } else {

        $scope.profilID = $stateParams.investor.personID;

        $http.get(apiendpoint.url + '/api/smartinsurance/profil/' + $scope.profilID).success(function(response) {
             $scope.profil = response[0];
        });

        $scope.versicherungen= [];
        $scope.bewertungen = [];
        $scope.avgBewertung = 0;
        $scope.noVersicherung = true;
        $scope.countVersicherung = 0;
        $scope.countInvestition = 0;

        /* Laden der Versicherungen des Profilbesitzers und der Bewertungen
           Berechnung der Gesamtbewertung */
        $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/person/' + $scope.profilID).success(function(response) {
            $scope.versicherungen = response;
            $scope.noVersicherung = false;

            $scope.countVersicherung = $scope.versicherungen.length;

            var getBewertung = function(i){
              $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungen[i].id + '/bewertungen').success(function(response) {
                    if(angular.isDefined(response[0])) {

                        $scope.bewertungen.push(response);

                        $scope.pos = Number($scope.bewertungen[i][1].count);
                        $scope.neg = Number($scope.bewertungen[i][2].count);

                        $scope.bewertung = $scope.pos - $scope.neg;

                        $scope.avgBewertung +=  $scope.bewertung;

                        $scope.versicherungen[i].bewertung = $scope.bewertung;
                    } else {
                        $scope.bewertungen.push($scope.bewertung = [
                            {count: 0},
                            {count: 0},
                            {count: 0}
                        ]);
                        $scope.versicherungen[i].bewertung = 0;
                    }
                });
            }

            for (var i = 0; i < $scope.versicherungen.length; i++){
              getBewertung(i);
            }
        });

        /* Laden der Investitionen des Profilbesitzers und Speicherung der Anzahl der Investitionen  */
        $http.get(apiendpoint.url + '/api/smartinsurance/investition/person/' + $scope.profilID).success(function(response) {
                $scope.countInvestition = response.length;
        });

        /* Verweis zur Informationsseite einer Investition  */
        $scope.versicherungShow = function(id) {
            $state.go("app.investitionInfo",{id: id});
        };
    }


});
