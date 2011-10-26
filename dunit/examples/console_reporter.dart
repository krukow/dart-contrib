#import("../dunit_base.dart");
#import("../dunit_dsl.dart");
#import("../dunit_reporters.dart");
#import("../../pprint/pprint.dart");


class ATest extends TestCase {
  ATest():super("ATest");
  tests() => {

    """Verifies the relationship between object A and b.
        Ensures a """    : testA,

    "it should B": testB,

    "it should C too": (){ }
  };

  testA() {

  }
  testB() {
    Expect.equals(42, "42", "but isnt 4242?");
  }
  int hashCode() => 42;
}

main() {
  run(test: () {
        Expect.equals(2,2);
    },
    as:"Expect two equals two",
    reporter:new ConsoleReporter());

  var tr = new TestRunner().run(new ATest());
  new ConsoleReporter().report(tr);


}
