appController.controller('investitionInfoCtrl',function($scope, $http, $state, $stateParams, $location, moneyParser, moneyFormatter, apiendpoint, CacheHistoryReseter, datumFormatter){

    /* ID der erstellten Versicherung */
    $scope.versicherungID = $stateParams.id;

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
    $scope.text = "Diese Investition interessiert mich!";
    $scope.url = $location.absUrl();


    $scope.noComment = true;

    $scope.bewertung = [
        {count: 0},
        {count: 0},
        {count: 0}
    ];

    /* Laden der Versicherung */
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungID).success(function(response) {
        $scope.versicherung = response[0];
    }).error(function(error, status) {
        CacheHistoryReseter.reset();
        $state.go("app.error", {error: {message: error, status: status}});
    });

    /* Laden der Schadensfälle */
    $http.get(apiendpoint.url + '/api/smartinsurance/schadensfaelle/' + $scope.versicherungID).success(function(response) {
        $scope.schadensfaelle = response;
    });

    /* Laden des bereits gedeckten Betrags */
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungID + '/invest')
        .success(function(response) {
            if(angular.isDefined(response[0])) {
                $scope.investitionBetrag = response[0].suminvestition;
            } else {
                $scope.investitionBetrag = "0,00 €";
            }
        });

    /* Laden der Bewertung */
    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.versicherungID + '/bewertungen').success(function(response) {
       if(angular.isDefined(response[0])) {
            $scope.bewertung = response;
        }
    });

    /* Laden der Kommentare  */
    $http.get(apiendpoint.url + '/api/smartinsurance/kommentare/' + $scope.versicherungID).success(function(response) {
        if (angular.isDefined(response[0])) {
            $scope.comments = response;
            $scope.noComment= false;

            for (var i = 0; i < $scope.comments.length; i++) {
                $scope.comments[i].zeitpunkt = datumFormatter.formatDatum($scope.comments[i].zeitpunkt);
            }
        }
    });

    /* Berechnung des Gesamtschadens  */
    $scope.gesamtSchaden = function () {
        var gesamtSchaden = 0;
        if (angular.isDefined($scope.schadensfaelle)) {
            for (var i = 0; i < $scope.schadensfaelle.length; i++) {
                gesamtSchaden = gesamtSchaden + moneyParser.moneyparsen($scope.schadensfaelle[i].schadenshoehe);
            }
        }
        return moneyFormatter.formatMoney(gesamtSchaden);
    };

    /* Verweis auf die Schadensfälle */
    $scope.showSchadensfaelle = function() {
        $state.go("app.schadensfaelle", {id: $scope.versicherungID});
    };

    /* Verweis zur InvestitionAdd-Page */
    $scope.becomeInvestor = function () {
        $state.go("app.investitionAdd", {id: $scope.versicherungID});
    };

    /* Verweis auf das Profil des Versicherungsnehmers */
    $scope.showVersicherungsnehmer = function (investor) {
        $state.go('app.profilFremd',{investor: investor});
    };

});
