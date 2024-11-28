import 'package:flutter/material.dart';

// StatefulWidget to manage state
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar without title text
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70), // Adjust AppBar height
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.deepPurple], // Gradient color
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Container(), // Empty container to create the box effect
          ),
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.deepPurple, Colors.blueAccent], // Background gradient
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Display image uploaded by the user
                    Image.asset(
                      'assets/images/weather.png', // Path to the weather image
                      height: 180,  // Adjust the height of the image
                      width: orientation == Orientation.portrait ? 300 : 500, // Adjust width based on orientation
                    ),
                    const SizedBox(height: 30),

                    // Title of the App
                    const Text(
                      'Weather Wise App',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Description text
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        'Discover accurate and real-time weather updates with our app. Get detailed forecasts, current conditions, and much more to help you stay prepared for any weather.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Get Started Button with square corners and no elevation
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');  // Navigate to HomeScreen
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // Button color
                        foregroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // Square corners (no radius)
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40), // Button padding
                        elevation: 0, // No shadow effect
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
