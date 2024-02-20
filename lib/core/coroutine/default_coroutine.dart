// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:isolate';

import 'coroutine.dart';
import 'coroutine_params.dart';

class DefaultCoroutine extends Coroutine {
  /// Holds the instance of the isolate
  late Isolate _isolate;

  /// Holds the instance of the main thread port for communication
  late ReceivePort _mainReceivePort;

  /// Holds the instance of the isolate open port to send messages
  late SendPort _isolateSendPort;

  /// The completer used to make the [init] async awaiting until receive the
  /// isolate send port from the isolate
  final _completer = Completer();

  /// Return if the worker is initialized. Can be used to validate before
  /// sending messages in the case where it's not possible to await the [init]
  /// execution.
  bool get isInitialized => _completer.isCompleted;

  Future<void> init() async {
    _mainReceivePort = ReceivePort();
    _isolate =
        await Isolate.spawn(_isolateEntryPoint, _mainReceivePort.sendPort);
    _mainReceivePort.listen((message) {
      if (message is SendPort) {
        _isolateSendPort = message;
        _completer.complete();
      }
    });
    // , onError: (dynamic error) {
    //   Timber.d("Error from default coroutine");
    //   _restartIsolate();
    // });
    // await send(WithOneParam(timeZoneInit, ""));
  }

  // void _restartIsolate() {
  //   kill();
  //   init();
  // }

  void kill() {
    _isolate.kill();
  }

  /// Runs in the main thread
  @override
  Future<dynamic> send(Object payload) async {
    ReceivePort taskReceivePort = ReceivePort();

    await _completer.future;

    _isolateSendPort.send(
      _Message(payload, taskReceivePort.sendPort),
    );

    return taskReceivePort.first;
  }

  /// Runs in the background thread
  static void _isolateEntryPoint(SendPort sendPort) {
    final receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);

    receivePort.listen((Object? message) async {
      var msg = message as _Message;
      var payload = msg.payload;

      if (payload is WithOneParam) {
        var result;
        try {
          result = payload.function(payload.param);
        } catch (e) {
          // debugPrint(e.toString());
        }
        msg.sendPort.send(result);
      } else if (payload is WithTwoParam) {
        var result = payload.function(
          payload.param1,
          payload.param2,
        );
        msg.sendPort.send(result);
      } else if (payload is WithThreeParam) {
        var result = payload.function(
          payload.param1,
          payload.param2,
          payload.param3,
        );
        msg.sendPort.send(result);
      } else if (payload is WithFourParam) {
        var result = payload.function(
          payload.param1,
          payload.param2,
          payload.param3,
          payload.param4,
        );
        msg.sendPort.send(result);
      }
    });
  }
}

class _Message {
  final Object? payload;
  final SendPort sendPort;

  _Message(this.payload, this.sendPort);
}
