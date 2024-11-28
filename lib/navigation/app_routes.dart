import 'package:flutter/material.dart';
import '../screens/welcome.dart';  // Import WelcomeScreen
import '../screens/home.dart';     // Import HomeScreen
import '../screens/weather_screen.dart';  // Import WeatherScreen
import '../screens/forecast_screen.dart'; // Import ForecastScreen
import '../screens/about.dart';           // Import AboutScreen

class AppRoutes {
  // Define the static route names
  static const String welcome = '/';
  static const String home = '/home';
  static const String weather = '/weather';
  static const String forecast = '/forecast';
  static const String about = '/about';

  // This function generates routes based on the provided route name.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Default route handling when no match is found
    switch (settings.name) {
      case welcome:
        return _buildPageRoute(const WelcomeScreen(), settings);
        
      case home:
        return _buildPageRoute(const HomeScreen(), settings);
        
      case weather:
        // Check if arguments exist (e.g., cityName) and handle accordingly
        final cityName = settings.arguments as String? ?? 'New York';
        return _buildPageRoute(WeatherScreen(cityName: cityName), settings);
        
      case forecast:
        // Similarly handle arguments for forecast screen
        final cityName = settings.arguments as String? ?? 'New York';
        return _buildPageRoute(ForecastScreen(cityName: cityName), settings);
        
      case about:
        return _buildPageRoute(const AboutScreen(), settings);

      // Handle any undefined routes and provide a 404 error message
      default:
        return _buildPageRoute(const Scaffold(
          body: Center(child: Text('404: Page Not Found')),
        ), settings);
    }
  }

  // Helper function to streamline the creation of routes
  static MaterialPageRoute _buildPageRoute(Widget screen, RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => screen,  // Return the specific screen based on the route
      settings: settings,
    );
  }
}
