appController.controller('versicherungAddCtrl',function($scope, $http, moneyParser, moneyFormatter){
   
    $scope.selected_category ="";
    $scope.insurance_category = ["Auto", "Haus", "Computer", "Smartphone", "Sonstiges"];
    
    $scope.versicherung = {
        name:"",
//      kategorie: "",
        versicherungshoehe: "", 
//        wert: "",
        beitrag: "", 
        beschreibung: ""
    }
    

    
  
    $scope.isInvalid = function(field){

        return field.$invalid && field.$touched;
     };
    
    $scope.isNull = function(field){

        return (field.$modelValue == "0,00 €");
    };
    
    $scope.isNaN = function(field) {
        
        if(angular.isDefined(field.$modelValue)){
            field.$modelValue = moneyFormatter.formatMoney(moneyParser.moneyparsen(field.$modelValue)); 

            if(field.$modelValue == "0,00 €"){
                return true && field.$touched;
            } 
        }
        return false;     
    };



    
    $scope.versicherungAdd = function(form) {
    /*    $http.post('http://localhost:3000/api/smartinsurance/versicherung', $scope.versicherung).then(function(data) {
            $scope.msg = 'Erfolgreich abgeschlossen.';
        });  */    
        
        $scope.versicherung.versicherungshoehe = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.versicherung.versicherungshoehe));
        $scope.versicherung.beitrag = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.versicherung.beitrag));
 //     $scope.versicherung.wert = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.versicherung.wert));
        
   
        if (form.$dirty   && form.$valid){
            $scope.msg = 'Data sent: '+ JSON.stringify($scope.versicherung);
         } else {
            $scope.msg = 'Die Daten konnten nicht gesendet werden';
        }
    };
});

