import 'package:flutter/material.dart';
import '../API/weather_service.dart';  // importing WeatherService

class ForecastScreen extends StatefulWidget {
  final String cityName;

  const ForecastScreen({Key? key, required this.cityName}) : super(key: key);

  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  late Future<List<Map<String, String>>> forecastData;

  @override
  void initState() {
    super.initState();
    forecastData = WeatherService().fetchForecast(widget.cityName);  // Fetch forecast data using the WeatherService
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forecast for ${widget.cityName}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent, // AppBar color
      ),
      body: FutureBuilder<List<Map<String, String>>>(  // Use FutureBuilder to display the forecast data
        future: forecastData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());  // Show loading spinner while data is fetched
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));  // Error handling
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No forecast available'));  // Handle case when no data is returned
          } else {
            final forecastData = snapshot.data!;
            final displayedData = _groupByDay(forecastData); // Group data by day

            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(  // Add a gradient background 
                  colors: [Colors.blue.shade300, Colors.blue.shade900],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ListView.builder(  // Display forecast data in a ListView
                itemCount: displayedData.length,
                itemBuilder: (context, index) {
                  final forecast = displayedData[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),  // Round the edges of the card for a sleek design
                    ),
                    color: Colors.white,  // Set card color to white
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          // Weather Icon based on the condition
                          Icon(
                            _getWeatherIcon(forecast['condition']!),  // Get the correct icon for the condition
                            color: _getIconColor(forecast['condition']!),  // Color based on the condition
                            size: 40,
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _formatDay(forecast['day']!),  // Display the formatted day of the week
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'DN SANS',
                                    color: Colors.blue,  // Change the color of the day text for contrast
                                  ),
                                ),
                                Text(
                                  '${forecast['temperature']}°C - ${forecast['condition']}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontFamily: 'DN SANS',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // High/Low Temperatures
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'High: ${forecast['high']}°C',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'DN SANS',
                                ),
                              ),
                              Text(
                                'Low: ${forecast['low']}°C',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'DN SANS',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  // Function to group the forecast data by day
  List<Map<String, String>> _groupByDay(List<Map<String, String>> forecastData) {
    // Group forecast data by day and only show the first forecast for each day
    Map<String, Map<String, String>> groupedData = {};
    for (var forecast in forecastData) {
      final day = _formatDay(forecast['day']!);  // Extract the day of the week
      if (!groupedData.containsKey(day)) {
        groupedData[day] = forecast;  // Only take the first entry for each day
      }
    }
    return groupedData.values.toList();
  }

  // Function to format the day of the forecast 
  String _formatDay(String date) {
    final DateTime parsedDate = DateTime.parse(date);
    return _getDayOfWeek(parsedDate.weekday);  // Get the weekday as a string
  }

  // Function to get the day of the week in string format
  String _getDayOfWeek(int weekday) {
    switch (weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return 'Unknown';
    }
  }

  // Function to get the icon based on weather condition
  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'clear sky':
        return Icons.wb_sunny;  // Sun icon for clear sky
      case 'clouds':
        return Icons.cloud;  // Cloud icon for clouds
      case 'rain':
        return Icons.beach_access;  // Rain icon for rain
      case 'snow':
        return Icons.ac_unit;  // Snowflake icon for snow
      case 'thunderstorm':
        return Icons.flash_on;  // Lightning icon for thunderstorm
      default:
        return Icons.wb_cloudy;  // Default icon for unknown condition
    }
  }

  // Function to get icon color based on the weather condition
  Color _getIconColor(String condition) {
    switch (condition.toLowerCase()) {
      case 'clear sky':
        return Colors.orange;  // Sunny weather icon color
      case 'clouds':
        return Colors.grey;  // Cloudy weather icon color
      case 'rain':
        return Colors.blue;  // Rainy weather icon color
      case 'snow':
        return Colors.lightBlueAccent;  // Snow weather icon color
      case 'thunderstorm':
        return Colors.yellow;  // Thunderstorm icon color
      default:
        return Colors.grey;  // Default icon color
    }
  }
}
