appController.controller('investitionSearchCtrl',function($scope, $http){

    $http.get('http://localhost:3000/api/smartinsurance/investition').success(function(response) {
         $scope.investitionen = response.data;

    });

    $http.get('http://localhost:3000/api/smartinsurance/kategorien').success(function(response) {

      var kat = [];

         for (var i = 0; i < response.length; i++) {
           kat.push({
             text: response[i],
             enabled: false
           });
         }
      $scope.kategorien = kat;

    });

    $scope.investitionShow = function() {

    }

    $scope.investitionSearch = function() {

    }

  $scope.sorterList = [
    {text: "Bewertung", value: "bw"},
    {text: "Bezeichnung", value: "bez"},
    {text: "Versicherungshöhe", value: "vh"}
  ];


  $scope.sorterOrder = [
    {text: "Aufsteigend", value: "asc"},
    {text: "Absteigend", value: "desc"},
  ];

  $scope.dataSorter = {
    value: ''
  };

  $scope.dataOrder = {
    value: 'asc'
  };


  $scope.search = function(dataSorter, dataOrder) {
    console.log($scope.kategorien[0].enabled + " und " + dataSorter.value + " und " + dataOrder.value);
  }






})
