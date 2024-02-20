import 'coroutine.dart';
import 'coroutine_params.dart';

class MockCoroutine extends Coroutine {
  @override
  Future<dynamic> send(Object payload) async {
    if (payload is WithOneParam) {
      return payload.function(payload.param);
    } else if (payload is WithTwoParam) {
      return payload.function(
        payload.param1,
        payload.param2,
      );
    } else if (payload is WithThreeParam) {
      return payload.function(
        payload.param1,
        payload.param2,
        payload.param3,
      );
    } else if (payload is WithFourParam) {
      return payload.function(
        payload.param1,
        payload.param2,
        payload.param3,
        payload.param4,
      );
    }
  }
}
