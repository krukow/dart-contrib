class MapEventTarget<K,V>
  extends EventTarget
  implements Map<K,V> {

  final Map<K, V> _delegate;
  /**
   * Creates a map with the default implementation.
   */
  MapEventTarget():super(null,new MapEvents()), this._delegate = {};

  /**
   * Creates a [Map] that contains all key value pairs of [other].
   */
  MapEventTarget.from(Map<K, V> other): super(null, new MapEvents()),
    this._delegate = new Map<K,V>.from(other);

  /**
   * Returns whether this map contains the given [value].
   */
  bool containsValue(V value) => this._delegate.containsValue(value);

  /**
   * Returns whether this map contains the given [key].
   */
  bool containsKey(K key) => _delegate.containsKey(key);


  /**
   * Returns the value for the given [key] or null if [key] is not
   * in the map. Because null values are supported, one should either
   * use containsKey to distinguish between an absent key and a null
   * value, or use the [putIfAbsent] method.
   */
  V operator [](K key) => _delegate[key];

  /**
   * Associates the [key] with the given [value].
   */
  void operator []=(K key, V value) {
    bool newKey = !this._delegate.containsKey(key);
    V old = _delegate[key];
    this._delegate[key] = value;
    if (newKey) {
      this.dispatch(new MapEvent.add(this,key,value,null));
    }
    this.on.keychange(key).dispatch(new MapEvent.change(this,"keychange", value, old));
  }


  /**
   * If [key] is not associated to a value, calls [ifAbsent] and
   * updates the map by mapping [key] to the value returned by
   * [ifAbsent]. Returns the value in the map.
   */
  V putIfAbsent(K key, V ifAbsent()) {
    return _delegate.putIfAbsent(key, () {
        V val = ifAbsent();
        this.dispatch(new MapEvent.add(this,key,val,null));
        this.on.keychange(key).dispatch(
                    new MapEvent.change(this,"keychange", val, null));
        return val;//TODO this dispatches events before change?
      });
  }

  /**
   * Removes the association for the given [key]. Returns the value for
   * [key] in the map or null if [key] is not in the map. Note that values
   * can be null and a returned null value does not always imply that the
   * key is absent.
   */
  V remove(K key) {
    if (this._delegate.containsKey(key)) {
      V val = this._delegate.remove(key);
      this.on.keychange(key).dispatch(new MapEvent.change(this,key,null,val));
      this.dispatch(new MapEvent.remove(this,key,null,val));
      return val;
    }
    return null;
  }

  /**
   * Removes all pairs from the map.
   */
  void clear() {
    //TODO(kkr@trifork.com) more efficient?
    forEach((k,_) {
        this._delegate.remove(k);
      });

  }

  /**
   * Applies [f] to each {key, value} pair of the map.
   */
  void forEach(void f(K key, V value)) {
    _delegate.forEach((k, ov) {
        f(k, ov);
      });
  }

  /**
   * Returns a collection containing all the keys in the map.
   */
  Collection<K> getKeys() => _delegate.getKeys();

  /**
   * Returns a collection containing all the values in the map.
   */
  Collection<V> getValues() {
    return _delegate.getValues();
  }

  /**
   * The number of {key, value} pairs in the map.
   */
  int get length() => _delegate.length;

  /**
   * Returns true if there is no {key, value} pair in the map.
   */
  bool isEmpty() => _delegate.isEmpty();

  String toString() => str(_delegate);
}
