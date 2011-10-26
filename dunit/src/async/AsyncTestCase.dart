// class AsynchronousTestCase extends TestCase {

//   AsynchronousTestCase(this.test) : super();

//   void run(TestResult result) {
//     setUp();
//     result.runGuarded(this, () {
//       addRunning(result);
//       TestExpectation expect = new TestExpectation(this, result);
//       test(expect);
//       if (!expect.hasPendingCallbacks()) {
//         Expect.isTrue(expect.hasSucceeded);
//         tearDown();
//       }
//     });
//   }

//   void tearDown() {
//     removeRunning();
//   }

//   void addRunning(TestResult result) {
//     if (running++ == 0) {
//       keepalive = new ReceivePort.singleShot();
//       keepalive.receive((message, replyTo) {
//         result.runner.done(result);
//       });
//     }
//   }

//   void removeRunning() {
//     if (--running == 0) {
//       keepalive.toSendPort().send(null, null);
//       keepalive = null;
//     }
//   }

//   AsynchronousTestFunction test;

//   static int running = 0;
//   static ReceivePort keepalive = null;

// }
