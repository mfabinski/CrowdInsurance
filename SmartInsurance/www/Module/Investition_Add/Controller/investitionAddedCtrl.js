appController.controller('investitionAddedCtrl',function($scope, $http, $state, $stateParams, $location, moneyParser, moneyFormatter, apiendpoint, CacheHistoryReseter){

    /* ID der erstellten Investition */
    $scope.investitionID = $stateParams.id;

    /* Social-Provider */
    $scope.provider = [
        [
            {
                provider: "facebook",
                icon: "ion-social-facebook",
                name: "Facebook"
            },
            {
                provider: "telegram",
                icon: "ion-ios-navigate",
                name: "Telegram"
            },
            {
                provider: "twitter",
                icon: "ion-social-twitter",
                name: "Twitter"
            }
        ],
        [
            {
                provider: "email",
                icon: "ion-android-mail",
                name: "E-Mail"
            },
            {
                provider: "linkedin",
                icon: "ion-social-linkedin",
                name: "LinkedIn"
            },
            {
                provider: "google",
                icon: "ion-social-googleplus",
                name: "Google+"
            }
        ]
    ];
    $scope.text = "Ich habe eine Investition getätigt";
    $scope.url = $location.absUrl();

    /* Laden der Investition */
    $http.get(apiendpoint.url + '/api/smartinsurance/investition/' + $scope.investitionID).success(function(response) {
        $scope.investition = response[0];
    }).error(function(error, status) {
        CacheHistoryReseter.reset();
        $state.go("app.error", {error: {message: error, status: status}});
    });



    /* Navigation abhängig davon, welcher Button getätigt wurde */
    $scope.navigate = function (to) {
        CacheHistoryReseter.reset();
        switch (to) {
            case "suchen":
                $state.go('app.investitionSearch');
                break;
            case "Übersicht":
                $state.go('app.uebersicht');
                break;
            case "Detail":
                $state.go('app.investitionDetail',{id: $scope.investitionID});
                break;
        }

    };

});
