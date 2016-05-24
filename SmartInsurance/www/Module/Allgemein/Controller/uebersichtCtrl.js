app.controller('uebersichtCtrl',function($scope, $http){
 
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
     
   
    
    
   /* $http.get('http://localhost:3000/api/smartinsurance/investition').success(function(data) {
        $scope.investition = data.data;
    });*/
    
})