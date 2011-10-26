class ConsoleReporter extends TestReporter {
  const ConsoleReporter();

  color(str,c) {
    //return '\033[${c}m${str}\033[0m';
    return str;
  }
  red(str) {
    return color(str,'31');
  }
  green(str) {
    return color(str,'32');
  }
  yellow(str) {
    return color(str,'33');
  }

  print_defects(defects [indent=""]) {
    defects.forEach((num, r) {
        print("${indent}${r['name']}: ${r['outcome']} (${r['time']} us)");
        print("${indent}${r['message']}");
        print("${indent}${r['trace']}");

      });

  }
  print_passed(passed [indent=""]) {
    passed.forEach((num, r) {
        print("${indent}${r['name']}: ${r['outcome']} (${r['time']} us)");
      });

  }

  void report(TestResult res [indent=""]) {
    res.results.forEach((k,tr) {
        if (k is TestSuite) {
          print("${indent}TestSuite:  ${k.name} (${tr['outcome']})");
          report(tr['result'],indent:"  "+indent);
        }
        if (k is TestCase) {
          print("${indent}TestCase: ${k.name} (${tr['outcome']})");

          var r = tr['result'];
          var defects = r.defects();
          if (defects.length>0) {
            print("${indent}Defects:");
            print_defects(defects,indent:"  "+indent);
          }
          var passed = r.passed();
          if (passed.length>0) {
            print("${indent}Passed:");
            print_passed(passed,indent:"  "+indent);
          }

        }

      });

  }

}
