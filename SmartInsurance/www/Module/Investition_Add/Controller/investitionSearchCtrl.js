appController.controller('investitionSearchCtrl',function($scope, $http, apiendpoint, selectFormatter){

    $http.get(apiendpoint.url + '/api/smartinsurance/investition').success(function(response) {

         $scope.investitionen = response.data;

    });


    $http.get(apiendpoint.url + '/api/smartinsurance/kategorien').success(function(response) {

      var kat = [];
      kat.push({value: "Keine"});

         for (var i = 0; i < response.length; i++) {
           kat.push({value: response[i]});
         }
      $scope.kategorien = kat;

    });

    $scope.kategorienFilter = {
      value: ''
  };


  $scope.sorterList = [
    {text: "Keine", value: "keine"},
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

  $scope.dataSorter = {
    value: ""
  };

  $scope.dataOrder = {
    value: false
  };


  $scope.search = function(kategorienFilter, dataSorter, dataOrder) {


    //kategorienFilter.value= kategorienFilter.value.trim();
    console.log($scope.sorterList.value);


    var parameter = {
        kategorie: selectFormatter.formatSelect(kategorienFilter.value),
        orderby: selectFormatter.formatSelect(dataSorter.value),
        ascending: dataOrder.value
    };

    $http.post(apiendpoint.url + '/api/smartinsurance/filter', parameter).success(function(response) {

      $scope.results = response;

      console.log($scope.results);
      console.log($scope.results.length);

    });


  }

  $scope.investitionShow = function() {

  }

  $scope.investitionSearch = function() {

  }




})
