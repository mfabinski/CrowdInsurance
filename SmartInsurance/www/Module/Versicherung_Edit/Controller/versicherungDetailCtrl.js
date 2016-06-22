appController.controller('versicherungDetailCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, datumFormatter, apiendpoint, Status){


    $scope.versicherungId = $stateParams.id;

    $scope.noInvestor = true;


    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungId).success(function(response) {
         $scope.versicherung = Status.versicherung(response)[0];
    }).error(function(error, status) {
        $state.go("app.error", {error: {message: error, status: status}});
    });

    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungId +'/person').success(function(response) {
        if(angular.isDefined(response[0])) {
            $scope.investoren = response;
            for (var i=0;i<$scope.investoren.length;i++) {
                $scope.investoren[i].abschlussZeitpunkt = datumFormatter.formatDatum($scope.investoren[i].abschlussZeitpunkt);
            }
            $scope.noInvestor = false;
        }
    });


    $http.get(apiendpoint.url + '/api/smartinsurance/schadensfaelle/' + $scope.versicherungId).success(function(response) {
         $scope.schadensfaelle = response;

    });


    $scope.gesamtSchaden = function () {
        var gesamtSchaden = 0;
        if (angular.isDefined($scope.schadensfaelle)) {
            for (var i = 0; i < $scope.schadensfaelle.length; i++) {
                gesamtSchaden = gesamtSchaden + moneyParser.moneyparsen($scope.schadensfaelle[i].schadenshoehe);
            }
        }
      return moneyFormatter.formatMoney(gesamtSchaden);
    };

    $scope.wirdGekuendigt = function (gekuendigt) {
        if (gekuendigt == true) {
            return "ja"
        }
    }



    $scope.showInvestor = function () {
        // Verweis auf die Seite des Investors
    };

    $scope.editVersicherung = function () {
        $state.go("app.versicherungEdit", {id: $scope.versicherung.id});
    };

    $scope.showSchadensfaelle = function() {
        $state.go("app.schadensfaelle", {id: $scope.versicherung.id});
    };

    $scope.addSchadensfall = function () {
        $state.go("app.schadensfallMelden", {schaden: {versicherungID: $scope.versicherung.id}});
    };

    $scope.showSocial = function () {
        $state.go("app.versicherungSocial", {id: $scope.versicherung.id});
    };

});
