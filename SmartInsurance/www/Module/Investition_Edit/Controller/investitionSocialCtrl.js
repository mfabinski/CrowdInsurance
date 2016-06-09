appController.controller('investitionSocialCtrl',function($scope, $http, $state, $stateParams, apiendpoint){

    $scope.investitionId = $stateParams.id;
    
    $scope.noComment = true;
    
    $scope.investoren = [];

    
    $http.get(apiendpoint.url + '/api/smartinsurance/investition/' + $scope.investitionId).success(function(response) {
        $scope.investition = response[0];
        
         $scope.comment = {
                versicherungID: $scope.investition.versicherungID,
                text: ""
        };
        
        $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.investition.versicherungID +'/person').success(function(response) {
            $scope.investorhelper = response;
            var countInvestor = $scope.investorhelper.length;
            $scope.noInvestor = false;
         
            for (var i = 0; i < countInvestor/3 ; i++){
                var j=i*3;
                $scope.investoren.push([$scope.investorhelper[j],$scope.investorhelper[j+1],$scope.investorhelper[j+2]]);      
            }
         
        });

        $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.investition.versicherungID + '/bewertungen').success(function(response) {
            $scope.bewertung = response;
        })
        .error(function(response) {
             $scope.bewertung = [
                {count: 0},
                {count: 0},
                {count: 0}
            ]          
        })
        
        $http.get(apiendpoint.url + '/api/smartinsurance/kommentare/' + $scope.investition.versicherungID).success(function(response) {
            $scope.comments = response;
            $scope.noComment=false;
        });
    });
    
     
    
    
    $scope.showPicture = function(investor) {
        if(angular.isDefined(investor)){
            return true;
        }
        return false;
    }
    
    $scope.writeComment = function(form) {
        if (form.$valid) {
            $http.post(apiendpoint.url + '/api/smartinsurance/kommentieren' , $scope.comment).then(function(data) {
            });  
            $scope.noComment=false;
        } else {
            $scope.noComment=true;
        }
    };
    
    $scope.evaluate = function (bewertung) {
        switch(bewertung) {
            case "positiv":
                // Post Bewertung positiv
                break;
            case "negativ":
                // Post Bewertung negativ
                break;
        }
    }
    
    $scope.showInvestor = function (id) {
      // Verweis auf Investor personID übergeben        
    };
    
    $scope.showProfil = function (id) {
        // Verweis auf Versicherungsnehmer personID übergeben 
    }

   

});
