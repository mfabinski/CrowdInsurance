appController.controller('versicherungAddCtrl',function($scope, $http, $state, moneyParser, moneyFormatter, versicherungAdd){
   
    $scope.selected_category ="";
        
    $http.get('http://localhost:3000/api/smartinsurance/kategorien').success(function(response) {
         $scope.insurance_category = response;
    
    });
    
    
    
    versicherungAdd = {
        name:"asd",
//      kategorie: "",
        versicherungshoehe: "123", 
//        wert: "",
        beitrag: "123", 
        beschreibung: "yxc"
    };
    
   $scope.versicherung = versicherungAdd;
    
  
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
       
        
        $scope.versicherung.versicherungshoehe = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.versicherung.versicherungshoehe));
        $scope.versicherung.beitrag = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.versicherung.beitrag));
 //     $scope.versicherung.wert = moneyFormatter.formatMoney(moneyParser.moneyparsen($scope.versicherung.wert));
        
    // überprüfen das kein Wert 0 ist fehlt noch
        if (form.$dirty   && form.$valid){
            $scope.msg = 'Data sent: '+ JSON.stringify($scope.versicherung);
            
            $state.go('app.VersicherungCheck');
         } else {
            $scope.msg = 'Die Daten konnten nicht gesendet werden';
        }
    };
});

