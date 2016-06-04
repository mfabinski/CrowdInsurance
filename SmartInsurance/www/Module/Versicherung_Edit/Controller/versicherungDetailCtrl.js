appController.controller('versicherungDetailCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter){
    
    
    $scope.versicherungId = $stateParams.id;
    
    $scope.noInvestor = true;
   
    
    $http.get('http://localhost:3000/api/smartinsurance/versicherung/' + $scope.versicherungId).success(function(response) {
         $scope.versicherung = response[0];
    });
    
    $http.get('http://localhost:3000/api/smartinsurance/versicherung/' + $scope.versicherungId +'/person').success(function(response) {
        $scope.investoren = response;
        $scope.noInvestor = false;
    
    });
    /*
    $http.get('http://localhost:3000/api/smartinsurance/schadensfaelle/' + $scope.versicherungId).success(function(response) {
         $scope.schadensfaelle = response;
    
    });
    */
    
    $http.get('http://localhost:3000/api/smartinsurance/versicherung/' + $scope.versicherungId + '/invest')
        .success(function(response) {
            $scope.investitionBetrag = response[0].suminvestition;
        })
        .error(function(response) {
            $scope.investitionBetrag = "0,00 €";
        })
    
   /* 
    $scope.gesamtSchaden = function () {
        var gesamtSchaden = 0;
        if (angular.isDefined($scope.schadensfaelle)) {
            for (var i = 0; i < $scope.schadensfaelle.length; i++) {
                gesamtSchaden = gesamtSchaden + $scope.schadensfaelle.betrag;
            };
        };
        return gesamtSchaden;
    };
    */
    
    
    $scope.showInvestor = function () {
        // Verweis auf die Seite des Investors
    };
    
    $scope.editVersicherung = function () {
        // Verweis auf Versicherung bearbeiten
    };
    
    $scope.showSchadensfaelle = function() {
        $state.go("app.schadensfaelle", {id: $scope.versicherung.id});
    };
    
    $scope.addSchadensfall = function () {
        // Verweise auf Schadensfall melden
    };
    
    $scope.showSocial = function () {
        // Verweis auf den Social-Bereich  
    };
    
});