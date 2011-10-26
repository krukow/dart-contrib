class TestPromise<T> extends PromiseImpl<T> {

  TestPromise(this.expect) : super();

  void addCompleteHandler(void completeHandler(T result)) {
    super.addCompleteHandler(expect.runs1((T result) {
      completeHandler(result);
    }));
  }

  final TestExpectation expect;

}
