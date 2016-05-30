appController.controller('versicherungAddCtrl',function($scope, $http, moneyParser, moneyFormatter){
   
    $scope.selected_category ="";
    $scope.insurance_category = ["Auto", "Haus", "Computer"];
    
    $scope.versicherung = {
        name:"",
//      kategorie: "",
        versicherungshoehe: "", 
//      wert: "",
        beitrag: "", 
        beschreibung: ""
    }
   
    
    $scope.versicherungAdd = function() {
    /*    $http.post('http://localhost:3000/api/smartinsurance/versicherung', $scope.versicherung).then(function(data) {
            $scope.msg = 'Erfolgreich abgeschlossen.';
        });  */
        $scope.versicherung.versicherungshoehe = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.versicherung.versicherungshoehe));
        $scope.versicherung.beitrag = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.versicherung.beitrag));
        $scope.msg = 'Data sent: '+ JSON.stringify($scope.versicherung);
    }
});

