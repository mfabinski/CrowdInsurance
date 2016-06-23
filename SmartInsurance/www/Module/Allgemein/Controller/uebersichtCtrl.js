appController.controller('uebersichtCtrl', function($scope, $http, $state, moneyParser, moneyFormatter, apiendpoint){


    $scope.versicherungen= [];
    $scope.investitionen = [];

    $scope.noVersicherung = true;
    $scope.noInvestition = true;


    $http.get(apiendpoint.url + '/api/smartinsurance/versicherung').success(function(response) {
        $scope.versicherungen = response;
        $scope.noVersicherung = false;
        
        $scope.chartObject = {
  "type": "PieChart",
  "displayed": false,
  "data": {
    "cols": [
      {
        "id": "kategorie",
        "label": "Kategorie",
        "type": "string",
        "p": {}
      },
      {
        "id": "anzahl",
        "label": "Anzahl",
        "type": "number",
        "p": {}
      },
    ],
    "rows": [
      {
        "c": [
          {
            "v": "Autos"
          },
          {
            "v": $scope.versicherungen.length
              
            
          },
        ]
      },
      {
        "c": [
          {
            "v": "Schiff"
          },
          {
            "v": 13
          },
        ]
      },
      {
        "c": [
          {
            "v": "Flugzeug"
          },
          {
            "v": 24
          },
        ]
      },
              {
        "c": [
          {
            "v": "Haus"
          },
          {
            "v": 13
          },
        ]
      },
              {
        "c": [
          {
            "v": "Küchengeräte"
          },
          {
            "v": 13
          },
        ]
      },
              {
        "c": [
          {
            "v": "Möbel"
          },
          {
            "v": 13
          },
        ]
      },
              {
        "c": [
          {
            "v": "Maschinen"
          },
          {
            "v": 13
          },
        ]
      },
              {
        "c": [
          {
            "v": "Uhr"
          },
          {
            "v": 13
          },
        ]
      },
              {
        "c": [
          {
            "v": "Sonstiges"
          },
          {
            "v": 13
          },
        ]
      }
    ]
  },
  "options": {
    "title": "Versicherungsangebote pro Kategorie",
    "isStacked": "true",
    "fill": 20,
    "displayExactValues": true,
    "vAxis": {
      "title": "Sales unit",
      "gridlines": {
        "count": 10
      }
    },
    "hAxis": {
      "title": "Date"
    }
  },
  "formatters": {}
}
        
        

    
    });

    
    $http.get(apiendpoint.url + '/api/smartinsurance/investition').success(function(response) {
        $scope.investitionen = response;
        $scope.noInvestition = false;
        
         $scope.chartObject2 = {
  "type": "PieChart",
  "displayed": false,
  "data": {
    "cols": [
      {
        "id": "kategorie",
        "label": "Kategorie",
        "type": "string",
        "p": {}
      },
      {
        "id": "anzahl",
        "label": "Anzahl",
        "type": "number",
        "p": {}
      },
    ],
    "rows": [
      {
        "c": [
          {
            "v": "Autos"
          },
          {
            "v": $scope.investitionen.length
                   
          },
        ]
      },
      {
        "c": [
          {
            "v": "Schiff"
          },
          {
            "v": 13
          },
        ]
      },
      {
        "c": [
          {
            "v": "Flugzeug"
          },
          {
            "v": 24
          },
        ]
      },
              {
        "c": [
          {
            "v": "Haus"
          },
          {
            "v": 13
          },
        ]
      },
              {
        "c": [
          {
            "v": "Küchengeräte"
          },
          {
            "v": 13
          },
        ]
      },
              {
        "c": [
          {
            "v": "Möbel"
          },
          {
            "v": 13
          },
        ]
      },
              {
        "c": [
          {
            "v": "Maschinen"
          },
          {
            "v": 13
          },
        ]
      },
              {
        "c": [
          {
            "v": "Uhr"
          },
          {
            "v": 13
          },
        ]
      },
              {
        "c": [
          {
            "v": "Sonstiges"
          },
          {
            "v": 13
          },
        ]
      }
    ]
  },
  "options": {
    "title": "Investitionen pro Kategorie",
    "isStacked": "true",
    "fill": 20,
    "displayExactValues": true,
    "vAxis": {
      "title": "Sales unit",
      "gridlines": {
        "count": 10
      }
    },
    "hAxis": {
      "title": "Date"
    }
  },
  "formatters": {}
         }
         
         
                                              $scope.chartObject3 = {
  "type": "ColumnChart",
  "displayed": false,
  "data": {
    "cols": [
      {
        "id": "art",
        "label": "",
        "type": "string",
        "p": {}
      },
      {
        "id": "summe",
        "label": "Geld",
        "type": "number",
        "p": {}
      },
    ],
    "rows": [
      {
        "c": [
          {
            "v": "Versicherungshöhe"
          },
          {
            "v": $scope.versicherungengesamt()
                   
          },
        ]
      },
      {
        "c": [
          {
            "v": "Investitionshöhe"
          },
          {
            "v": $scope.investhoehegesamt()
          },
        ]
      }
      
    ]
  },
  "options": {
    "title": "Versicherungshöhe im Vergleich zur Investitionshöhe",
    "isStacked": "true",
    "fill": 20,
    "displayExactValues": true,
    "vAxis": {
      "title": "€",
      "gridlines": {
        "count": 10
      }
    },
    "hAxis": {
      "title": "Art"
    }
  },
  "formatters": {}
}
         
                     

                 
        
    });
    
    

    
    $scope.versicherungShow = function(id) {
        $state.go("app.versicherungDetail",{id: id});
    };

    $scope.investitionShow = function(id) {
        $state.go("app.investitionDetail",{id: id});
    };

    $scope.versicherungengesamt = function() {
        var gesamtbetrag=0;
        var versicherungshoehe = 0;
        for (var i = 0; i < $scope.versicherungen.length; i++){
            versicherungshoehe = moneyParser.moneyparsen($scope.versicherungen[i].versicherungshoehe);
            gesamtbetrag += versicherungshoehe;
        }
        return moneyFormatter.formatMoney(gesamtbetrag);
    };

    $scope.monatsbeitraggesamt = function() {
        var gesamtbetrag=0;
        for (var i = 0; i < $scope.versicherungen.length; i++){
            gesamtbetrag += moneyParser.moneyparsen($scope.versicherungen[i].beitrag);
        }
        return moneyFormatter.formatMoney(gesamtbetrag);
    };

    $scope.investhoehegesamt = function() {
        var gesamtbetrag=0;
        for (var i = 0; i < $scope.investitionen.length; i++){
            gesamtbetrag += moneyParser.moneyparsen($scope.investitionen[i].investitionshoehe);
        }
        
        return moneyFormatter.formatMoney(gesamtbetrag);
        

                                     
    };

    $scope.renditemax = function() {
        var gesamtbetrag=0;
        var monatsbeitrag = 0;
        var investitionshoehe = 0;
        var versicherungshoehe = 0;
        for (var i = 0; i < $scope.investitionen.length; i++){
            monatsbeitrag = moneyParser.moneyparsen($scope.investitionen[i].beitrag);
            investitionshoehe = moneyParser.moneyparsen($scope.investitionen[i].investitionshoehe);
            versicherungshoehe = moneyParser.moneyparsen($scope.investitionen[i].versicherungshoehe);
            gesamtbetrag += monatsbeitrag * investitionshoehe /versicherungshoehe;
        }
        return moneyFormatter.formatMoney(gesamtbetrag);
    };

    $scope.calculateRendite = function (investition) {
        var monatsbeitrag =  moneyParser.moneyparsen(investition.beitrag);
        var investitionshoehe = moneyParser.moneyparsen(investition.investitionshoehe);
        var versicherungshoehe = moneyParser.moneyparsen(investition.versicherungshoehe);

        return moneyFormatter.formatMoney(monatsbeitrag * investitionshoehe /versicherungshoehe);
    };
    
    


    



});
