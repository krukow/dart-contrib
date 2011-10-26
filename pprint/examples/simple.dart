#import("../pprint.dart");

class Key {
  final String first;
  final int second;
  Key(this.first,this.second);
  hashCode() => 7+ 13*first.hashCode()+17*second.hashCode();
  operator ==(o) => first == o.first && second == o.second;
  toString() => "Key[$first,$second]";
}
main () {
  // var m = {
  //   'a': 42,
  //   'b': "b",
  //   'c': new Object()
  // };
  // pp(m);
  // pp("----");

  // m = new Map();
  // m[new Key("a","b")] = {"a":"b"};
  // pp(m);
  // pp("---");

  pp("LIST");
  var exp = const [1,2,3, "a", const [const {"a":"b","c":"d"}]];
  pp("print");
  p(exp);
  pp("pretty print");
  pp(exp);

  pp("MAPS");
  var maps = {"a":{"b":{"c":"C","c2":"C2"}}};
  pp("print");
  p(maps);
  pp("pretty print");
  pp(maps);

  pp("Sets");
  var set = new Set();
  set.add(new Key("A",1));
  set.add(new Key("B",2));
  pp("print");
  p(set);
  pp("pretty print");
  pp(set);
}
