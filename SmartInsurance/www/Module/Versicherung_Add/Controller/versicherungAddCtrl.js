app.controller('versicherungAddCtrl',function($scope, $http){
   
    $scope.selected_category ="Auto";
    $scope.insurance_category = ["Auto", "Haus", "Computer"];
    $http.get('http://localhost:3000/api/smartinsurance/versicherung/3').success(function(response) {
        $scope.versicherung = response.data[0];
     });
    
    $scope.versicherungAdd = function() {
        
    }
    
})