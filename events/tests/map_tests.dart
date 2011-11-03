#import("../../dunit/dunit_base.dart");
#import("../../dunit/dunit_dsl.dart");

#import("../../pprint/pprint.dart");

#import("../events_map.dart");

#source("TestMapEvents.dart");
#source("TestMapInterface.dart");
#source("Key.dart");


main() {
  report(test: new TestSuite(name: "MapEventTarget tests",
                             tests: [new TestMapEvents(),
                                     new TestMapInterface()]));
}
