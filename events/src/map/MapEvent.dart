class MapEvent<K,V> extends EventImpl implements Event {
  static final String CHANGE = "change";
  static final String REMOVE = "remove";
  static final String ADD = "add";

  final K key;
  final V value;
  final V oldvalue;

  MapEvent.change(Map target, K key, V value, V oldvalue):
    super(MapEvent.CHANGE,{"key":key,"new":value,"old":oldvalue}),
    this.key = key,
    this.value = value,
    this.oldvalue = oldvalue {
    this.target = target;
  }

  MapEvent.remove(Map target, K key, V value, V oldvalue):
    super(MapEvent.REMOVE,{"key":key,"new":value,"old":oldvalue}),
    this.key = key,
    this.value = value,
    this.oldvalue = oldvalue  {
    this.target = target;
  }

  MapEvent.add(Map target, K key, V value, V oldvalue):
    super(MapEvent.ADD,{"key":key,"new":value,"old":oldvalue}),
    this.key = key,
    this.value = value,
    this.oldvalue = oldvalue  {
    this.target = target;
  }

  String toString() => "MapEvent[$key,$value,$oldvalue,${super.toString()}]";
}
