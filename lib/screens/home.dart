import 'package:flutter/material.dart';
import '../navigation/app_routes.dart'; // Import AppRoutes for navigation
import '../API/weather_service.dart'; // Import the WeatherService for API calls

// HomeScreen displays the search bar and allows users to get weather data or forecast for a given city.
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController cityController = TextEditingController();
  late Future<Map<String, dynamic>> _weatherData;

  @override
  void initState() {
    super.initState();
    _weatherData = Future.value({}); // Initialize with an empty map to avoid late initialization errors
  }

  // Function to get weather data and fetch it using the WeatherService
  void _getWeather() {
    final cityName = cityController.text.trim();
    if (cityName.isNotEmpty) {
      setState(() {
        _weatherData = WeatherService().fetchWeather(cityName); // Fetch weather data based on user input
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a city name')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Today\'s Weather',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'DN SANS',
            color: Color.fromARGB(255, 235, 235, 235),
          ),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.welcome); // Navigate back to WelcomeScreen
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade400, Colors.blue.shade900],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: cityController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  hintText: 'Search for a city',
                  hintStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _weatherCard(
                    'San Francisco',
                    'Mostly Clear',
                    '14°',
                    '11:17 PM',
                    'assets/images/sunny.jpg',
                  ),
                  _weatherCard(
                    'San Mateo',
                    'Mostly Clear',
                    '15°',
                    '11:17 PM',
                    'assets/images/auntum.jpg',
                  ),
                  _weatherCard(
                    'Tahoe City',
                    'Cloudy',
                    '4°',
                    '11:17 PM',
                    'assets/images/cloudy.jpg',
                  ),
                  _weatherCard(
                    'Beijing',
                    'Mostly Sunny',
                    '26°',
                    '2:17 PM',
                    'assets/images/winter.jpg',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 65),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavButton('Get Weather', Colors.orange, AppRoutes.weather),
                  _buildNavButton('Get Forecast', Colors.green, AppRoutes.forecast),
                  _buildNavButton('About App', Colors.blue, AppRoutes.about),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton _buildNavButton(String label, Color color, String route) {
    return ElevatedButton(
      onPressed: () {
        final cityName = cityController.text.trim();
        if (cityName.isNotEmpty) {
          Navigator.pushNamed(
            context,
            route,
            arguments: cityName,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please enter a city name')),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        elevation: 5,
      ),
      child: Text(label),
    );
  }

  Widget _weatherCard(String city, String weather, String temp, String time, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        title: Text(
          '$city $temp',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(weather),
            Text('$time'),
          ],
        ),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
