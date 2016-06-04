// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.controllers' is found in controllers.js
var app = angular.module('smartInsurance', ['ionic', 'smartInsurance.controllers'])

app.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if (window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      cordova.plugins.Keyboard.disableScroll(true);

    }
    if (window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }
  });
})
/*
// alter Version
app.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider
*/

app.config(['$stateProvider', '$urlRouterProvider', configuration]);
 function configuration ($stateProvider, $stateParams , $urlRouterProvider) {
   
     
 $stateProvider

    .state('app', {
    url: '/app',
    abstract: true,
    templateUrl: 'Module/Allgemein/Views/menu.html',
    //controller: 'AppCtrl'
  })

   
  .state('app.uebersicht', {
    url: '/uebersicht',
    views: {
      'menuContent': {
        templateUrl: 'Module/Allgemein/Views/uebersicht.html',
        controller: 'uebersichtCtrl'
      }
    }
  })

  
  .state('app.profil', {
    url: '/profil',
    views: {
      'menuContent': {
        templateUrl: 'Module/Sonstiges/Views/profil.html'
        
      }
    }
  })

  .state('app.versicherungDetail', {
    url: '/versicherungDetail/:id',
    views: {
      'menuContent': {
        templateUrl: 'Module/Versicherung_Edit/Views/versicherungDetail.html',
        controller: 'versicherungDetailCtrl'  
      }
    }
  })
 
  .state('app.versicherungEdit', {
    url: '/versicherungEdit',
    views: {
      'menuContent': {
        templateUrl: 'Module/Versicherung_Edit/Views/versicherungEdit.html',
        controller: 'versicherungEditCtrl'  
      }
    }
  })
 
  .state('app.versicherungAdd', {
    url: '/versicherungAdd',
    views: {
      'menuContent': {
        templateUrl: 'Module/Versicherung_Add/Views/versicherungAdd.html',
        controller: 'versicherungAddCtrl'
      }
    }
  })
  
  .state('app.versicherungCheck', {
    url: '/versicherungCheck',
    params: {versicherung : null},
    views: {
      'menuContent': {
        templateUrl: 'Module/Versicherung_Add/Views/versicherungCheck.html',
        controller: 'versicherungCheckCtrl'
      }
    }
  })
  
  .state('app.versicherungAdded', {
    url: '/versicherungAdded',
    params: {id : null},
    views: {
      'menuContent': {
        templateUrl: 'Module/Versicherung_Add/Views/versicherungAdded.html',
        controller: 'versicherungAddedCtrl'
      }
    }
  })
  
   .state('app.schadensfaelle', {
    url: '/schadensfaelle',
    params: {id: null},
    views: {
      'menuContent': {
        templateUrl: 'Module/Versicherung_Edit/Views/schadensfaelle.html',
        controller: 'schadensfaelleCtrl'
      }
    }
  })


  .state('app.investitionSearch', {
      url: '/investitionSearch',
      views: {
        'menuContent': {
          templateUrl: 'Module/Investition_Add/Views/investitionSearch.html',
          controller: 'investitionSearchCtrl'
        }
      }
    })
   .state('app.faq', {
      url: '/faq',
      views: {
        'menuContent': {
          templateUrl: 'Module/Sonstiges/Views/faq.html'
        }
      }
    })
   .state('app.impressum', {
      url: '/impressum',
      views: {
        'menuContent': {
          templateUrl: 'Module/Sonstiges/Views/impressum.html'
        }
      }
    })
    
      
// otherwise funktioniert nicht mehr 
 
  // if none of the above states are matched, use this as the fallback
  //$urlRouterProvider.otherwise('/app/uebersicht');  
};

 

