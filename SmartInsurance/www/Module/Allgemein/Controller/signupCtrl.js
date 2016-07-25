appController.controller('signupCtrl', function($scope,  CacheHistoryReseter, $http, $ionicPopup, $state, moneyParser, moneyFormatter, apiendpoint) {
    $scope.form = {};
    $scope.token;
    $scope.submitted = false;
    $scope.samePw = false;

    $scope.isInvalid = function(field){
        console.log(field);
        return field.$error.required && (field.$touched || $scope.submitted);
    };

    $scope.isSamePw = function(field){
        console.log(field);
        if ($scope.form.passwort == $scope.form.passwortWiederholung) {
            $scope.samePw = true;
            return false;
        }
        else {
            $scope.samePw = false;
            return true;
        }
    };

    $scope.signup = function (signupform) {

        if (signupform.$valid && $scope.samePw && $scope.form.iban.length<35 && $scope.form.iban.length> 13 && $scope.form.bic.length>7 && $scope.form.bic.length<12) {
            var data = {
                email: $scope.form.email,
                password: $scope.form.passwort
            };
            var url = apiendpoint.backend + "/api/smartbackend/auth/signup";
            $http.post(url, data)
                .then(function (response) {
                    console.log("Signup erfolgreich");
                    $scope.token = response.data.token;
                  //  $http.defaults.headers.common['Authorization'] = "Bearer " + $scope.token;
                    url = apiendpoint.url + "/api/smartinsurance/profil";
                    data = {
                        personID: response.data.id,
                        name: $scope.form.nachname,
                        prename: $scope.form.vorname,
                        email: $scope.form.email,
                        iban : $scope.form.iban,
                        bic : $scope.form.bic,
                        bankinstitut : $scope.form.bank,
                        birthday:"01.01.1999"
                    };
                    $http.post(url, data).then(function(response)
                        {
                            console.log("Profil erstellt");
                            $ionicPopup.alert({
                                title: 'Registrierung',
                                template: 'Sie haben sich erfolgreich registriert.'
                            });
                                console.log('Thank you for not eating my delicious ice cream cone');
                                $state.go('app.uebersicht')
                            CacheHistoryReseter.reset();
                        },
                        function(error){
                            console.log("Error beim Erstellen des Smartinsurance-Profils");
                        }
                    )
                }, function (error) {
                    $ionicPopup.alert({
                        title: 'Registrierung',
                        template: 'Der Nutzer existiert bereits'
                    });
                    console.log("Registrierung ist fehlgeschlagen");
                });
        }
    }


});

