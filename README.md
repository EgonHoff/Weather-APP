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

Build the home screen

## `header_widget.dart`
## `icon_widget.dart`
## `data_current_widget.dart`

# `home_screen.dart`

Map screen

## `data_current_widget_map.dart`

City Search Screen

## `city_search_screen.dart`

# Test

Test for controller and data models using mock and build runner

## Commands

    flutter pub run build_runner build
    flutter test

## `global_controller_test.dart`
## `mocks.dart`

    flutter pub run build_runner build


## `weather_data_test.dart`

    flutter test

# To compile

    flutter build apk
    flutter build apk --release


# Dependencies

dependencies:
    
    flutter:
    sdk: flutter

        http: ^1.3.0
        provider: ^6.1.3
        google_fonts: ^6.2.1
        cupertino_icons: ^1.0.8
        geolocator: ^13.0.3
        geocoding: ^3.0.0
        sleek_circular_slider: ^2.0.1
        get: ^4.7.2
        intl: ^0.20.2
        flutter_map: ^8.1.1
        latlong2: ^0.9.1
        mockito: ^5.4.5
        build_runner: ^2.4.

        fonts:
            - family: Overpass
            fonts:
                - asset: assets/fonts/Overpass-Regular.ttf

# Build_Info

    [√] Flutter (Channel stable, 3.29.2, on Microsoft Windows [Versi¢n 10.0.26100.3476], locale es-CL) [429ms]
        • Flutter version 3.29.2 on channel stable at E:\Flutter\flutter
        • Upstream repository https://github.com/flutter/flutter.git
        • Framework revision c236373904 (2 weeks ago), 2025-03-13 16:17:06 -0400
        • Engine revision 18b71d647a
        • Dart version 3.7.2
        • DevTools version 2.42.3

    [√] Windows Version (11 Pro 64-bit, 24H2, 2009) [1.094ms]

    [√] Android toolchain - develop for Android devices (Android SDK version 35.0.1) [2,3s]
        • Android SDK at C:\Users\Egon Hoffmann\AppData\Local\Android\sdk
        • Platform android-35, build-tools 35.0.1
        • Java binary at: C:\Program Files\Android\Android Studio\jbr\bin\java
        This is the JDK bundled with the latest Android Studio installation on this machine.
        To manually set the JDK path, use: `flutter config --jdk-dir="path/to/jdk"`.
        • Java version OpenJDK Runtime Environment (build 21.0.5+-12932927-b750.29)
        • All Android licenses accepted.

    [√] Chrome - develop for the web [172ms]
        • Chrome at C:\Program Files\Google\Chrome\Application\chrome.exe

    [√] Visual Studio - develop Windows apps (Visual Studio Community 2022 17.13.3) [171ms]
        • Visual Studio at D:\Microsoft Visual Studio\2022\Community
        • Visual Studio Community 2022 version 17.13.35828.75
        • Windows 10 SDK version 10.0.22621.0

    [√] Android Studio (version 2024.3) [14ms]
        • Android Studio at C:\Program Files\Android\Android Studio
        • Flutter plugin can be installed from:
        https://plugins.jetbrains.com/plugin/9212-flutter
        • Dart plugin can be installed from:
        https://plugins.jetbrains.com/plugin/6351-dart
        • Java version OpenJDK Runtime Environment (build 21.0.5+-12932927-b750.29)

    [√] Connected device (3 available) [178ms]
        • Windows (desktop) • windows • windows-x64    • Microsoft Windows [Versi¢n 10.0.26100.3476]
        • Chrome (web)      • chrome  • web-javascript • Google Chrome 134.0.6998.89
        • Edge (web)        • edge    • web-javascript • Microsoft Edge 134.0.3124.72

    [√] Network resources [1.273ms]
        • All expected network resources are available.


