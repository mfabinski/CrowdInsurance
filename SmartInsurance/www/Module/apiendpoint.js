angular.module("smartInsurance").factory('apiendpoint', function() {
    var service={};
    service.url = "http://localhost:3000";
//    service.url = "http://crowdinsurance.cloudf.de";
   // service.backend = "https://sb.pftclan.de:546"
    service.backend = "http://smartbackend.cloudf.de"

    return service;
});
