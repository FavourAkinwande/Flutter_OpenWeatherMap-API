### **Project Analysis**

Your project, WeatherWise App, is a weather application built using **Flutter**. The application fetches weather data and displays it in a user-friendly format. The app interacts with the **OpenWeatherMap API**, a widely-used weather data service. B
---

## **API Chosen and Its Purpose**

The **OpenWeatherMap API** was chosen for this project because of its:

1. **Comprehensive Data**: It provides real-time weather data, including temperature, humidity, weather condition, forecasts, and more.
2. **Global Coverage**: The API supports cities across the world, making it an ideal choice for a weather app that caters to users globally.
3. **Ease of Integration**: The API offers a straightforward and well-documented interface, making it easy to integrate with Flutter and other platforms.

### **Purpose of the API**

The purpose of using the **OpenWeatherMap API** in this project is to retrieve real-time weather information for a specified city. The application makes HTTP requests to the API, retrieves the weather data, and displays it in a user-friendly format. Key features supported by the API and integrated into the app include:

- **Current Weather**: Provides details such as temperature, humidity, weather condition, wind speed, and more.
- **Weather Forecast**: Offers forecast data for upcoming days.


### **Introduction**

This Flutter-based Weather App allows users to search for cities and view real-time weather information, including temperature, humidity, and conditions. The app fetches weather data from the **OpenWeatherMap API** and displays it in a well-organized, visually appealing interface. It also includes features to view weather forecasts and learn more about the app.

---

### **Getting Started**

To get started with this project, you will need to have **Flutter** installed and set up on your machine.

#### Prerequisites

- Install **Flutter** from [Flutter's official website](https://flutter.dev).
- Set up a **Dart SDK** (which comes with Flutter).
- Create an account at [OpenWeatherMap](https://openweathermap.org/) to get an API key for accessing weather data.

---

### **Installation**

1. Clone the repository:

    ```bash
    git clone https://github.com/FavourAkinwande/Flutter_OpenWeatherMap-API.git
    cd Flutter_OpenWeatherMap-API
    ```

2. Install the necessary packages:

    ```bash
    flutter pub get
    ```

3. Set up the OpenWeatherMap API key:
   
   - Create an account on [OpenWeatherMap](https://openweathermap.org/).
   - Go to the [API keys page](https://home.openweathermap.org/api_keys) and generate an API key.
   - Replace the `apiKey` in `weather_service.dart` with your generated API key.

---

### **Usage**

- The application starts with a Welcome Screen, where users can navigate to the Home Screen to search for weather information.
- On the Home Screen, users can type a city name into the search bar and press buttons to get the current weather or forecast.
- Once a city is entered, the app fetches the weather data from the OpenWeatherMap API and displays it in a visually appealing card-based layout.
- Users can navigate to the Weather Screen to view current weather data for the specified city.
- Users can navigate to the Forecast Screen for a detailed forecast of the next few days.
- The About Screen provides information about the app, including its purpose and functionality. Users can navigate to this screen to learn more about the app.
---

### **Codebase**

The project consists of several screens, each performing a specific function. Here's a breakdown of the critical components:

1. **Main Application (`main.dart`)**:
   - Initializes the Flutter app.
   - Manages routing for different screens (`HomeScreen`, `WeatherScreen`, `ForecastScreen`, etc.).

2. **Weather Service (`weather_service.dart`)**:
   - Handles the HTTP requests to fetch weather data from the OpenWeatherMap API.
   - It contains two primary functions:
     - `fetchWeather()`: Fetches current weather data.
     - `fetchForecast()`: Fetches forecast data.

3. **Home Screen (`home.dart`)**:
   - Displays a search bar for users to enter the city name.
   - Has buttons to fetch the current weather or forecast.

4. **Weather Screen (`weather_screen.dart`)**:
   - Displays detailed weather information for the specified city.
   - Shows data like temperature, humidity, wind speed, and weather condition.

5. **Forecast Screen (`forecast_screen.dart`)**:
   - Displays a 5-day weather forecast with temperature, condition, and other relevant information.

6. **App Routes (`app_routes.dart`)**:
   - Manages the navigation between screens.

---

### **API Usage**

- **Base URLs**:
  - `https://api.openweathermap.org/data/2.5/weather`: Used to fetch current weather data.
  - `https://api.openweathermap.org/data/2.5/forecast`: Used to fetch forecast data.

- **Request Parameters**:
  - `q`: City name (e.g., "London").
  - `appid`: Your OpenWeatherMap API key.
  - `units`: The units of measurement for temperature (e.g., `metric` for Celsius).

---

### **Contributing**

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit (`git commit -m 'Add new feature'`).
4. Push the changes (`git push origin feature-branch`).
5. Open a pull request.

---

### **License**

This project is open source and available under the [MIT License](LICENSE).

---

### **Conclusion**

This weatherwise app provides users with a simple yet functional interface to check the weather for any city. By integrating the OpenWeatherMap API, we can ensure that users get accurate and up-to-date information. The app's modular design allows for easy extension, whether it's adding more weather details or implementing additional features in the future. 
