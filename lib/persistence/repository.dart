
import 'package:fetch_data_bloc_rxdart/model/weather_response_model.dart';

import 'api_provider.dart';

class Repository {
  ApiProvider appApiProvider = ApiProvider();

  Future<List<WeatherResponse>> fetchLondonWeather() => appApiProvider.fetchLondonWeather();
}
