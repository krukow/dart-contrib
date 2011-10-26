#import("../dunit_base.dart");
#import("../dunit_dsl.dart");
#import("../dunit_reporters.dart");
#import("../../pprint/pprint.dart");
#source("FirstTestCase.dart");
#source("SecondTestCase.dart");
#source("ThirdTestCase.dart");

main() {

  run(test: new TestSuite(name: "Sample Suite",
                          tests: [new FirstTestCase(),
                                  new SecondTestCase(),
                                  new ThirdTestCase()]),
      reporter:new ConsoleReporter());

}
