#library("contrib.dunit.tests.runner");

#import("../dunit_base.dart");
#import("../../pprint/pprint.dart");

#source("TestRunnerTest.dart");

main() {
  var tr = new TestRunner();
  var t = new MetaTest();
  var res = tr.run(t);
  Expect.isTrue(t.setup_called);
  Expect.isTrue(t.test_called);
  pp(res.results);
  pp(res.results[t]['result'].results);


}
