class TestReporter {
  const TestReporter();
  void report(TestResult res) {
    res.results.forEach((k,tr) {
        if (k is TestSuite) {
          print("TestSuite:  ${k.name}");
          report(tr['result']);
        }
        if (k is TestCase) {
          print("TestCase: ${k.name}");
          var r = tr['result'];
          var defects = r.defects();
          if (defects.length>0) {
            print("Defects:");
            pp(defects);
          }
          var passed = r.passed();
          if (passed.length>0) {
            print("Passed:");
            pp(passed);

          }

        }


        // pp(tr);
        // if (tr['result'] != null) {
        //   tr['result'].defects().forEach((k,tr) {
        //       pp(tr);
        //       if (tr['result'] != null) {
        //         pp("Test results:");
        //         pp("defects:");
        //         pp(tr['result'].defects());
        //         pp("passed:");
        //         pp(tr['result'].passed());
        //       }
        //   });
        // pp("    passed:");
        // tr['result'].passed().forEach((k,tr) {
        //     pp(tr);
        //     if (tr['result'] != null) {
        //       pp("Test results:");
        //       pp("defects:");
        //       pp(tr['result'].defects());
        //       pp("passed:");
        //       pp(tr['result'].passed());
        //     }
        //   });
      });

  }

}
