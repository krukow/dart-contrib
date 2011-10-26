#library("contrib.dunit.dsl");

#import("dunit_base.dart");

class ClosureTestCase extends TestCase {
  final f;
  ClosureTestCase(this.f [desc="Test"]): super(desc);
  tests() {
    var m = new Map();
    m[name] = f;
    return m;
  }
}

test_case(f [as="Test"]) {
  return new ClosureTestCase(f,as);
}

run([test=null,
     as="Test",
     reporter=const TestReporter(),
     runner=const TestRunner()]) {
  if (test == null) return;
  if (test is Function) {
    test = test_case(test, as: as);
  }
  assert(test is TestCase || test is TestSuite);
  var res = runner.run(test);
  if (reporter is TestReporter) reporter.report(res);
  return res;
}
