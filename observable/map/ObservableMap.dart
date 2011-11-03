//TODO(kkr@trifork.com): NULL vs sentinel
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
    super(parent), this._delegate = {} {
    map(other, (k) {
        _delegate[k[0]] = new ObservableValue<V>(k[1]);
      });
  }

  void recordMapUpdate(K key, V newValue, V oldValue) {
    recordEvent(new MapChangeEvent<K>.map(
        this, ChangeEvent.UPDATE, key, newValue, oldValue));
  }
  void recordMapInsert(K key, newValue) {
    recordEvent(new MapChangeEvent.map(
        this, ChangeEvent.INSERT, key, newValue, null));
  }

  void recordMapRemove(K key, oldValue) {
    recordEvent(new MapChangeEvent.map(
        this, ChangeEvent.REMOVE, key, null, oldValue));
  }

  /**
   * Returns whether this map contains the given [value].
   */
  bool containsValue(V value) => this.getValues().indexOf(value,0) !== -1;

  /**
   * Returns whether this map contains the given [key].
   */
  bool containsKey(K key) => _delegate.containsKey(key);


  V _nullOrValue(ObservableValue<V> o) {
    if (o === null) return null;
    return o.value;
  }
  /**
   * Returns the value for the given [key] or null if [key] is not
   * in the map. Because null values are supported, one should either
   * use containsKey to distinguish between an absent key and a null
   * value, or use the [putIfAbsent] method.
   */
  V operator [](K key) => _nullOrValue(_delegate[key]);

  /**
   * Associates the [key] with the given [value].
   */
  void operator []=(K key, V value) {
    ObservableValue<V> ov = _delegate[key];
    if (ov == null) {
      _delegate[key] = new ObservableValue<V>(value);
      recordMapInsert(key, value);
    } else {
      V old = ov.value;
      ov.value = value;

      recordMapUpdate(key, value, old);
    }
  }

  bool addKeyListener(K key, ChangeListener listener) {
    ObservableValue<V> v = _delegate[key];
    if (v === null) {
      v = _delegate[key] = new ObservableValue<V>(null);//listen for future changes
    }
    return v.addChangeListener(listener);
  }

  bool removeKeyListener(K key, ChangeListener listener) {
    ObservableValue<V> v = _delegate[key];
    if (v === null) {
      return false;
    }
    return v.removeChangeListener(listener);
  }

  /**
   * If [key] is not associated to a value, calls [ifAbsent] and
   * updates the map by mapping [key] to the value returned by
   * [ifAbsent]. Returns the value in the map.
   */
  V putIfAbsent(K key, V ifAbsent()) {
    ObservableValue<V> ov = _delegate[key];
    if (ov == null) {
      ov = _delegate[key] = new ObservableValue<V>(ifAbsent());
      recordMapInsert(key, ov.value);
    }
    return ov.value;
  }

  /**
   * Removes the association for the given [key]. Returns the value for
   * [key] in the map or null if [key] is not in the map. Note that values
   * can be null and a returned null value does not always imply that the
   * key is absent.
   */
  V remove(K key) {
    throw const NotImplementedException();
  }

  /**
   * Removes all pairs from the map.
   */
  void clear() {
    throw const NotImplementedException();
  }

  /**
   * Applies [f] to each {key, value} pair of the map.
   */
  void forEach(void f(K key, V value)) {
    _delegate.forEach((k, ov) {
        f(k, ov.value);
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
    map(_delegate.getValues(),(ov) => ov.value);
  }

  /**
   * The number of {key, value} pairs in the map.
   */
  int get length() => _delegate.length;

  /**
   * Returns true if there is no {key, value} pair in the map.
   */
  bool isEmpty() => _delegate.isEmpty();

  String toString() => str(list2map(map(this._delegate,(k)=>[k[0],k[1].value])));
}

class MapChangeEvent<K> extends ChangeEvent {
  final K key;
  MapChangeEvent.map(target, type, key, newValue, oldValue) : super.list(target,type,null,newValue,oldValue),
    this.key = key;

  String toString() => "MapChangeEvent[$target, $type, $key, $newValue, $oldValue]";
}
