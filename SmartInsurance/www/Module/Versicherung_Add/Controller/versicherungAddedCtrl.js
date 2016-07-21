appController.controller('versicherungAddedCtrl',function($scope, $http, $state, $stateParams, $location, apiendpoint, CacheHistoryReseter) {

    /* Speichern der übergebenen VersicherungsID */
    $scope.versicherungId = $stateParams.id;

    /*Social-Porvider */
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
    $scope.text = "Ich suche Investoren für meine Versicherung";
    $scope.url = $location.absUrl();

    /* Laden der Versicherung  */
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/'+$scope.versicherungId).success(function(response) {
        $scope.versicherung = response[0];
    }).error(function(error, status) {
        CacheHistoryReseter.reset();
        $state.go("app.error", {error: {message: error, status: status}});
    });

    /* Navigation abhängig von dem getätigten Button  */
    $scope.navigate = function (to) {
        CacheHistoryReseter.reset();
        switch (to) {
            case "hinzufügen":
                $state.go('app.versicherungAdd');
                break;
            case "Übersicht":
                $state.go('app.uebersicht');
                break;
            case "Detail":
                $state.go('app.versicherungDetail',{id: $scope.versicherungId});
        }
    };


});
