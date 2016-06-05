appController.controller('versicherungCheckCtrl',function($scope, $http, $state, moneyParser, moneyFormatter, versicherungAdd, apiendpoint){

    $scope.versicherung = versicherungAdd.getVersicherung();

    $scope.disable = true;

    $scope.kosten = "Das Erstellen des Versicherungsangebots beträgt einmalig 5 €";

    $scope.versicherungCheck = function (){
        /*$http.post(apiendpoint.url + '/api/smartinsurance/versicherung', $scope.versicherung).then(function(data) {
            versicherungAdd.setVersicherung({});
            $state.go('app.versicherungAdded');
        });  */
        versicherungAdd.reset();
        $state.go('app.versicherungAdded');
    }

});
