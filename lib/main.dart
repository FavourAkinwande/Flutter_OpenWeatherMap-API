import 'package:flutter/material.dart';
import 'navigation/app_routes.dart'; // Importing the AppRoutes class for navigation

/// Main entry point of the Weather  wise App
/// The `MyWeatherApp` widget is the root widget that starts the app and sets up routing.
void main() => runApp(const MyWeatherApp());

/// This is the main widget of the app, responsible for setting up the app's Material design 
/// and handling initial routing using AppRoutes.
class MyWeatherApp extends StatelessWidget {
  const MyWeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Return the MaterialApp widget, which is the main widget for a Flutter app.
    // MaterialApp sets up basic app-wide configurations like routes, theme, and title.
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Hides the debug banner when the app is running
      title: 'Weather App',  // Title for the app, displayed in the app switcher
      initialRoute: AppRoutes.welcome,  // The initial route for the app, directing to WelcomeScreen
      onGenerateRoute: AppRoutes.generateRoute,  // Use AppRoutes for generating named routes
     
    );
  }
}
