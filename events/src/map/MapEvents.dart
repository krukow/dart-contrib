class MapEvents extends EventTargetEvents {
  Map _keyListeners;

  MapEvents(): super(),
     this._keyListeners = {};

  EventListenerList keychange(key) {
    return _keyListeners.putIfAbsent(key,
               () => new EventListenerList("keychange"));
  }

  EventListenerList get change() => _get("change");
  EventListenerList get remove() => _get("remove");
  EventListenerList get add() => _get("add");



  EventListenerList _get(String type) {
    if (type == "keychange") {return this._keyListeners;}
    return super[type];
  }

  EventListenerList getEvents(String type) {return _get(type);}

}
