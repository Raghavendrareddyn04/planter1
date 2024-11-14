import 'package:flutter/material.dart';
import '../widgets/localized_text.dart';
import '../services/language_service.dart';

class FertilizerCalculatorScreen extends StatefulWidget {
  const FertilizerCalculatorScreen({super.key});

  @override
  _FertilizerCalculatorScreenState createState() =>
      _FertilizerCalculatorScreenState();
}

class _FertilizerCalculatorScreenState extends State<FertilizerCalculatorScreen> {
  String _selectedCategory = 'fruits';
  String _selectedCrop = 'mango';
  double _fieldSize = 0;
  String _sizeUnit = 'Acres';
  final _formKey = GlobalKey<FormState>();
  final LanguageService _languageService = LanguageService();

  final Map<String, List<String>> _cropCategories = {
    'cereals': ['rice', 'wheat', 'corn', 'millets', 'pulses'],
    'commercial': ['cotton', 'sugarcane', 'groundnut', 'jute', 'tea'],
    'fruits': ['mango', 'banana', 'apple', 'grape', 'orange']
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
    'millets': 'assets/images/crops/millets.png',
    'pulses': 'assets/images/crops/pulses.png',
    'jute': 'assets/images/crops/jute.png',
    'tea': 'assets/images/crops/tea.png',
  };

  final Map<String, Map<String, double>> _fertilizerRatios = {
    'rice': {'N': 20.2, 'P': 10.1, 'K': 8.1},
    'wheat': {'N': 16.2, 'P': 8.1, 'K': 4.1},
    'corn': {'N': 32.4, 'P': 16.2, 'K': 12.1},
    'millets': {'N': 24.3, 'P': 8.1, 'K': 8.1},
    'pulses': {'N': 8.1, 'P': 16.2, 'K': 8.1},
    'cotton': {'N': 16.2, 'P': 10.1, 'K': 10.1},
    'sugarcane': {'N': 40.5, 'P': 18.2, 'K': 18.2},
    'groundnut': {'N': 3.2, 'P': 6.5, 'K': 6.5},
    'jute': {'N': 12.1, 'P': 6.1, 'K': 10.1},
    'tea': {'N': 28.3, 'P': 14.2, 'K': 18.2},
    'mango': {'N': 30.4, 'P': 14.2, 'K': 30.4},
    'banana': {'N': 40.5, 'P': 20.2, 'K': 60.7},
    'apple': {'N': 24.3, 'P': 12.1, 'K': 24.3},
    'grape': {'N': 26.3, 'P': 12.9, 'K': 26.3},
    'orange': {'N': 32.4, 'P': 16.2, 'K': 32.4}
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

  void _showResults() {
    final ratios = _fertilizerRatios[_selectedCrop]!;
    final multiplier = _sizeUnit == 'Hectares' ? 2.47 : 1.0;

    final npkValues = {
      'N': ratios['N']! * _fieldSize * multiplier,
      'P': ratios['P']! * _fieldSize * multiplier,
      'K': ratios['K']! * _fieldSize * multiplier,
    };

    final fertilizers = _calculateFertilizers(npkValues);

    // Define detailed guide messages for each category
    String detailedGuideMessage;
    if (_selectedCategory == 'cereals') {
      detailedGuideMessage = _languageService.getText('cereals_detailed_guide');
    } else if (_selectedCategory == 'commercial') {
      detailedGuideMessage = _languageService.getText('commercial_detailed_guide');
    } else if (_selectedCategory == 'fruits') {
      detailedGuideMessage = _languageService.getText('fruits_detailed_guide');
    } else {
      detailedGuideMessage = _languageService.getText('default_detailed_guide');
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const LocalizedText(
          'recommended_fertilizer',
          style: TextStyle(fontWeight: FontWeight.bold),
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
              Text('N: ${npkValues['N']!.toStringAsFixed(1)} ${_languageService.getText('kg')}'),
              Text('P: ${npkValues['P']!.toStringAsFixed(1)} ${_languageService.getText('kg')}'),
              Text('K: ${npkValues['K']!.toStringAsFixed(1)} ${_languageService.getText('kg')}'),
              const SizedBox(height: 16),
              const LocalizedText(
                'required_fertilizers',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('${_languageService.getText('urea')}: ${fertilizers['Urea']!.toStringAsFixed(1)} ${_languageService.getText('kg')}'),
              Text('${_languageService.getText('tsp')}: ${fertilizers['TSP']!.toStringAsFixed(1)} ${_languageService.getText('kg')}'),
              Text('${_languageService.getText('mop')}: ${fertilizers['MOP']!.toStringAsFixed(1)} ${_languageService.getText('kg')}'),
              const SizedBox(height: 16),
              const LocalizedText(
                'schedule_',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const LocalizedText('schedule__'),
              const LocalizedText('schedule___'),
              const LocalizedText('schedule____'),
              const SizedBox(height: 16),
              Text(detailedGuideMessage, style: const TextStyle(fontSize: 14)),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Tooltip(
          message: _languageService.getText('back').toString(),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
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
                            itemCount: _cropCategories[_selectedCategory]!.length,
                            itemBuilder: (context, index) {
                              final crop = _cropCategories[_selectedCategory]![index];
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
                                        errorBuilder: (context, error, stackTrace) {
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
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: _languageService
                                      .getText('enter_field_size')
                                      .toString(),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return _languageService
                                        .getText('please_enter_field_size')
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
}
