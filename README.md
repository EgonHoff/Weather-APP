# weather_app

Technicall test Equifax


# Creation of Models for Data Management  

## `weather_data_current.dart`  

Handles the data associated with the `current` key in the JSON response from WeatherAPI.  

## `weather_data_location.dart`  

Handles the data associated with the `location` key in the JSON response from WeatherAPI.  

## `weather_data.dart`  

Combines the other models, allowing for scalability with additional data structures.  
For example, if the `forecast` data from the API is needed, a new model can be created and integrated into this file.

# API Connection  

## `api_key.dart`  

Stores my API key to keep it separate from other files and import the variable when needed.  

## `fetch_weather.dart`  

Returns the API response from WeatherAPI, which is then decoded and handled using the models.  
It accepts either the city name or latitude and longitude, depending on the provided argument.

# Global Controller

## `global_controller.dart`

Using the GetX dependency for state management, the global controller handles all the project logic. It is responsible for acquiring, processing, and updating data using reactive variables and `Obx` for the UI.

# Home screen

# `home_screen.dart`

Contruccion de la pantalla principal

## `header_widget.dart`
## `icon_widget.dart`
## `data_current_widget.dart`




