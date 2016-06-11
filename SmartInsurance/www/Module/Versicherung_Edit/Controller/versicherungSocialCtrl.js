appController.controller('versicherungSocialCtrl',function($scope, $http, $state, $stateParams, apiendpoint){

    $scope.versicherungId = $stateParams.id;

    $scope.comment = {
                versicherungID: $scope.versicherungId,
                text: ""
        };

    $scope.noComment = true;

    $scope.comments = [];

    $scope.noInvestor = true;

    $scope.investoren = [];

    $scope.submitted = false;

     $scope.bewertung = [
                {count: 0},
                {count: 0},
                {count: 0}
    ];


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
         $scope.bewertung= response;

        });


    $http.get(apiendpoint.url + '/api/smartinsurance/kommentare/' + $scope.versicherungId).success(function(response) {
            $scope.comments = response;
            $scope.noComment= false;
    });

    $scope.showPicture = function(investor) {
        if(angular.isDefined(investor)){
            return true;
        }
        return false;
    }

    $scope.writeComment = function(form) {
        if (form.$valid) {
            $http.post(apiendpoint.url + '/api/smartinsurance/kommentieren' , $scope.comment).success(function(data) {
                $scope.comments.splice(0, 0, data[0]);
                $scope.comment.text= "";
                $scope.noComment=false;
            });
            $scope.submitted = false;
        } else {
            $scope.submitted = true;
        }
    };

    $scope.isFilled = function (field) {
        if(field.$error.required && $scope.submitted) {
            return false;
        }
        return true;
    }

    $scope.showInvestor = function (id) {
      // Verweis auf Investor personID übergeben
    };

     $scope.showProfil = function (id) {
        // Verweis auf Versicherungsnehmer personID übergeben
    }


});
