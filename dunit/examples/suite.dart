#import("../dunit_base.dart");
#import("../../pprint/pprint.dart");


class ATest extends TestCase {
  ATest(): super("A");
  tests() => {
    "A1": () => null,
    "A2": () => null,
    "A3": () => Expect.equals(42, "42", "but isnt '42' == 42?")
  };
}
class BTest extends TestCase {
  BTest(): super("B");
  tests() => {
    "B1": ()=>null,
    "B2": ()=>null
  };
}


main() {
  var runner = new TestRunner();
  var ts = new TestSuite();
  ts.add(new ATest());
  ts.add(new BTest());
  var tr = runner.run(ts);

  tr.results.forEach((k,tr) {
      pp(tr);
      if (tr['result'] != null) {
        pp("Test suite results:");
        pp("    defects:");
        tr['result'].defects().forEach((k,tr) {
            pp(tr);
            if (tr['result'] != null) {
              pp("Test results:");
              pp("defects:");
              pp(tr['result'].defects());
              pp("passed:");
              pp(tr['result'].passed());
            }
          });
        pp("    passed:");
        tr['result'].passed().forEach((k,tr) {
            pp(tr);
            if (tr['result'] != null) {
              pp("Test results:");
              pp("defects:");
              pp(tr['result'].defects());
              pp("passed:");
              pp(tr['result'].passed());
            }
          });
      }
    });

}
