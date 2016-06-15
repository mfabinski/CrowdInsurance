appController.controller('investitionInfoCtrl',function($scope, $http, $state, $stateParams, $location, moneyParser, moneyFormatter, apiendpoint){

    $scope.versicherungID = $stateParams.id;

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
    $scope.url = $location.absUrl();

    $scope.noComment = true;

    $scope.bewertung = [
        {count: 0},
        {count: 0},
        {count: 0}
    ];

    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungID).success(function(response) {
        $scope.versicherung = response[0];
    });


    $http.get(apiendpoint.url + '/api/smartinsurance/schadensfaelle/' + $scope.versicherungID).success(function(response) {
        $scope.schadensfaelle = response;
    });


    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungID + '/invest')
        .success(function(response) {
            if(angular.isDefined(response[0])) {
                $scope.investitionBetrag = response[0].suminvestition;
            } else {
                $scope.investitionBetrag = "0,00 €";
            }
        });

    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungID + '/bewertungen').success(function(response) {
       if(angular.isDefined(response[0])) {
            $scope.bewertung = response;
        }
    });

    $http.get(apiendpoint.url + '/api/smartinsurance/kommentare/' + $scope.versicherungID).success(function(response) {
        if (angular.isDefined(response[0])) {
            $scope.comments = response;
            $scope.noComment= false;
        }
    });


    $scope.gesamtSchaden = function () {
        var gesamtSchaden = 0;
        if (angular.isDefined($scope.schadensfaelle)) {
            for (var i = 0; i < $scope.schadensfaelle.length; i++) {
                gesamtSchaden = gesamtSchaden + moneyParser.moneyparsen($scope.schadensfaelle[i].schadenshoehe);
            }
        }
        return moneyFormatter.formatMoney(gesamtSchaden);
    };


    $scope.showSchadensfaelle = function() {
        $state.go("app.schadensfaelle", {id: $scope.versicherungID});
    };

    $scope.becomeInvestor = function () {
        $state.go("app.investitionAdd", {id: $scope.versicherungID});
    };

});
