class FirstTestCase extends TestCase {
  FirstTestCase():super("FirstTestCase");
  tests() => {
    "Sum should work" : test_sum,
    "Subtract should work": ()=>Expect.equals(0,42-42)
  };

  test_sum() {
    Expect.equals(42,40+2);
  }
}
