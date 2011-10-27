#library("contrib.utils");

time(action, [watches]) {
  var actionTimer = new StopWatch();
  if (watches == null) {
    watches = [];
  } else if (watches is StopWatch) {
    watches = [watches];
  }
  assert(watches is Collection);
  try {
    watches.forEach((w) => w.start());
    actionTimer.start();
    action();
  } finally {
    actionTimer.stop();
    watches.forEach((w) => w.stop());
  }
  return actionTimer.elapsedInUs();
}



final _NOTHING = const Object();

//Maps arent collections, collections dont have map
map_with_index(coll, f, [context]) {
  var res = [];
  int idx=0;
  coll.forEach((k, [v=_NOTHING]) {
      if (v === _NOTHING) {
        res.add(f(k, idx, context));
      } else {
        res.add(f([k, v], idx, context));
      }
      idx += 1;
    });
  return res;
}

map(coll, f) {
  return map_with_index(coll, (x,_,__)=>f(x));
}

reduce(coll, init, f) {
  if (coll.length == 0) return init;
  var cur = init;
  coll.forEach((v) {
      cur = f(cur,v);
    });
  return cur;
}
