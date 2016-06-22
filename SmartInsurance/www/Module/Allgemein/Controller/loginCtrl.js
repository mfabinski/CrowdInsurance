appController.controller('loginCtrl', function($scope, $http, $state, moneyParser, moneyFormatter, apiendpoint) {

        $scope.daten = {};
        $scope.daten.email = "example@mail.com";
        $scope.daten.password = "1234";
        $scope.form = {};




        $scope.register = function () {
           $state.go('app.signup')
        };



        $scope.login = function () {
/*
            $http({method: "POST", url:smartbackend_ip +"/api/smartbackend/auth/email/", params:{email:$scope.formData.email,password: $scope.formData.password}})
                .then(function(result) {
                    userService.userContext.saveToken(result.data);
                    $http.defaults.headers.common['Authorization'] = "Bearer "+userService.userContext.user.access_token;

                    $http({method: "GET", url:smartbackend_ip +userService.userContext.urlLocation.user.getUserData, params:{}})
                        .then(function(result) {
                                userService.userContext.saveUserData(result.data);
                                userService.userContext.decide_between_redirect(result.data);
                            }
                            ,function(error) {
                                userService.userContext.wrongLoginData();
                            })
                },function(error) {
                    userService.userContext.wrongLoginData();
                })

        };
        */
        $scope.auth = function (provider) {
            /*    if (provider === "google") {            // Signed in with Google.
                $http({
                    method: "POST",
                    url: "https://accounts.google.com/o/oauth2/auth?client_id=905287479418-n5ir9kdtmqc41urfo3adj0adk79dcjok.apps.googleusercontent.com&redirect_uri=905287479418-n5ir9kdtmqc41urfo3adj0adk79dcjok.apps.googleusercontent.com'&scope=profile,email&response_type=code&access_type=offline"
                })
                    .then(function (result) {
                        console.log(result.data);
                        userService.userContextdecide_between_redirect(result.data);
                    }, error(function (error) {

                        console.log('Error: ' + error);
                    }));
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
            */
        }
    }
    );

