import 'package:flutter/material.dart';
import '../API/weather_service.dart'; // Import the WeatherService class for API calls

class WeatherScreen extends StatefulWidget {
  final String cityName;

  const WeatherScreen({Key? key, required this.cityName}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState(); // Create the state for WeatherScreen
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> _weatherData;

  @override
  void initState() {
    super.initState();
    _weatherData = WeatherService().fetchWeather(widget.cityName); // Fetch weather data when the screen initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather in ${widget.cityName}',
          style: const TextStyle(
            color: Color.fromARGB(255, 235, 235, 235),
            fontWeight: FontWeight.bold, // Make the text bold
            fontSize: 20,
            fontFamily: 'DN SANS' // Adjust the font size as desired
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 5, 109, 194), // Set a consistent color for AppBar
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _weatherData, // Use FutureBuilder to handle data asynchronously
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());  // Show loading indicator while fetching data
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));  // Display error if there's an issue fetching data
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No data available'));  // Handle empty data response
          } else {
            final weather = snapshot.data!;
            final weatherCondition = weather['weather'] != null && weather['weather'].isNotEmpty
                ? weather['weather'][0]['description']
                : 'Unknown';
            final temperature = weather['main'] != null ? weather['main']['temp'] : 'N/A';
            final high = weather['main'] != null ? weather['main']['temp_max'] : 'N/A';
            final low = weather['main'] != null ? weather['main']['temp_min'] : 'N/A';
            final humidity = weather['main'] != null ? weather['main']['humidity'] : 'N/A';
            final location = weather['name'] ?? 'Unknown';

            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade400, Colors.blue.shade900], // Beautiful gradient for the background
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Rounded corners for the card
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location: $location',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Temperature: $temperature°C',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Condition: $weatherCondition',
                            style: const TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildWeatherDetail('High: $high°C', Colors.orange),
                              _buildWeatherDetail('Low: $low°C', Colors.blue),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSmallDetail('Precipitation: 0.1in', Colors.green),
                      _buildSmallDetail('Humidity: $humidity%', Colors.blueAccent),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Image.asset(
                      'assets/images/weather_icon.png', // Customize weather icon
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.45,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  // Widget to display weather detail (high, low) in cards with a specified color
  Widget _buildWeatherDetail(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  // Widget to display smaller weather details (Precipitation, Humidity) with shadow effect
  Widget _buildSmallDetail(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
