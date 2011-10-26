class TestSuite {
  final List<TestCase> testCases;
  final String name;
  TestSuite([name="TestSuite", List tests = const []]) :
    this.name=name,
    testCases = <TestCase>[]
  {
    for (var test in tests) {
      add(test);
    }
  }

  add(var test) {
    testCases.add(test);
  }

  String toString() => this.name;
  int hashCode() {
    int res = 7 + 13*name.hashCode();
    testCases.forEach((tc){
        res += tc.hashCode()*41;
      });
    return res;
  }
}
