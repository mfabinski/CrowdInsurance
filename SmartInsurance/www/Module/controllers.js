var appController = angular.module('smartInsurance.controllers',  []);


/* Service zur Konvertierung zum Datentyp Float */
appController.service('moneyParser', [function(){
    this.moneyparsen = function(betrag) {
        if(angular.isDefined(betrag)){
            if(betrag.search(" €") != -1){
                betrag = betrag.substring(0, (betrag.length -2));
            }
            betrag = betrag.replace(/\./g,'');
            betrag = betrag.replace(',','.');
            betrag = parseFloat(betrag);
            return betrag;
        }
        return 0;
    }
}]);

/* Service zur Konvertierung in einen Euro-Betrag */
appController.service('moneyFormatter', [ function(){
    this.formatMoney = function(zahl){
        var n = zahl,
            c =  2,
            d =  ",",
            t = ".",
            s = n < 0 ? "-" : "",
            i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "",
            j = (j = i.length) > 3 ? j % 3 : 0;
        return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "") + " €";
    }
}]);

/* Service zur Konvertierung von Werten eines Drop-Down */
appController.service('selectFormatter', [ function(){
    this.formatSelect = function (select) {
        select.replace("/n","");
        select = select.trim();
        return select;
    }
}]);


/* Regex zur Überprüfung deines Euro-Betrags */
appController.factory("checkCurrencyFormat",function(){
    return /^(([1-9]{1}[0-9]{0,2}(\.{0,1}[0-9]{3})*,{0,1}[0-9]{0,2}|[0][,][0-9][1-9]|[0][,][1-9][0-9]{0,1})(€| €){0,1})$/;
});

/* Formatierung eines Datums */
appController.service('datumFormatter', [ function(){
    this.formatDatum = function (zeitstempel) {
        var datum = zeitstempel.substr(8,2) +'.' + zeitstempel.substr(5,2) + '.' + zeitstempel.substr(0,4);
        var uhrzeit = zeitstempel.substr(11,5) + ' Uhr';
        return datum + ' ' + uhrzeit;
    }

}]);

/* Service zum Zurücksetzen des Caches, um die Back-Funktion auszuschalten */
appController.service('CacheHistoryReseter', ['$ionicHistory', function($ionicHistory){
    this.reset = function () {
        $ionicHistory.clearCache();
        $ionicHistory.clearHistory();
        $ionicHistory.nextViewOptions({ disableBack: true, historyRoot: true });
    }

}]);

/* Service zur Erkennung des Statuses einer Versicherung/Investition */
appController.service('Status', function(){
    this.versicherung = function (versicherungen) {
        var versicherungsstatus = [];
        for (var i=0;i<versicherungen.length;i++){
            if(versicherungen[i].wirdGekuendigt){
                versicherungsstatus.push("wird gekündigt")
            }
            if(versicherungen[i].istGekuendigt){
                versicherungsstatus.push("gekündigt")
            } else if (versicherungen[i].suminvestition == "0,00 €") {
                versicherungsstatus.push("keine Investoren")
            } else {
                versicherungsstatus.push("läuft")
            }
            versicherungen[i].versicherungsstatus = versicherungsstatus;
            versicherungsstatus = [];
        }
        return versicherungen;
    }
    this.investition = function (investitionen) {
        var investitionsstatus = [];
        for (var i=0;i<investitionen.length;i++){
            if(investitionen[i].iwirdGekuendigt){
                investitionsstatus.push("wird gekündigt")
            }
            if(investitionen[i].iistGekuendigt || investitionen[i].vistGekuendigt){
                investitionsstatus.push("gekündigt")
            }
            if(investitionen[i].vwirdGekuendigt){
                investitionsstatus.push("Versicherung wird beendet")
            }
             if(investitionsstatus.length == 0){
                investitionsstatus.push("läuft")
            }
            investitionen[i].investitionsstatus = investitionsstatus;
            investitionsstatus = [];
        }
        return investitionen;
    }

});


