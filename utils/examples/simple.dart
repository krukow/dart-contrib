#import("../utils.dart");
#import("../../pprint/pprint.dart");

main() {


  p("Map");
  pp(map([1,2,3,4], (x) {
        p(x);
        return 42;
      }));

  pp(map_with_index([1,2,3,4], (x,i,_) {
        p(x);
        return i;
      }));

  pp(map_with_index([1,2,3,4], (x,i,c) {
        p(c);
        return c;
      }, context:"K"));




  p("Time");

  pp(time(()=>doit()));

  var sw = new StopWatch();
  var watches = [sw];


  try {
    var r = time(failit, watches);
    pp("Should not get here..");
    pp(r);//never get here


  } catch(Exception e) {
    pp(sw.elapsedInUs());
  }


}


doit() {
  var i=0;
  while (i<100000) {
    if (i is Object) {}
    if (i is int) {}
    i++;
  }
}


failit() {
  Expect.equals(0,42);
}
