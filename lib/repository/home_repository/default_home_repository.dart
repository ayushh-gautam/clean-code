import 'package:newproject/app/utils/apis.dart';
import 'package:newproject/core/http/http.dart';
import 'package:newproject/core/preferences/preferences.dart';
import 'package:newproject/repository/home_repository/home_repository.dart';
import 'package:newproject/repository/home_repository/model/weatherModel.dart';

class DefaultHomeRepository extends HomeRepository {
  final Http _http;

  final Preferences _preferences;

  DefaultHomeRepository({required Http http, required Preferences preferences})
      : _http = http,
        _preferences = preferences;

  @override
  Future <WeatherModel?> ordersData() async {
    try {
      var response =
          await _http.get<WeatherModel>(Uri.parse(ApiEndpoint.weatherAPi));
      if (response.isValue) {
        return response.value;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
