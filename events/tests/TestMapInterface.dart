
class TestMapInterface extends TestCase {
  TestMapInterface():super("TestMapInterface");
  tests() => {
    "from constructor should copy target map": testFrom,
    "add remove clear should work as regular map": testOps,
    "putIfAbsent, clear should work as regular map": testAdvanced,
  };


  testFrom() {
    Expect.equals(map.length, 2);
    Expect.equals(modelMap[k0], map[k0]);
    Expect.equals(modelMap[k1], map[k1]);
  }

  testOps() {
    var old = map[k1];
    map[k1] = "00";
    Expect.equals("00", map[k1]);
    map[k1] = old;
    Expect.equals(old, map[k1]);

    Key k2 = new Key(0,2);
    map[k2] = "02";
    var old2 = map.remove(k2);
    Expect.equals(old2,"02");
    Expect.isFalse(map.containsKey(k2));

  }

  testAdvanced() {
    Key k2 = new Key(0,2);
    bool called = false;
    map.putIfAbsent(k2, () { called=true;return "22";});
    Expect.equals("22",map[k2]);

    map.clear();
    Expect.equals(0,map.length);
    Expect.isNull(map[k0]);
    map = new MapEventTarget.from(modelMap);

  }

  var map;
  var modelMap;
  Key k0;
  Key k1;

  setUp() {
    modelMap = {};
    k0 = new Key(0,0);
    k1 = new Key(0,1);
    modelMap[k0] = "00";
    modelMap[k1] = "01";
    map = new MapEventTarget.from(modelMap);
  }
  tearDown() => map = null;

}
