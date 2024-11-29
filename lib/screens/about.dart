import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key}); // Use super.key for constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Bold font for the title for emphasis
            fontSize: 20,  // Slightly larger font size for better visibility
            fontFamily: 'DN SANS',  // Consistent font family for the app
            color: Colors.white,  // Title color changed to white for contrast
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent, // Matching the app's primary color for the AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(  // Apply a gradient background for a modern look
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade300, Colors.blue.shade800], // Gradient colors
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),  // Padding for better content spacing
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              Image.asset(
                'assets/images/globe.png',  // Placeholder image for the app logo
                width: 200,  // width for better fit
                height: 200,  // height
              ),
              const SizedBox(height: 20),  
              
              // Header Text: 
              const Text(
                'Welcome to Weather Wise!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,  // font size for header visibility
                  fontWeight: FontWeight.bold,
                  color: Colors.white,  // White color for contrast against the background
                ),
              ),
              const SizedBox(height: 20),  // Spacer between title and description
              
              // Description Text: Explaining the app’s functionality
              const Text(
                'The Weather Wise app, built with Flutter, allows you to view the current weather, check the forecast, '
                'and learn more about the app through this About screen. It\'s simple and user-friendly, designed '
                'to help you stay updated with the latest weather information.',
                textAlign: TextAlign.center,  // Center align for better presentation
                style: TextStyle(
                  fontSize: 16,  // Reasonable font size for content readability
                  color: Colors.white70,  // Slightly dimmer text color for easy reading
                ),
              ),
              const SizedBox(height: 40),  // Spacer between description and button

              // Action Button: Navigating back to the Home screen
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);  // Navigate back to the previous screen (Home)
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 152, 0),  // Orange background for the button
                  foregroundColor: Colors.white,  // White text for better contrast
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),  // Rounded corners for a sleek look
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),  // Padding for the button
                  elevation: 5,  // Subtle shadow for visual appeal
                ),
                child: const Text('Back to Home'),  // Button text
              ),
            ],
          ),
        ),
      ),
    );
  }
}
