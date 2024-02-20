import 'package:http/http.dart' as http;
import 'package:newproject/repository/home_repository/default_home_repository.dart';
import 'package:newproject/repository/home_repository/home_repository.dart';

import 'core/coroutine/coroutine.dart';
import 'core/coroutine/default_coroutine.dart';
import 'core/http/default_http.dart';
import 'core/http/http.dart';
import 'core/http/intercepter.dart';
import 'core/preferences/preferences.dart';

var sl = ServiceLocator.instance;

class ServiceLocator {
  static var instance = ServiceLocator._();

  final Coroutine _coroutine;
  late Http _http;
  final Preferences _preference;

  ServiceLocator._()
      : _coroutine = DefaultCoroutine()..init(),
        _preference = Preferences.instance {
    _http = DefaultHttp(Interceptor(), _coroutine);
  }

  Coroutine get provideCorutine => _coroutine;
  Preferences get providePreferenece => _preference;
  Http get provideHttp => _http;

  HomeRepository provideLoginRepository() {
    return DefaultHomeRepository(http: _http, preferences: _preference);
  }

  // register all repository here
}
