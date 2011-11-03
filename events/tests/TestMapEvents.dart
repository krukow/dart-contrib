class TestMapEvents extends TestCase {
  TestMapEvents():super("TestMapEvents");
  tests() => {

    """keychange should generate
       events only for change to specific key
    """: testKeyChange,

    "global change event should trigger on all changes": testGlobal
  };

  var map;
  setUp() {
    map = new MapEventTarget();
    map[new Key(0,0)] = "00";
    map[new Key(0,1)] = "01";
  }
  tearDown() => map = null;


  testKeyChange() {
    bool called = false;
    var handler = (e) {
      called = true;
      Expect.equals(e.payload['new'], 42);
      Expect.equals(e.payload['old'], "00");
    };
    map.on.keychange(new Key(0,0)).add(handler);

    map[new Key(0,1)] = 42;
    Expect.isFalse(called);

    map[new Key(0,0)] = 42;
    Expect.isTrue(called);

    called = false;
    map.on.keychange(new Key(0,0)).remove(handler);
    map[new Key(0,0)] = 40;
    Expect.isFalse(called);

  }

  testGlobal() {
    bool called = false;
    var handler = (e) {
      called=true;
      Expect.equals(e.value, "22");
      Expect.equals(e.oldvalue, null);
    };
    map.on.add.add(handler);
    bool removecalled = false;
    var rhandler= (e) {
      removecalled = true;
      Expect.isNull(e.value);
      Expect.equals(e.oldvalue,"22");
      Expect.equals(e.key, new Key(2,2));
    };

    map[new Key(2,2)] = "22";
    Expect.isTrue(called);
    Expect.isFalse(removecalled);

    map.on.remove.add(rhandler);
    called = false;
    map.remove(new Key(2,2));
    Expect.isTrue(removecalled);
    Expect.isFalse(called);

  }

}
