appController.controller('signupCtrl', function($scope,  $http, $state, moneyParser, moneyFormatter, apiendpoint) {
    $scope.form = {};

    $scope.submitted = false;


    $scope.isInvalid = function(field){
        console.log(field);
        return field.$error.required && (field.$touched || $scope.submitted);
    };


  /*  $scope.isNaN = function(field) {
        return field.$error.pattern && (field.$touched || $scope.submitted);
    };
*/


    $scope.signup = function () {

        $scope.submitted= true;

/*
        $http({
                 method: "POST",
                 url: smartbackendUrl + "/api/smartbackend/auth/signup",
                 params: {email: $scope.form.email, password: $scope.form.password}
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


 */                }


    }


);

