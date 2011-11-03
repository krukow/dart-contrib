class TestResult {
  static final SUCCESS = "SUCCESS";
  static final FAILURE = "FAILURE";

  final Map results;

  int _index;

  TestResult() : results = {},_index=0;

  fail(test, [name, time, message, stackTrace, result]) {
    add(FAILURE, test, name, time, message,stackTrace,result);
    return this;
  }

  pass(test, [name, time, message, result]) {
    add(SUCCESS, test, name, time, message, null, result);
    return this;
  }

  add(outcome, test, name, time, message, stackTrace, result) {
    var key = test;
    if (test is Function) {
      key = _index++;
    }
    results[key] = {
          'outcome': outcome,
          'name': name,
          'test': test,
          'time': time,
          'message': message,
          'trace': stackTrace,
          'result':result
    };
  }


  defects() {
    return findByStatus(FAILURE);
  }
  passed() {
    return findByStatus(SUCCESS);
  }

  noDefects() {
    return defects().length == 0;
  }

  findByStatus(var status) {
    return findBy((res,_) => res['outcome'] == status);
  }

  findBy(var pred) {
    var res = {};
    results.forEach((test, result)  {
        if (pred(result,test)) res[test] = result;
      });
    return res;
  }

}
