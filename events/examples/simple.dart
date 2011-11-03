#import("../events_base.dart");

class Clickable extends EventTarget {
  Clickable(): super(null, new ClickableEvent());
}
class ClickableEvent extends EventTargetEvents {
  get click() => this["click"];

}

main() {
  var et = new Clickable();
  var et2 = new Clickable();
  et.parent = et2;
  var c1 = (v)=>print(v);

  et.on.click.add(c1);
  var c2 = (v)=>print("22 $v");
  et2.on.click.add(c2);

  et.dispatch(new Event("click", 42));

  et.on.click.remove(c1);
  et.dispatch(new Event("click", 42));
  et2.on.click.remove(c2);
  et.dispatch(new Event("click", 42));

}
