appController.controller('versicherungAddedCtrl',function($scope, $http, $state, $stateParams, apiendpoint, CacheHistoryReseter) {

    $scope.versicherungId = $stateParams.id;

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
                provider: "xing",
                icon: "",
                name: "Xing"
            },
            {
                provider: "google",
                icon: "ion-social-googleplus",
                name: "Google+"
            }
        ]
    ];
    $scope.text = "Mit der App geteilt";
    $scope.url = "http://crowdinsurance.cloudf.de/#!/app/investitionInfo/'+$scope.versicherungId;

    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/'+$scope.versicherungId).success(function(response) {
        $scope.versicherung = response[0];
    });


    $scope.navigate = function (to) {
        CacheHistoryReseter.reset();
        switch (to) {
            case "hinzufügen":
                $state.go('app.versicherungAdd');
                break;
            case "Übersicht":
                $state.go('app.uebersicht');
                break;
        }
    };

});
