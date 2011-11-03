class Key {
  final k1;
  final k2;
  Key(this.k1,this.k2);
  int hashCode()=>41+7*k1.hashCode()+13*k2.hashCode();
  bool operator ==(o) => (o is Key) && k1==o.k1 && k2 == o.k2;
  String toString() => "Key[$k1,$k2]";
}
