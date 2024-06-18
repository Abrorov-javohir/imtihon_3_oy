import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather_data.dart'; // Import the file where the classes are defined

class LocationWidget extends StatefulWidget {
  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  LocationData? _currentLocation;
  String? _cityName;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    // Check if service is enabled
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // Check for permissions
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // Get location
    LocationData _locationData = await location.getLocation();

    setState(() {
      _currentLocation = _locationData;
    });

    // Fetch city name from API
    await _fetchCityName();
  }

  Future<void> _fetchCityName() async {
    if (_currentLocation == null) return;

    final lat = _currentLocation!.latitude;
    final lon = _currentLocation!.longitude;
    final apiKey = 'aa72dbb5f2c7488dbbc71f1b735aeca1';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final weatherData = WeatherData.fromJson(data);
        setState(() {
          _cityName = weatherData.name;
        });
      } else {
        print('Failed to load city name');
      }
    } catch (e) {
      print('Error fetching city name: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          IconButton(
            onPressed: _getLocation,
            icon: const Icon(Icons.location_on, size: 40, color: Colors.black),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Location",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Text(
                _cityName != null ? _cityName! : "Loading...",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
