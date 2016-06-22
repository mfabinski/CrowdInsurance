appController.controller('signupCtrl', function($scope,  $http, $state, moneyParser, moneyFormatter, apiendpoint) {
    $scope.form = {};

    $scope.signup = function () {
            
        $http({
                 method: "POST",
                 url: smartbackendUrl + "/api/smartbackend/auth/signup",
                 params: {email: $scope.daten.email, password: $scope.daten.password}
                 })
                 .then(function (result) {
                 userService.userContext.saveToken(result.data);
                 $http.defaults.headers.common['Authorization'] = "Bearer " + userService.userContext.user.access_token;

                 $http({
                 method: "GET",
                 url: smartbackendUrl + userService.userContext.urlLocation.user.getUserData,
                 params: {}
                 })
                 .then(function (result) {
                 userService.userContext.saveUserData(result.data);
                 userService.userContext.decide_between_redirect(result.data);
                 }
                 , function (error) {
                 userService.userContext.wrongLoginData();
                 })
                 }, function (error) {
                 userService.userContext.wrongLoginData();
                 })

                 }*/


    }})

