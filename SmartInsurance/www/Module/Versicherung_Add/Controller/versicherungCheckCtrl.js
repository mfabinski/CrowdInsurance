appController.controller('versicherungCheckCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, apiendpoint, CacheHistoryReseter){

    $scope.versicherung = $stateParams.versicherung;

    $scope.disable = true;


    $scope.versicherungCheck = function (){
        $http.post(apiendpoint.url + '/api/smartinsurance/versicherung', $scope.versicherung).success(function(response) {
            CacheHistoryReseter.reset();
            $state.go('app.versicherungAdded',{id: response[0].createversicherung});
        });
    }

});
