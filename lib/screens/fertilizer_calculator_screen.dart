import 'package:flutter/material.dart';

class FertilizerCalculatorScreen extends StatefulWidget {
  const FertilizerCalculatorScreen({super.key});

  @override
  _FertilizerCalculatorScreenState createState() =>
      _FertilizerCalculatorScreenState();
}

class _FertilizerCalculatorScreenState extends State<FertilizerCalculatorScreen> {
  String _selectedCrop = 'Rice';
  double _fieldSize = 0;
  String _sizeUnit = 'Acres';
  final _formKey = GlobalKey<FormState>();

  final Map<String, Map<String, double>> _fertilizerRatios = {
    'Rice': {'N': 120, 'P': 60, 'K': 40},
    'Wheat': {'N': 100, 'P': 50, 'K': 50},
    'Corn': {'N': 150, 'P': 65, 'K': 85},
    'Cotton': {'N': 110, 'P': 55, 'K': 65},
    'Sugarcane': {'N': 200, 'P': 100, 'K': 100},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fertilizer Calculator'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Crop',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedCrop,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      items: _fertilizerRatios.keys
                          .map((crop) => DropdownMenuItem(
                                value: crop,
                                child: Text(crop),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCrop = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Field Size',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter field size',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter field size';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _fieldSize = double.tryParse(value) ?? 0;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: _sizeUnit,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            items: ['Acres', 'Hectares']
                                .map((unit) => DropdownMenuItem(
                                      value: unit,
                                      child: Text(unit),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _sizeUnit = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _showResults();
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Calculate Fertilizer'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showResults() {
    final ratios = _fertilizerRatios[_selectedCrop]!;
    final multiplier = _sizeUnit == 'Hectares' ? 2.47 : 1.0;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Recommended Fertilizer for $_selectedCrop'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Field Size: $_fieldSize $_sizeUnit'),
            const SizedBox(height: 16),
            const Text(
              'Recommended NPK:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Nitrogen (N): ${(ratios['N']! * _fieldSize * multiplier).toStringAsFixed(1)} kg',
            ),
            Text(
              'Phosphorus (P): ${(ratios['P']! * _fieldSize * multiplier).toStringAsFixed(1)} kg',
            ),
            Text(
              'Potassium (K): ${(ratios['K']! * _fieldSize * multiplier).toStringAsFixed(1)} kg',
            ),
            const SizedBox(height: 16),
            const Text(
              'Application Schedule:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(_getApplicationSchedule(_selectedCrop)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  String _getApplicationSchedule(String crop) {
    switch (crop) {
      case 'Rice':
        return '- Apply N in 3 splits: 50% at transplanting, 25% at tillering, 25% at panicle initiation\n- Apply all P and K at transplanting';
      case 'Wheat':
        return '- Apply 50% N and all P, K at sowing\n- Apply remaining N in two equal splits at tillering and heading';
      case 'Corn':
        return '- Apply 25% N and all P, K at planting\n- Apply 75% N in two equal splits at V6 and V12 stages';
      case 'Cotton':
        return '- Apply 20% N and all P, K at planting\n- Apply remaining N in 4 equal splits during square formation and flowering';
      case 'Sugarcane':
        return '- Apply 25% N and all P, K at planting\n- Apply remaining N in 3 equal splits at 60, 90, and 120 days';
      default:
        return 'Follow local agricultural extension service recommendations';
    }
  }
}