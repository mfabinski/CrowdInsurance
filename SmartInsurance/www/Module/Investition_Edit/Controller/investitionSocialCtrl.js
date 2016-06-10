appController.controller('investitionSocialCtrl',function($scope, $http, $state, $stateParams, apiendpoint){

    $scope.investitionId = $stateParams.id;

    $scope.comment = "";

    $scope.noComment = false;

    $scope.investoren = [];


    $http.get(apiendpoint.url + '/api/smartinsurance/investition/' + $scope.investitionId).success(function(response) {
        $scope.investition = response[0];

        $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.investition.versicherungID +'/person').success(function(response) {
            $scope.investorhelper = response;
            var countInvestor = $scope.investorhelper.length;
            $scope.noInvestor = false;

            for (var i = 0; i < countInvestor/3 ; i++){
                var j=i*3;
                $scope.investoren.push([$scope.investorhelper[j],$scope.investorhelper[j+1],$scope.investorhelper[j+2]]);
            }

        });

        $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.investition.versicherungID + '/bewertungen').success(function(response) {
            $scope.bewertung = response;
        })
        .error(function(response) {
             $scope.bewertung = [
                {count: 0},
                {count: 0},
                {count: 0}
            ]
        })
    });

  $scope.bewerten = function(thumb){
    var data = {};
    data.bewertung = thumb;
    $http.put(apiendpoint.url + '/api/smartinsurance/investition/' + $scope.investitionId + '/bewertung', data)
      .then(function (response) {
          console.log("erfolgreich");
        }, function(response){
          console.log("fail");
        }
      ).then(function(response) {
      $http.get(apiendpoint.url + '/api/smartinsurance/versicherung/' + $scope.investition.versicherungID + '/bewertungen').success(function (response) {
        $scope.bewertung = response;
      })
        .error(function (response) {
          $scope.bewertung = [
            {count: 0},
            {count: 0},
            {count: 0}
          ]
        })
    }).then(function(){
      $scope.$apply;
    })

    ;
  };


  $scope.showPicture = function(investor) {
        if(angular.isDefined(investor)){
            return true;
        }
        return false;
    }

    $scope.writeComment = function(form) {
        if (form.$valid) {
         /*   $http.post(apiendpoint.url , $scope.comment).then(function(data) {
                console.log("erfolgreich");
            });  */
            console.log("erfolgreich");
            $scope.noComment=false;
        } else {
            $scope.noComment=true;
        }
    };

    $scope.evaluate = function (bewertung) {
        switch(bewertung) {
            case "positiv":
                // Post Bewertung positiv
                break;
            case "negativ":
                // Post Bewertung negativ
                break;
        }
    }

    $scope.showInvestor = function (id) {
      // Verweis auf Investor personID übergeben
    };

    $scope.showProfil = function (id) {
        // Verweis auf Versicherungsnehmer personID übergeben
    }



});
