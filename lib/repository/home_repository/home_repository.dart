import 'package:newproject/repository/home_repository/model/weatherModel.dart';

abstract class HomeRepository {
  Future <WeatherModel?>ordersData();
}
