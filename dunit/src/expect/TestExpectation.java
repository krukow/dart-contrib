class TestExpectation {

  TestExpectation(this.testCase, this.result);

  void succeeded() {
    Expect.equals(0, pendingCallbacks);
    hasSucceeded = true;
    testCase.tearDown();
  }

  void failed() {
    testCase.tearDown();
  }

  Promise completes(Promise promise) {
    Promise result = new TestPromise(this);
    promise.then((value) { result.complete(value); });
    return result;
  }

  Function runs0(Function fn) {
    bool ran = false;  // We only check that the function is executed once.
    pendingCallbacks++;
    return () {
      if (!ran) pendingCallbacks--;
      ran = true;
      return result.runGuarded(testCase, () => fn());
    };
  }

  Function runs1(Function fn) {
    bool ran = false;  // We only check that the function is executed once.
    pendingCallbacks++;
    return (a0) {
      if (!ran) pendingCallbacks--;
      ran = true;
      return result.runGuarded(testCase, () => fn(a0));
    };
  }

  Function runs2(Function fn) {
    bool ran = false;  // We only check that the function is executed once.
    pendingCallbacks++;
    return (a0, a1) {
      if (!ran) pendingCallbacks--;
      ran = true;
      return result.runGuarded(testCase, () => fn(a0, a1));
    };
  }

  bool hasPendingCallbacks() {
    return pendingCallbacks > 0;
  }

  final AsynchronousTestCase testCase;
  final TestResult result;

  int pendingCallbacks = 0;
  bool hasSucceeded = false;

}
