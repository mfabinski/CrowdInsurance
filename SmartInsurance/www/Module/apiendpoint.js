angular.module("smartInsurance").factory('apiendpoint', function() {
    var service={};
    service.url = "http://localhost:3000";
    service.backend = "http://smartbackend.cloudf.de"

    return service;
});
