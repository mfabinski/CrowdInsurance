appController.controller('investitionSearchCtrl',function($scope, $http, apiendpoint){

    $http.get(apiendpoint.url + '/api/smartinsurance/investition').success(function(response) {

         $scope.investitionen = response.data;

    });


    $http.get(apiendpoint.url + '/api/smartinsurance/kategorien').success(function(response) {

      var kat = [];

         for (var i = 0; i < response.length; i++) {
           kat.push({
             value: response[i]
           });
         }
      $scope.kategorien = kat;

    });

    $scope.kategorienFilter = {
      value: ''
  };


  $scope.sorterList = [
    {text: "Bewertung", value: "bewertung"},
    {text: "Bezeichnung", value: "name"},
    {text: "Rendite", value: "rendite"},
    {text: "Versicherungshöhe", value: "versicherungshoehe"},
    {text: "Anzahl der Investoren", value: "anzahl_investoren"}
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


  $scope.search = function(kategorienFilter, dataSorter, dataOrder) {


    //kategorienFilter.value= kategorienFilter.value.trim();
    console.log(kategorienFilter.value);


    var parameter = {
        kategorie: kategorienFilter.value.trim(),
        orderby: 'rendite',
        ascending: true
    };

    $http.post(apiendpoint.url + '/api/smartinsurance/filter', parameter).then(function(response) {

      var arr = [];

      for (var i = 0; i < response.data.length; i++) {
        arr.push({
          name: response.data[i].name,
          versicherungshoehe: response.data[i].versicherungshoehe,
          kategorie: response.data[i].kategorie,
          anzahl_investoren: response.data[i].anzahl_investoren,
          bewertung: response.data[i].bewertung,
          rendite: response.data[i].rendite
        });
      }
//$scope.$apply(function() {
  //$scope.results = arr;
  $scope.results = response.data;
  //console.log(arr);
  console.log($scope.results);
  console.log($scope.results.length);
  // $scope.result = JSON.stringify(response);
  //alert(arr[0].name);
//})


    });



    /*$http.post(apiendpoint.url + '/api/smartinsurance/versicherung', $scope.versicherung).then(function(data) {
     versicherungAdd.setVersicherung({});
     $state.go('app.versicherungAdded');
     });  */

  }

  $scope.investitionShow = function() {

  }

  $scope.investitionSearch = function() {

  }




})
