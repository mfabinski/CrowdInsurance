appController.controller('signupCtrl', function($scope,  $http, $ionicPopup, $state, moneyParser, moneyFormatter, apiendpoint) {
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

    $scope.isName = function(field) {


        return truefield.$error.pattern && (field.$touched || $scope.submitted);
    };



    $scope.signup = function (signupform) {

        if (signupform.$valid && $scope.samePw) {
            var data = {
                email: $scope.form.email,
                password: $scope.form.passwort
            };
            var url = apiendpoint.backend + "/api/smartbackend/auth/signup";
            $http.post(url, data)
                .then(function (response) {
                    console.log("erfolgreich");
                    $scope.token = response.data;
                    $http.defaults.headers.common['Authorization'] = "Bearer " + response.data;
                    url = apiendpoint.url + "/api/smartinsurance/profil";
                    data = {
                        personID: "TODO",
                        name: $scope.form.nachname,
                        prename: $scope.form.vorname,
                        email: $scope.form.email,
                        iban : $scope.form.iban,
                        bic : $scope.form.bic,
                        bankinstitut : $scope.form.bank

                    };
                    http.post(url, data).then(function(response)
                    {
                        console.log("Profil erstellt");
                    },
                    function(error){
                    console.log("Error beim Erstellen des Smartinsurance-Profils");
                    }
                    )

                    var alertPopup = $ionicPopup.alert({
                        title: 'Registrierung',
                        template: 'Sie haben sich erfolgreich registriert.'

                    });

                    alertPopup.then(function(res) {
                        console.log('Thank you for not eating my delicious ice cream cone');
                        $state.go('app.uebersicht')
                    });

                }, function (error) {
                    $ionicPopup.alert({
                        title: 'Registrierung',
                        template: 'Sie haben sich erfolgreich registriert.'
                    });
                    console.log("Registrierung ist fehlgeschlagen");
                });


        }

/*                 $http({
                 method: "GET",
                 url: apiendpoint.backend + userService.userContext.urlLocation.user.getUserData,
                 params: {}
                 })
                 .then(function (result) {
                 userService.userContext.saveUserData(result.data);
                 userService.userContext.decide_between_redirect(result.data);
                 }
                 , function (error) {
                 userService.userContext.wrongLoginData();
                 })

                 */






    }


});

