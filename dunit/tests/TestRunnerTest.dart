class TestRunnerTest extends TestCase {
  TestRunnerTest():
    super("TestRunnerTestCase"),
    setup_called=false,
    test_count=0,
    teardown_called=false;

  bool setup_called;
  int test_count;
  bool teardown_called;
  setUp() {
    setup_called=true;
  }
  tearDown() {
    Map t = tests();
    Expect.equals(t.length,test_count);
    teardown_called=true;
  }

  tests() => {
    "A": () { Expect.isTrue(setup_called); test_count++;},
    "B": () { Expect.isTrue(setup_called); test_count++;},
    "C": () { Expect.isTrue(setup_called); test_count++;}
  };
}

class MetaTest extends TestCase {
  TestRunnerTest t;
  bool setup_called = false;
  bool test_called = false;
  setUp() {
    setup_called = true;
    t = new TestRunnerTest();
  }
  tests() => {
    "Test case run": () {
      test_called = true;
      var r = new TestRunner();
      TestResult tr = r.run(t);
      Expect.isTrue(tr.noDefects());

      Expect.isTrue(t.setup_called);
      Expect.isTrue(t.teardown_called);



    }
  };
}
