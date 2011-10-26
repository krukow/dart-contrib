class SecondTestCase extends TestCase {
  SecondTestCase():super("SecondTestCase");
  tests() => {
    "Filter should work" : test_filter
  };

  test_filter() {
    Expect.equals([2,4], [1,2,3,4,5].filter((w) => w%2 == 0));
  }
}
