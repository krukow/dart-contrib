#library("contrib.dunit.dsl");

#import("dunit_base.dart");

class ClosureTestCase extends TestCase {
  final f;
  ClosureTestCase(this.f, [desc="Test"]): super(desc);
  tests() {
    var m = new Map();
    m[name] = f;
    return m;
  }
}

test_case(f, [as="Test"]) {
  return new ClosureTestCase(f,as);
}


run([test=null,
     as="Test",
     runner=const TestRunner()]) {
  if (test == null) return;
  if (test is Function) {
    test = test_case(test, as: as);
  }
  assert(test is TestCase || test is TestSuite);
  return runner.run(test);
}

suite([tests = const [],
       as="TestSuite"]) {
  return new TestSuite(name:as, tests:tests);
}
report([test=null,
        as="Test",
        TestRunner runner=const TestRunner(),
        TestReporter reporter=const TestReporter()]) {
  reporter.report(run(test:test,
                      as:as,
                      runner:runner));
}
