#import("../dunit_base.dart");
#import("../dunit_dsl.dart");
#import("../dunit_reporters.dart");
#import("../../pprint/pprint.dart");
#source("tests/FirstTestCase.dart");
#source("tests/SecondTestCase.dart");
#source("tests/ThirdTestCase.dart");

main() {

  report(test: new TestSuite(name: "Sample Suite",
                             tests: [new FirstTestCase(),
                                     new SecondTestCase(),
                                     new ThirdTestCase()]));

}
