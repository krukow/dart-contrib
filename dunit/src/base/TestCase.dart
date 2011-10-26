class TestCase {
  final String name;
  TestCase([name="TestCase"]): this.name=name;

  void setUp() {}
  abstract tests();
  void tearDown() {}

  String toString()=>name;
  int hashCode() => name.hashCode();


}
