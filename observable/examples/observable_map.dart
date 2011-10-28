#import("../../../dart/shared/observable/observable.dart");

#import("../observable.dart");
#import("../../pprint/pprint.dart");
#import("../../utils/utils.dart");


main() {
  Map<String, int> m = {"Karl":1, "Krukow":2};
  print(new ObservableMap.from(m));
}
