appController.controller('errorCtrl', function($scope, $http, $state, $stateParams,  moneyParser, moneyFormatter, apiendpoint){

    $scope.error = $stateParams.error;
});
