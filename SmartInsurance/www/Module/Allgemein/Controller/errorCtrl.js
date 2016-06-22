appController.controller('errorCtrl', function($scope, $stateParams, CacheHistoryReseter){

    $scope.error = $stateParams.error;

    CacheHistoryReseter.reset();

});
