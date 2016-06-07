appController.controller('versicherungCheckCtrl',function($scope, $http, $state, $stateParams, moneyParser, moneyFormatter, apiendpoint){

    $scope.versicherung = $stateParams.versicherung;

    $scope.disable = true;

    $scope.kosten = "Das Erstellen des Versicherungsangebots kostet einmalig 5 €";

    $scope.versicherungCheck = function (){
        console.log(JSON.stringify($scope.versicherung));
        $http.post(apiendpoint.url + '/api/smartinsurance/versicherung', $scope.versicherung).success(function(response) {
            $state.go('app.versicherungAdded',{id: response[0].createversicherung});
        });
    }

});
