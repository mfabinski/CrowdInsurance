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

app.config(function($stateProvider, $urlRouterProvider) {
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

  
  .state('app.VersicherungAdd', {
    url: '/versicherungAdd',
    views: {
      'menuContent': {
        templateUrl: 'Module/Versicherung_Add/Views/versicherungAdd.html',
        controller: 'versicherungAddCtrl'
      }
    }
  })
  
  .state('app.VersicherungCheck', {
    url: '/versicherungCheck',
    views: {
      'menuContent': {
        templateUrl: 'Module/Versicherung_Add/Views/versicherungsangebotUeberpruefen.html',
        controller: 'versicherungCheckCtrl'
      }
    }
  })
  
  .state('app.VersicherungAdded', {
    url: '/versicherungAdded',
    views: {
      'menuContent': {
        templateUrl: 'Module/Versicherung_Add/Views/versicherungsangebotEingestellt.html',
        controller: 'versicherungAddedCtrl'
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
    });
  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/app/uebersicht');
});
