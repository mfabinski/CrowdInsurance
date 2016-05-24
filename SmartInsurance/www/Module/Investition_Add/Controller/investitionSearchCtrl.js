app.controller('investitionSearchCtrl',function($scope, $http){
    
    $http.get('http://localhost:3000/api/smartinsurance/investition').success(function(response) {
         $scope.investitionen = response.data;
    
    });
    
    $scope.investitionShow = function() {
        
    }
    
    $scope.investitionSearch = function() {
        
    }
    
    
    
})