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

    $scope.paging = [
        {entries: 5, value: false},
        {entries: 10, value: true},
        {entries: 15, value: false},
        {entries: 20, value: false},
        {entries: 25, value: false}
    ];

    $scope.search = function(kategorienFilter, sorterList, sorterOrder, paging) {

        var kategorie = selectFormatter.formatSelect(kategorienFilter.text);
        var sorterText = selectFormatter.formatSelect(sorterList.text);
        var orderText = selectFormatter.formatSelect(sorterOrder.text);
        var entryCount = selectFormatter.formatSelect(paging.entries);
        console.log("Counts: " + entryCount);

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
        var parameterFilter = {};
        if (kategorie !== "Alle") {
            parameterFilter.kategorie = kategorie;
        }
        if (sorterValue !== "") {
            parameterFilter.orderby = sorterValue;
        }
        parameterFilter.ascending = orderValue;
        parameterFilter.entrycount =  entryCount;

        /*
         * Execute search and display the results / show error popup if no results
         */
        $http.post(apiendpoint.url + '/api/smartinsurance/filter', parameterFilter).success(function(response) {
            $scope.results = response;
            for (var i = 0; i < $scope.results.length; i++) {
                $scope.results[i].rendite = Math.round($scope.results[i].rendite);
            }
        }).error(function(error, status) {
            console.log(error);
            console.log(status);

            var alertPopup = $ionicPopup.alert({
                title: "Fehlermeldung",
                template: "Es wurden keine Investionen gefunden!"
            });

            alertPopup.then(function(res) {
                console.log("Fehler");
            });

        });

        var parameterCount = {};
        if (kategorie !== "Alle") {
            parameterCount.kategorie = kategorie;
        }
        if (sorterValue !== "") {
            parameterCount.orderby = sorterValue;
        }
        parameterCount.ascending = orderValue;


        //'/api/smartinsurance/filter/count'

        $http.post(apiendpoint.url + '/api/smartinsurance/filter', parameterCount).success(function(response) {
            console.log("Count: " + response.length);
        }).error(function(error, status) {
            console.log(error);
            console.log(status);




        });

    };

    $scope.investitionShow = function(id) {
        console.log(id);
        $state.go("app.investitionInfo",{id: id});
    };

    $scope.investitionSearch = function() {

    }
});
