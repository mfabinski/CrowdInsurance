var expect = require('expect.js');
var ts = require('transactionscript.js');

var ausgangArray = [
  {
    id : 1,
    name : 'David',
    nachname : 'Hardwood'
  },
  {
    id : 1,
    name : 'Bumsi',
    nachname : 'Bims'
  }
];

var sollArray = [
  {
    id : 1,
    name : 'David1',
    nachname : 'Hardwood3'
  },
  {
    id : 1,
    name : 'Bumsi2',
    nachname : 'Bims1'
  }
];

for (var i = 0; i < sollArray.length; i++){
  var ausgang, soll, ist;
  ausgang = ausgangArray[i];
  soll = sollArray[i];
  ist = ts.zuTestendeFunktion(ausgang);
  describe('Objekt' + i, function() {
    describe('Name', function() {
      it('Namen sollten gleich sein.', function() {
        expect(soll.name).to.be(ist.name);
        expect(soll.nachname).to.be(ist.nachname);
      });
    });
  });
}
