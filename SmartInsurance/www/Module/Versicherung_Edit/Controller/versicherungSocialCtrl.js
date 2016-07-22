appController.controller('versicherungSocialCtrl',function($scope, $http, $state, $stateParams, apiendpoint, CacheHistoryReseter, datumFormatter){

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
    }).error(function(error, status) {
        CacheHistoryReseter.reset();
        $state.go("app.error", {error: {message: error, status: status}});
    });

     $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungId +'/person').success(function(response) {
        $scope.investorhelper = response;
        if(angular.isDefined($scope.investorhelper[0])) {

            var countInvestor = $scope.investorhelper.length;
            $scope.noInvestor = false;

            for (var i = 0; i < countInvestor/3 ; i++){
                var j=i*3;
                $scope.investoren.push([$scope.investorhelper[j],$scope.investorhelper[j+1],$scope.investorhelper[j+2]]);
            }
        }
    });

    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungId + '/bewertungen').success(function(response) {
         if(angular.isDefined(response[0])) {
            $scope.bewertung = response;
        }
    });


    $http.get(apiendpoint.url + '/api/smartinsurance/kommentare/' + $scope.versicherungId).success(function(response) {
            if (angular.isDefined(response[0])) {

                $scope.comments = response;
                $scope.noComment= false;

                for (var i = 0; i < $scope.comments.length; i++) {
                    $scope.comments[i].zeitpunkt = datumFormatter.formatDatum($scope.comments[i].zeitpunkt);
                }
            }
    });

    $scope.showPicture = function(investor) {
        if(angular.isDefined(investor)){
            return true;
        }
        return false;
    };

    $scope.writeComment = function(form) {
        if (form.$valid) {
            $http.post(apiendpoint.url + '/api/smartinsurance/kommentieren' , $scope.comment).success(function(data) {
                $scope.comments.splice(0, 0, data[0]);
                $scope.comment.text= "";
                $scope.noComment=false;

                $scope.comments[0].zeitpunkt = datumFormatter.formatDatum($scope.comments[0].zeitpunkt);

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
    };

    $scope.showInvestor = function (investor) {
        $state.go('app.profilFremd',{investor: investor});
    };

     $scope.showProfil = function () {

         $state.go('app.profil');
    }


});
