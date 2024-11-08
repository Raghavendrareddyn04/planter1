import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import '../services/weather_service.dart';
import 'package:intl/intl.dart';

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  bool _isLoading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  Future<void> _loadWeather() async {
    try {
      final weather = await _weatherService.getWeather();
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Color _getWeatherColor(String condition) {
    condition = condition.toLowerCase();
    if (condition.contains('clear')) return Colors.orange;
    if (condition.contains('cloud')) return Colors.grey;
    if (condition.contains('rain')) return Colors.blue;
    if (condition.contains('snow')) return Colors.lightBlue;
    if (condition.contains('thunder')) return Colors.amber;
    if (condition.contains('mist') || condition.contains('fog')) return Colors.blueGrey;
    return Colors.orange;
  }

  IconData _getWeatherIcon(String condition) {
    condition = condition.toLowerCase();
    if (condition.contains('clear')) return Icons.wb_sunny;
    if (condition.contains('cloud')) return Icons.cloud;
    if (condition.contains('rain')) return Icons.water_drop;
    if (condition.contains('snow')) return Icons.ac_unit;
    if (condition.contains('thunder')) return Icons.flash_on;
    if (condition.contains('mist') || condition.contains('fog')) return Icons.cloud;
    return Icons.wb_sunny;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showWeatherDetails(context);
      },
      child: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFF3E0),
              Color(0xFFFFE0B2),
            ],
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.brown),
                ),
              )
            : _error.isNotEmpty
                ? Text(
                    _error,
                    style: const TextStyle(color: Colors.brown),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat('yyyy-MM-dd').format(DateTime.now()),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.brown,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        _weather?.weatherDescription?.toLowerCase() ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.brown,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${_weather?.temperature?.celsius?.toStringAsFixed(1)}°C',
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),
                          ),
                          Icon(
                            _getWeatherIcon(_weather?.weatherDescription ?? ''),
                            color: _getWeatherColor(_weather?.weatherDescription ?? ''),
                            size: 48,
                          ),
                        ],
                      ),
                    ],
                  ),
      ),
    );
  }

  void _showWeatherDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildDetailedWeather(),
                  _buildAdditionalInfo(),
                  _buildSprayingRecommendation(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailedWeather() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${_weather?.areaName ?? "Unknown Location"}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Last updated: ${DateFormat('HH:mm').format(DateTime.now())}',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_weather?.temperature?.celsius?.toStringAsFixed(1)}°C',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _weather?.weatherDescription ?? '',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Icon(
                  _getWeatherIcon(_weather?.weatherDescription ?? ''),
                  size: 48,
                  color: _getWeatherColor(_weather?.weatherDescription ?? ''),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionalInfo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Additional Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoRow('Humidity', '${_weather?.humidity}%', Icons.water_drop),
            _buildInfoRow('Wind Speed', '${_weather?.windSpeed?.toStringAsFixed(1)} km/h', Icons.air),
            _buildInfoRow('Pressure', '${_weather?.pressure?.round()} hPa', Icons.speed),
            _buildInfoRow('Sunrise', _formatTime(_weather?.sunrise), Icons.wb_sunny),
            _buildInfoRow('Sunset', _formatTime(_weather?.sunset), Icons.nights_stay),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontSize: 16)),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSprayingRecommendation() {
    bool isGoodForSpraying = _isGoodForSpraying();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isGoodForSpraying ? Icons.check_circle : Icons.warning,
                  color: isGoodForSpraying ? Colors.green : Colors.orange,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Spraying Conditions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              _getSprayingRecommendation(),
              style: TextStyle(
                color: isGoodForSpraying ? Colors.green[700] : Colors.orange[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isGoodForSpraying() {
    final windSpeed = _weather?.windSpeed ?? 0;
    final humidity = _weather?.humidity ?? 0;
    final temp = _weather?.temperature?.celsius ?? 0;
    
    return windSpeed < 10 && humidity > 40 && humidity < 90 && temp > 10 && temp < 30;
  }

  String _getSprayingRecommendation() {
    final windSpeed = _weather?.windSpeed ?? 0;
    final humidity = _weather?.humidity ?? 0;
    final temp = _weather?.temperature?.celsius ?? 0;
    
    List<String> issues = [];
    
    if (windSpeed >= 10) {
      issues.add('Wind speed is too high (${windSpeed.round()} km/h)');
    }
    if (humidity <= 40) {
      issues.add('Humidity is too low ($humidity%)');
    }
    if (humidity >= 90) {
      issues.add('Humidity is too high ($humidity%)');
    }
    if (temp <= 10) {
      issues.add('Temperature is too low (${temp.round()}°C)');
    }
    if (temp >= 30) {
      issues.add('Temperature is too high (${temp.round()}°C)');
    }
    
    if (issues.isEmpty) {
      return 'Current conditions are suitable for spraying.';
    }
    
    return 'Not recommended for spraying: ${issues.join(', ')}.';
  }

  String _formatTime(DateTime? time) {
    if (time == null) return 'N/A';
    return DateFormat('HH:mm').format(time);
  }
}