appController.controller('loginCtrl', function($scope, $ionicPopup, $http, $state, moneyParser, moneyFormatter, apiendpoint) {

        $scope.daten = {};
        $scope.daten.email = "example@mail.com";
        $scope.daten.passwort = "1234";
        $scope.form = {};



        $scope.register = function () {
           $state.go('app.signup')
        };

        $scope.isValidPw = function(field) {
            if (field.$touched) {
                if (($scope.daten.passwort.length < 4 || $scope.daten.passwort.length > 32)) {
                    return true;
                }
                else {
                    return false;
                }
            }
            else {
                return false;
            }

        };


        $scope.login = function () {

            var url = apiendpoint.backend +"/api/smartbackend/auth/email/";
            var data = {
                email: $scope.daten.email,
                password: $scope.daten.passwort
            }
                $http.post(url, data)
                .then(function(result) {
    //                userService.userContext.saveToken(result.data);
                    $scope.token = result.data;
                    $http.defaults.headers.common['Authorization'] = "Bearer "+ result.data;
                },function(error) {
                    console.log("Login fehlgeschlagen");
                    $ionicPopup.alert({
                        title: 'Login',
                        template: 'Sie haben eine ungültige Login Kombination eingegeben'

                    });
                })
        };

        $scope.auth = function (provider) {
                if (provider === "google") {            // Signed in with Google.
                $http({
                    method: "POST",
                    url: "https://accounts.google.com/o/oauth2/auth?client_id=905287479418-n5ir9kdtmqc41urfo3adj0adk79dcjok.apps.googleusercontent.com&redirect_uri=905287479418-n5ir9kdtmqc41urfo3adj0adk79dcjok.apps.googleusercontent.com'&scope=profile,email&response_type=code&access_type=offline"
                })
                    .then(function (result) {
                        console.log(result.data);
                     //   userService.userContextdecide_between_redirect(result.data);
                    }, function (error) {

                        console.log('Error: ' + error);
                    });
            }
            else { //FACEBOOK
                $auth.authenticate(provider).then(function (response) {
                    console.log($auth.getToken());
                    console.log($auth.getPayload());
                    $http({
                        method: "GET",
                        url: smartbackendUrl + "/api/smartbackend/auth/" + provider + "/",
                        params: {access_token: $auth.getToken()}
                    })
                        .then(function (result) {
                                console.log('yes im ok');
                                userService.userContext.decide_between_redirect(result.data);
                            }, function (error) {
                                userService.wrongLoginData();
                                console.log('Error: ' + error);
                            }
                        )
                        .catch(function (response) {
                            userService.SocialLoginFailed();
                        });

                })

            }

        }
    }
    );

