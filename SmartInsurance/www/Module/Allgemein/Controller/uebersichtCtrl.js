appController.controller('uebersichtCtrl', function($scope, $http, moneyParser, moneyFormatter){
    
    
    $scope.versicherungen= [];
    $scope.investitionen = [];
    
 
   $http.get('http://localhost:3000/api/smartinsurance/versicherung').success(function(response) {
         $scope.versicherungen = response.data;
    
   });
    
   $http.get('http://localhost:3000/api/smartinsurance/investition').success(function(response) {
         $scope.investitionen = response.data;
    
   });
    
    $scope.versicherungShow = function() {
        
    }
    
    $scope.investitionShow = function() {
        
    }
    
    $scope.versicherungengesamt = function() {
        var gesamtbetrag=0;
        var versicherungshoehe = 0;
        for (var i = 0; i < $scope.versicherungen.length; i++){
           versicherungshoehe = moneyParser.moneyparsen($scope.versicherungen[i].versicherungshoehe);
           gesamtbetrag += versicherungshoehe; 
        }
        return moneyFormatter.formatMoney(gesamtbetrag);
    };
    
    $scope.monatsbeitraggesamt = function() {
        var gesamtbetrag=0;
        for (var i = 0; i < $scope.versicherungen.length; i++){
           gesamtbetrag += moneyParser.moneyparsen($scope.versicherungen[i].beitrag); 
        }
        return moneyFormatter.formatMoney(gesamtbetrag);
    };
    
     $scope.investhoehegesamt = function() {
        var gesamtbetrag=0;
        for (var i = 0; i < $scope.investitionen.length; i++){
           gesamtbetrag += moneyParser.moneyparsen($scope.investitionen[i].investitionshoehe); 
        }
        return moneyFormatter.formatMoney(gesamtbetrag);
    };
    
    $scope.renditemax = function() {
        var gesamtbetrag=0;
        var monatsbeitrag = 0;
        var investitionshoehe = 0;
        var versicherungshoehe = 0;
       // for (var i = 0; i < $scope.investitionen.length; i++){
       //    monatsbeitrag = moneyParser.moneyparsen($scope.investitionen[i].beitrag);
       //    investitionshoehe = moneyParser.moneyparsen($scope.investitionen[i].investitionshoehe);
        //versicherungshoehe = moneyParser.moneyparsen($scope.investitionen[i].versicherungshoehe); 
         //  gesamtbetrag += monatsbeitrag * investitionshoehe /versicherungshoehe; 
       // }
        return moneyFormatter.formatMoney(gesamtbetrag);
    };
     
    
})