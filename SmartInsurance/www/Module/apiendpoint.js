angular.module("smartInsurance").factory('apiendpoint', function() {
    var service={};
    service.url = "http://localhost:3000";
//    service.url = "http://crowdinsurance.cloudf.de";

    return service;
});
