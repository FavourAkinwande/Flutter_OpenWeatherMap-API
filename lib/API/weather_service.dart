import 'dart:convert';
import 'package:http/http.dart' as http;


class WeatherService {
  final String apiKey = 'a1f1fa58960c4cf8bb3124a493401cb8'; // Replace with your actual OpenWeather API key
  
  // Base URLs for the current weather and forecast endpoints
  final String currentWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final String forecastUrl = 'https://api.openweathermap.org/data/2.5/forecast';

  // Fetch current weather data
  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final response = await http.get(
      Uri.parse('$currentWeatherUrl?q=$city&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body); // Return the current weather data
    } else {
      throw Exception('Failed to load current weather data');
    }
  }

  // Fetch forecast data for a given city
  Future<List<Map<String, String>>> fetchForecast(String city) async {
    final response = await http.get(
      Uri.parse('$forecastUrl?q=$city&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Map<String, String>> forecastList = [];
      
      // Loop through forecast data
      for (var forecast in data['list']) {
        forecastList.add({
          'day': forecast['dt_txt'],  // Date and time
          'temperature': forecast['main']['temp'].toString(),  // Temperature
          'condition': forecast['weather'][0]['description'],  // Weather condition
          'high': forecast['main']['temp_max'].toString(),  // High temperature
          'low': forecast['main']['temp_min'].toString(),  // Low temperature
        });
      }

      return forecastList;  // Return forecast data
    } else {
      throw Exception('Failed to load forecast data');
    }
  }
}
