#import("../dunit_base.dart");
#import("../../pprint/pprint.dart");



class ATest extends TestCase {
  tests() => {

    """ Verifies the relationship between object A and b.
Ensures a """    : testA,

    "it should B": testB,

    "it should C too": (){ print ("C'ed");}
  };

  testA() {
    print("A");
  }
  testB() {
    Expect.equals(42, "42", "but isnt 4242?");
  }
  int hashCode() => 42;
}


main() {
  var tr = new TestRunner().run(new ATest());
  tr.results.forEach((k,tr) {
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
