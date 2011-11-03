#import("../../../dart/shared/observable/observable.dart");

#import("../observable.dart");
#import("../../pprint/pprint.dart");
#import("../../utils/utils.dart");


main() {
  Map<String, int> m = {"Karl":1, "Krukow":2};
  var o = new ObservableMap.from(m);

  o.addKeyListener("Karl", (es) => p(es.events));
  o.addChangeListener((e) => p(e));
  o["Karl"] = 42;




}
