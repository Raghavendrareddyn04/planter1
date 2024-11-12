import 'package:flutter/material.dart';
import '../widgets/localized_text.dart';

class FertilizerCalculatorScreen extends StatefulWidget {
  const FertilizerCalculatorScreen({super.key});

  @override
  _FertilizerCalculatorScreenState createState() =>
      _FertilizerCalculatorScreenState();
}

class _FertilizerCalculatorScreenState
    extends State<FertilizerCalculatorScreen> {
  String _selectedCategory = 'fruits';
  String _selectedCrop = 'mango';
  double _fieldSize = 0;
  String _sizeUnit = 'Acres';
  final _formKey = GlobalKey<FormState>();

  final Map<String, List<String>> _cropCategories = {
    'cereals': ['rice', 'wheat', 'corn'],
    'commercial': ['cotton', 'sugarcane', 'groundnut'],
    'fruits': ['mango', 'banana', 'apple', 'grape', 'orange'],
  };

  final Map<String, String> _cropImages = {
    'rice': 'assets/images/crops/rice.png',
    'wheat': 'assets/images/crops/wheat.png',
    'corn': 'assets/images/crops/corn.png',
    'cotton': 'assets/images/crops/cotton.png',
    'sugarcane': 'assets/images/crops/sugarcane.png',
    'groundnut': 'assets/images/crops/groundnut.png',
    'mango': 'assets/images/crops/mango.png',
    'banana': 'assets/images/crops/banana.png',
    'apple': 'assets/images/crops/apple.png',
    'grape': 'assets/images/crops/grape.png',
    'orange': 'assets/images/crops/orange.png',
  };

  final Map<String, Map<String, double>> _fertilizerRatios = {
    'rice': {'N': 50, 'P': 25, 'K': 20},
    'wheat': {'N': 40, 'P': 20, 'K': 10},
    'corn': {'N': 80, 'P': 40, 'K': 30},
    'cotton': {'N': 40, 'P': 25, 'K': 25},
    'sugarcane': {'N': 100, 'P': 45, 'K': 45},
    'groundnut': {'N': 8, 'P': 16, 'K': 16},
    'mango': {'N': 75, 'P': 35, 'K': 75},
    'banana': {'N': 100, 'P': 50, 'K': 150},
    'apple': {'N': 60, 'P': 30, 'K': 60},
    'grape': {'N': 65, 'P': 32, 'K': 65},
    'orange': {'N': 80, 'P': 40, 'K': 80},
  };

  Map<String, double> _calculateFertilizers(Map<String, double> npk) {
    const ureaToN = 0.46;
    const tspToP = 0.46;
    const mopToK = 0.60;

    return {
      'Urea': npk['N']! / ureaToN,
      'TSP': npk['P']! / tspToP,
      'MOP': npk['K']! / mopToK,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocalizedText('fertilizer_calculator'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LocalizedText(
                          'select_category',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: _selectedCategory,
                          isExpanded: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                          ),
                          items: _cropCategories.keys
                              .map((category) => DropdownMenuItem(
                                    value: category,
                                    child: LocalizedText(category),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCategory = value!;
                              _selectedCrop = _cropCategories[value]!.first;
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        const LocalizedText(
                          'select_crop',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                _cropCategories[_selectedCategory]!.length,
                            itemBuilder: (context, index) {
                              final crop =
                                  _cropCategories[_selectedCategory]![index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedCrop = crop;
                                  });
                                },
                                child: Container(
                                  width: 100,
                                  margin: const EdgeInsets.only(right: 16),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: _selectedCrop == crop
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      width: _selectedCrop == crop ? 2 : 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        _cropImages[crop]!,
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Icon(
                                            Icons.grass,
                                            size: 40,
                                            color: Colors.green[700],
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 8),
                                      LocalizedText(
                                        crop,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: _selectedCrop == crop
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
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
                        const LocalizedText(
                          'field_size_label',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: ' Enter Field Size',
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return ('Please Enter Field Size')
                                        .toString();
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
                                isExpanded: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                                items: ['Acres', 'Hectares']
                                    .map((unit) => DropdownMenuItem(
                                          value: unit,
                                          child: LocalizedText(unit),
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
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _showResults();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const LocalizedText(
                    'calculate_fertilizer',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showResults() {
    final ratios = _fertilizerRatios[_selectedCrop]!;
    final multiplier = _sizeUnit == 'hectares' ? 2.47 : 1.0;

    final npkValues = {
      'N': ratios['N']! * _fieldSize * multiplier,
      'P': ratios['P']! * _fieldSize * multiplier,
      'K': ratios['K']! * _fieldSize * multiplier,
    };

    final fertilizers = _calculateFertilizers(npkValues);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: LocalizedText(
          'recommended_fertilizer',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const LocalizedText('field_size_label'),
                  Text(': $_fieldSize '),
                  LocalizedText(_sizeUnit),
                ],
              ),
              const SizedBox(height: 16),
              const LocalizedText(
                'recommended_npk',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('N: ${npkValues['N']!.toStringAsFixed(1)} kg'),
              Text('P: ${npkValues['P']!.toStringAsFixed(1)} kg'),
              Text('K: ${npkValues['K']!.toStringAsFixed(1)} kg'),
              const SizedBox(height: 16),
              const LocalizedText(
                'required_fertilizers',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                  'Urea (46-0-0): ${fertilizers['Urea']!.toStringAsFixed(1)} kg'),
              Text(
                  'TSP (0-46-0): ${fertilizers['TSP']!.toStringAsFixed(1)} kg'),
              Text(
                  'MOP (0-0-60): ${fertilizers['MOP']!.toStringAsFixed(1)} kg'),
              const SizedBox(height: 8),
              LocalizedText(
                'schedule_',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              LocalizedText('schedule__'),
              LocalizedText('schedule___'),
              LocalizedText('schedule____'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const LocalizedText('close'),
          ),
        ],
      ),
    );
  }
}
