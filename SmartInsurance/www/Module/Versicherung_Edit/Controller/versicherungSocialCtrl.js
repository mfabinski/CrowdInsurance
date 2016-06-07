appController.controller('versicherungSocialCtrl',function($scope, $http, $state, $stateParams, apiendpoint){

    $scope.versicherungId = $stateParams.id;
    
    $scope.comment = "";
    
    $scope.noComment = false;
    
    $scope.noInvestor = true;
    
    $scope.investoren = [];

    
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungId).success(function(response) {
        $scope.versicherung = response[0];
    });
    
     $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungId +'/person').success(function(response) {
        $scope.investorhelper = response;
        var countInvestor = $scope.investorhelper.length;
        $scope.noInvestor = false;
         
        for (var i = 0; i < countInvestor/3 ; i++){
            var j=i*3;
            $scope.investoren.push([$scope.investorhelper[j],$scope.investorhelper[j+1],$scope.investorhelper[j+2]]);      
        }
         
    });

    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungId + '/bewertungen').success(function(response) {
        $scope.bewertung = response;
    });
    
    /*
    $http.get(apiendpoint.url).success(function(response) {
        $scope.comments = response;
    });
    */
    
    $scope.showPicture = function(investor) {
        if(angular.isDefined(investor)){
            return true;
        }
        return false;
    }
    
    $scope.writeComment = function(form) {
        if (form.$valid) {
         /*   $http.post(apiendpoint.url , $scope.comment).then(function(data) {
                console.log("erfolgreich");
            });  */  
            console.log("erfolgreich");
            $scope.noComment=false;
        } else {
            $scope.noComment=true;
        }
    };
    
    $scope.showInvestor = function () {
      // Verweis auf Investor personID übergeben        
    };

   

});
