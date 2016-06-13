var appController = angular.module('smartInsurance.controllers',  []);

appController.service('moneyParser', [function(){
    this.moneyparsen = function(betrag) {
        if(betrag.search(" €") != -1){
            betrag = betrag.substring(0, (betrag.length -2));
        }
        betrag = betrag.replace(/\./g,'');
        betrag = betrag.replace(',','.');
        betrag = parseFloat(betrag);
        return betrag;
    }
}]);

appController.service('moneyFormatter', [ function(){
    this.formatMoney = function(zahl){
        var n = zahl,
            c =  2,
            d =  ",",
            t = ".",
            s = n < 0 ? "-" : "",
            i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "",
            j = (j = i.length) > 3 ? j % 3 : 0;
        return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "") + " €";
    }
}]);

appController.service('selectFormatter', [ function(){
    this.formatSelect = function (select) {
        select.replace("/n","");
        select = select.trim();
        return select;
    }
}]);



appController.factory("checkCurrencyFormat",function(){
    return /^(([1-9]{1}[0-9]{0,2}(\.{0,1}[0-9]{3})*,{0,1}[0-9]{0,2}|[0][,][0-9][1-9]|[0][,][1-9][0-9]{0,1})(€| €){0,1})$/;
});

appController.service('datumFormatter', [ function(){
    this.formatDatum = function (zeitstempel) {
        var datum = zeitstempel.substr(8,2) +'.' + zeitstempel.substr(5,2) + '.' + zeitstempel.substr(0,4);
        var uhrzeit = zeitstempel.substr(11,5) + ' Uhr';
        return datum + ' ' + uhrzeit;
    }

}]);

appController.service('CacheHistoryReseter', ['$ionicHistory', function($ionicHistory){
    this.reset = function () {
        $ionicHistory.clearCache();
        $ionicHistory.clearHistory();
        $ionicHistory.nextViewOptions({ disableBack: true, historyRoot: true });
    }

}]);


//Beispiel-Code für ein Login-Modul kann noch entfernt werden

/*app.controller('AppCtrl', function($scope, $ionicModal, $timeout) {

 // With the new view caching in Ionic, Controllers are only called
 // when they are recreated or on app start, instead of every page change.
 // To listen for when this page is active (for example, to refresh data),
 // listen for the $ionicView.enter event:
 //$scope.$on('$ionicView.enter', function(e) {
 //});

 // Form data for the login modal
 $scope.loginData = {};

 // Create the login modal that we will use later
 $ionicModal.fromTemplateUrl('templates/login.html', {
 scope: $scope
 }).then(function(modal) {
 $scope.modal = modal;
 });

 // Triggered in the login modal to close it
 $scope.closeLogin = function() {
 $scope.modal.hide();
 };

 // Open the login modal
 $scope.login = function() {
 $scope.modal.show();
 };

 // Perform the login action when the user submits the login form
 $scope.doLogin = function() {
 console.log('Doing login', $scope.loginData);

 // Simulate a login delay. Remove this and replace with your login
 // code if using a login system
 $timeout(function() {
 $scope.closeLogin();
 }, 1000);
 }
 });*/
