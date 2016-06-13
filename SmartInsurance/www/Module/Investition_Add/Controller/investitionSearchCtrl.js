appController.controller('investitionSearchCtrl',function($scope, $http, apiendpoint, selectFormatter, $ionicPopup, $state){

    $http.get(apiendpoint.url + '/api/smartinsurance/investition').success(function(response) {

        $scope.investitionen = response.data;

    });

    $http.get(apiendpoint.url + '/api/smartinsurance/kategorien').success(function(response) {

        var kat = [];
        for (var i = 0; i < response.length; i++) {
            kat.push({text: response[i]});
        }
        $scope.kategorien = kat;
    });

    $scope.kategorienFilter = {
        text: "Alle"
    };


    $scope.sorterList = [
        {text: "Bezeichnung", value: "name"},
        {text: "Bewertung", value: "bewertung"},
        {text: "Rendite", value: "rendite"},
        {text: "Versicherungshöhe", value: "versicherungshoehe"},
        {text: "Anzahl der Investoren", value: "anzahl_investoren"}
    ];

    $scope.sorterOrder = [
        {text: "Aufsteigend", value: true},
        {text: "Absteigend", value: false}
    ];

    $scope.search = function(kategorienFilter, sorterList, sorterOrder) {

        var kategorie = selectFormatter.formatSelect(kategorienFilter.text);
        var sorterText = selectFormatter.formatSelect(sorterList.text);
        var orderText = selectFormatter.formatSelect(sorterOrder.text);

        var sorterValue = "";
        if (sorterText !== "Keine") {
            for (var i = 0; i < $scope.sorterList.length; i++) {
                if (sorterText === $scope.sorterList[i].text) {
                    sorterValue = $scope.sorterList[i].value;
                    break;
                }
            }
        }

        var orderValue = false;
        for (var i = 0; i < $scope.sorterOrder.length; i++) {
            if (orderText === $scope.sorterOrder[i].text) {
                orderValue = $scope.sorterOrder[i].value;
                break;
            }
        }

        /*
         * Setup search parameter for search
         */
        var parameter = {};
        if (kategorie !== "Alle") {
            parameter.kategorie = kategorie;
        }
        if (sorterValue !== "") {
            parameter.orderby = sorterValue;
        }
        parameter.ascending = orderValue;

        /*
         * Execute search and display the results / show error popup if no results
         */
        $http.post(apiendpoint.url + '/api/smartinsurance/filter', parameter).success(function(response) {
            $scope.results = response;
            for (var i = 0; i < $scope.results.length; i++) {
                $scope.results[i].rendite = Math.round($scope.results[i].rendite);
            }
        }).error(function(response) {
            console.log(response.status);

            var alertPopup = $ionicPopup.alert({
                title: "Fehlermeldung",
                template: "Es wurden keine Investionen gefunden!"
            });

            alertPopup.then(function(res) {
                console.log("Fehler");
            });

        });
    };

    $scope.investitionShow = function(id) {
        console.log(id);
        $state.go("app.investitionInfo",{id: id});
    };

    $scope.investitionSearch = function() {

    }
});
