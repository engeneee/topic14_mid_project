import 'dart:io';

import 'package:weather_console_app/weather_api_client.dart';

void main(List<String> arguments) async {
  if (arguments.length != 1) {
    print('Syntax error: dart bin/main.dart <city>');
    return;
  }

  final cityName = arguments.first;

  final cityApiClient = CityApiClient();

  try {
    final currentCity = await cityApiClient.getCityName(cityName);
    for (var city in currentCity){
       print('Current Info for $cityName');
       print(city);
       print('---------------------------\n');

    }
    print('Please enter the Place ID for the city you want more information about:');
    final placeId = stdin.readLineSync();

    if (placeId != null) {
  final cityDetails = await cityApiClient.getCityDetails(placeId);
  print('City Details:');
  print(cityDetails);
} else {
  print('Invalid or missing Place ID. Please enter a valid Place ID.');
}
  } on SocketException catch (_) {
    print('Could not fetch current info of city. Check your internet connection!');
  } catch (e) {
    print(e);
  }
}








// import 'package:weather_console_app/city.dart';
