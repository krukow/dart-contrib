class ObservableMap<K,V>
  extends AbstractObservable
  implements Map<K,V> {

  final Map<K, ObservableValue<V>> _delegate;
  /**
   * Creates a map with the default implementation.
   */
  ObservableMap():super(), this._delegate = {};

  /**
   * Creates a [Map] that contains all key value pairs of [other].
   */
  ObservableMap.from(Map<K, V> other): super(), this._delegate = {} {
    map(other, (k) {
        _delegate[k[0]] = new ObservableValue<V>(k[1]);
      });
  }

  ObservableMap.withParent(Observable parent):super(parent), this._delegate = {};

  ObservableMap.fromMapWithParent(Map<K,V> other, Observable parent):
    super(parent), this._delegate = new Map<K,V>.from(other);

  /**
   * Returns whether this map contains the given [value].
   */
  bool containsValue(V value) => _delegate.containsValue(value);

  /**
   * Returns whether this map contains the given [key].
   */
  bool containsKey(K key) => _delegate.containsKey(key);

  // /**
  //  * Returns the value for the given [key] or null if [key] is not
  //  * in the map. Because null values are supported, one should either
  //  * use containsKey to distinguish between an absent key and a null
  //  * value, or use the [putIfAbsent] method.
  //  */
  // V operator [](K key) => _delegate[key];

  // /**
  //  * Associates the [key] with the given [value].
  //  */
  // void operator []=(K key, V value) {

  // }

  // /**
  //  * If [key] is not associated to a value, calls [ifAbsent] and
  //  * updates the map by mapping [key] to the value returned by
  //  * [ifAbsent]. Returns the value in the map.
  //  */
  // V putIfAbsent(K key, V ifAbsent());

  // /**
  //  * Removes the association for the given [key]. Returns the value for
  //  * [key] in the map or null if [key] is not in the map. Note that values
  //  * can be null and a returned null value does not always imply that the
  //  * key is absent.
  //  */
  // V remove(K key);

  // /**
  //  * Removes all pairs from the map.
  //  */
  // void clear();

  // /**
  //  * Applies [f] to each {key, value} pair of the map.
  //  */
  // void forEach(void f(K key, V value));

  // /**
  //  * Returns a collection containing all the keys in the map.
  //  */
  // Collection<K> getKeys();

  // /**
  //  * Returns a collection containing all the values in the map.
  //  */
  // Collection<V> getValues();

  // /**
  //  * The number of {key, value} pairs in the map.
  //  */
  // int get length();

  // /**
  //  * Returns true if there is no {key, value} pair in the map.
  //  */
  // bool isEmpty();

  String toString() => str(list2map(map(this._delegate,(k)=>[k[0],k[1].value])));
}
