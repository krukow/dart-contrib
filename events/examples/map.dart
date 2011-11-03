#import("../events_map.dart");
#import("../../pprint/pprint.dart");

class KeyPair {
  final k1;final k2;
  KeyPair(this.k1,this.k2);
  int hashCode() => 7*k1.hashCode() + 13*k2.hashCode();
  toString() => "{$k1,$k2}";
}
main () {
  var m  = new MapEventTarget();
  KeyPair p = new KeyPair(1,2);
  m[p] = "12";
  pp(m);
  m.on.keychange(p).add((e) {
      pp(e);
    });

  KeyPair p2 = new KeyPair(2,2);
  m.on.keychange(p2).add((e) {
      pp(e);
    });

  m[p] = "42";
  pp("-..");
  m[p2] = "11";
}
