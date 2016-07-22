appController.controller('investitionSocialCtrl',function($scope, $http, $state, $stateParams, apiendpoint, CacheHistoryReseter, datumFormatter){

    $scope.investitionId = $stateParams.id;

    $scope.noComment = true;

    $scope.comments = [];

    $scope.investoren = [];

    $scope.submitted= false;

    $scope.bewertung = [
        {count: 0},
        {count: 0},
        {count: 0}
    ];

    /* Laden der Investition, der Investoren, der Bewertungen und der Kommentare  */
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
            if(angular.isDefined(response[0])) {
                $scope.bewertung = response;
            }

        });


        $http.get(apiendpoint.url + '/api/smartinsurance/kommentare/' + $scope.investition.versicherungID).success(function(response) {
            if (angular.isDefined(response[0])) {
                $scope.comments = response;
                $scope.noComment= false;
                for (var i = 0; i < $scope.comments.length; i++) {
                    $scope.comments[i].zeitpunkt = datumFormatter.formatDatum($scope.comments[i].zeitpunkt);
                }
            }
        });
    }).error(function(error, status) {
        CacheHistoryReseter.reset();
        $state.go("app.error", {error: {message: error, status: status}});
    });



    /* Entscheidung, ob das Bild zu dem Investor angezeigt wird  */
    $scope.showPicture = function(investor) {
        if(angular.isDefined(investor)){
            return true;
        }
        return false;
    };

    /* Kommentar schreiben */
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

    /* Überprüfung, ob das Kommentarfeld gefüllt ist  */
    $scope.isFilled = function (field) {
        if(field.$error.required && $scope.submitted) {
            return false;
        }
        return true;
    };

    /* Verweis auf das Profil des Investors */
    $scope.showInvestor = function (investor) {
        $state.go('app.profilFremd',{investor: investor});
    };

    /* Verweis auf das Profil des Versicherungsnehmers */
    $scope.showVersicherer = function () {
        var investor = {
            personID: $scope.investition.vpersonID
        }
        $state.go('app.profilFremd',{investor: investor});
    };


    /* Bewertung der Versicherung */
    $scope.bewerten = function(thumb){
        var data = {};
        data.bewertung = thumb;
        $http.put(apiendpoint.url + '/api/smartinsurance/investition/' + $scope.investitionId + '/bewertung', data)
            .then(function (response) {
                    console.log("erfolgreich");
                }, function(response){
                    console.log("fail");
                }
            ).then(function(response) {
            $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.investition.versicherungID + '/bewertungen').success(function (response) {
                if(angular.isDefined(response[0])) {
                    $scope.bewertung = response;
                } else {
                     $scope.bewertung = [
                        {count: 0},
                        {count: 0},
                        {count: 0}
                    ]
                }
            })
        }).then(function(){
            $scope.$apply;
        })

        ;
    };


});








