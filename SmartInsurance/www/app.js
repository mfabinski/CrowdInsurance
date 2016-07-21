// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.controllers' is found in controllers.js
var app = angular.module('smartInsurance', [ 'ionic','smartInsurance.controllers', '720kb.socialshare']);



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
});







app.run(['$rootScope', '$ionicPlatform', '$window',
    function($ionicPlatform, $rootScope, $window, sAuth) {


        $rootScope.user = {};

        $window.fbAsyncInit = function() {
            // Executed when the SDK is loaded
            FB.init({
                /*
                 The app id of the web app;
                 To register a new app visit Facebook App Dashboard
                 ( https://developers.facebook.com/apps/ )
                 */
                appId: '313387092326143',
                version: 'v2.6',
                /*
                 Adding a Channel File improves the performance
                 of the javascript SDK, by addressing issues
                 with cross-domain communication in certain browsers.
                 */
                /*   channelUrl: 'app/channel.html', */
                /*
                 Set if you want to check the authentication status
                 at the start up of the app
                 */
                status: true,
                /*
                 Enable cookies to allow the server to access
                 the session
                 */
                cookie: true,
                /* Parse XFBML */
                xfbml: true
            });

            //sAuth.watchAuthenticationStatusChange();

        };

        (function(d){
            // load the Facebook javascript SDK
            var js,
                id = 'facebook-jssdk',
                ref = d.getElementsByTagName('script')[0];
            if (d.getElementById(id)) {
                return;
            }
            js = d.createElement('script');
            js.id = id;
            js.async = true;
            js.src = "//connect.facebook.net/en_US/all.js";

            ref.parentNode.insertBefore(js, ref);

        }(document));

    }]);










app.config(function($stateProvider, $urlRouterProvider, $locationProvider) {

    $stateProvider

        .state('app', {
            url: '/app',
            abstract: true,
            templateUrl: 'Module/Allgemein/Views/menu.html',
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

        .state('app.error', {
            url: '/error',
            params: {error: null},
            views: {
                'menuContent': {
                    templateUrl: 'Module/Allgemein/Views/error.html',
                    controller: 'errorCtrl'

                }
            }
        })


        .state('app.profil', {
            url: '/profil',
            views: {
                'menuContent': {
                    templateUrl: 'Module/Sonstiges/Views/profil.html',
                    controller: 'profilCtrl'

                }
            }
        })

        .state('app.profilBearbeiten', {
            url: '/profilBearbeiten',
            views: {
                'menuContent': {
                    templateUrl: 'Module/Sonstiges/Views/profil_bearbeiten.html',
                    controller: 'profilBearbeitenCtrl'

                }
            }
        })

        .state('app.profilFremd', {
            url: '/profilFremd',
            params: {investor: null},
            views: {
                'menuContent': {
                    templateUrl: 'Module/Sonstiges/Views/profil_fremd.html',
                    controller: 'profilFremdCtrl'

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

        .state('app.versicherungSocial', {
            url: '/versicherungSocial/:id',
            views: {
                'menuContent': {
                    templateUrl: 'Module/Versicherung_Edit/Views/versicherungSocial.html',
                    controller: 'versicherungSocialCtrl'
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
            url: '/versicherungAdded/:id',
            params: {id : null},
            views: {
                'menuContent': {
                    templateUrl: 'Module/Versicherung_Add/Views/versicherungAdded.html',
                    controller: 'versicherungAddedCtrl'
                }
            }
        })

        .state('app.schadensfaelle', {
            url: '/schadensfaelle/:id',
            params: {id: null},
            views: {
                'menuContent': {
                    templateUrl: 'Module/Versicherung_Edit/Views/schadensfaelle.html',
                    controller: 'schadensfaelleCtrl'
                }
            }
        })

        .state('app.investitionInfo', {
            url: '/investitionInfo/:id',
            views: {
                'menuContent': {
                    templateUrl: 'Module/Investition_Add/Views/investitionInfo.html',
                    controller: 'investitionInfoCtrl'
                }
            }
        })

        .state('app.investitionAdd', {
            url: '/investitionAdd/:id',
            views: {
                'menuContent': {
                    templateUrl: 'Module/Investition_Add/Views/investitionAdd.html',
                    controller: 'investitionAddCtrl'
                }
            }
        })

        .state('app.investitionCheck', {
            url: '/investitionCheck',
            params: {investition: null},
            views: {
                'menuContent': {
                    templateUrl: 'Module/Investition_Add/Views/investitionCheck.html',
                    controller: 'investitionCheckCtrl'
                }
            }
        })

        .state('app.schadensfallMelden', {
            url: '/schadensfallMelden',
            params: {schaden: null},
            views: {
                'menuContent': {
                    templateUrl: 'Module/Versicherung_Edit/Views/schadensfallMelden.html',
                    controller: 'schadensfallMeldenCtrl'
                }
            }
        })

        .state('app.investitionAdded', {
            url: '/investitionAdded/:id',
            views: {
                'menuContent': {
                    templateUrl: 'Module/Investition_Add/Views/investitionAdded.html',
                    controller: 'investitionAddedCtrl'
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

        .state('app.investitionDetail', {
            url: '/investitionDetail/:id',
            views: {
                'menuContent': {
                    templateUrl: 'Module/Investition_Edit/Views/investitionDetail.html',
                    controller: 'investitionDetailCtrl'
                }
            }
        })

        .state('app.investitionEdit', {
            url: '/investitionEdit/:id',
            views: {
                'menuContent': {
                    templateUrl: 'Module/Investition_Edit/Views/investitionEdit.html',
                    controller: 'investitionEditCtrl'
                }
            }
        })

        .state('app.investitionSocial', {
            url: '/investitionSocial/:id',
            views: {
                'menuContent': {
                    templateUrl: 'Module/Investition_Edit/Views/investitionSocial.html',
                    controller: 'investitionSocialCtrl'
                }
            }
        })

        .state('app.login', {
            url: '/login',
            views: {
                'menuContent': {
                    templateUrl: 'Module/Allgemein/Views/login.html',
                    controller: 'loginCtrl'
                }
            }
        })

        .state('app.signup', {
            url: '/signup',
            views: {
                'menuContent': {
                    templateUrl: 'Module/Allgemein/Views/signup.html',
                    controller: 'signupCtrl'
                }
            }
        })

        .state('app.faq', {
            url: '/faq',
            views: {
                'menuContent': {
                    templateUrl: 'Module/Sonstiges/Views/faq.html',
                    controller: 'faqCtrl'
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

    $locationProvider.html5Mode(false).hashPrefix('!');

});
