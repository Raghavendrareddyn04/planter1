import 'package:flutter/material.dart';

class FertilizerCalculatorScreen extends StatefulWidget {
  const FertilizerCalculatorScreen({super.key});

  @override
  _FertilizerCalculatorScreenState createState() =>
      _FertilizerCalculatorScreenState();
}

class _FertilizerCalculatorScreenState
    extends State<FertilizerCalculatorScreen> {
  String _selectedCategory = 'Cereals';
  String _selectedCrop = 'Rice';
  double _fieldSize = 0;
  String _sizeUnit = 'Acres';
  final _formKey = GlobalKey<FormState>();

  final Map<String, List<String>> _cropCategories = {
    'Cereals': ['Rice', 'Wheat', 'Corn'],
    'Commercial': ['Cotton', 'Sugarcane', 'Ground nut'],
    'Fruits': ['Mango', 'Banana', 'Apple', 'Grape', 'Orange'],
  };

  final Map<String, String> _cropImages = {
    'Rice': 'assets/images/crops/rice.png',
    'Wheat': 'assets/images/crops/wheat.png',
    'Corn': 'assets/images/crops/corn.png',
    'Cotton': 'assets/images/crops/cotton.png',
    'Sugarcane': 'assets/images/crops/sugarcane.png',
    'Ground nut': 'assets/images/crops/groundnut.png',
    'Mango': 'assets/images/crops/mango.png',
    'Banana': 'assets/images/crops/banana.png',
    'Apple': 'assets/images/crops/apple.png',
    'Grape': 'assets/images/crops/grape.png',
    'Orange': 'assets/images/crops/orange.png',
  };

  final Map<String, Map<String, double>> _fertilizerRatios = {
    'Rice': {'N': 50, 'P': 25, 'K': 20},
    'Wheat': {'N': 40, 'P': 20, 'K': 10},
    'Corn': {'N': 80, 'P': 40, 'K': 30},
    'Cotton': {'N': 40, 'P': 25, 'K': 25},
    'Sugarcane': {'N': 100, 'P': 45, 'K': 45},
    'Ground nut': {'N': 8, 'P': 16, 'K': 16},
    'Mango': {'N': 75, 'P': 35, 'K': 75},
    'Banana': {'N': 100, 'P': 50, 'K': 150},
    'Apple': {'N': 60, 'P': 30, 'K': 60},
    'Grape': {'N': 65, 'P': 32, 'K': 65},
    'Orange': {'N': 80, 'P': 40, 'K': 80},
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
        title: const Text('Fertilizer Calculator'),
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
                        const Text(
                          'Select Category',
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
                                    child: Text(category),
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
                        const Text(
                          'Select Crop',
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
                                      Text(
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
                        const Text(
                          'Field Size',
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
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter field size',
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
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
                  child: const Text(
                    'Calculate Fertilizer',
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
    final multiplier = _sizeUnit == 'Hectares' ? 2.47 : 1.0;

    final npkValues = {
      'N': ratios['N']! * _fieldSize * multiplier,
      'P': ratios['P']! * _fieldSize * multiplier,
      'K': ratios['K']! * _fieldSize * multiplier,
    };

    final fertilizers = _calculateFertilizers(npkValues);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Recommended Fertilizer for $_selectedCrop'),
        content: SingleChildScrollView(
          child: Column(
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
                'Nitrogen (N): ${npkValues['N']!.toStringAsFixed(1)} kg',
              ),
              Text(
                'Phosphorus (P): ${npkValues['P']!.toStringAsFixed(1)} kg',
              ),
              Text(
                'Potassium (K): ${npkValues['K']!.toStringAsFixed(1)} kg',
              ),
              const SizedBox(height: 16),
              const Text(
                'Required Fertilizers:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Urea (46-0-0): ${fertilizers['Urea']!.toStringAsFixed(1)} kg',
              ),
              Text(
                'TSP (0-46-0): ${fertilizers['TSP']!.toStringAsFixed(1)} kg',
              ),
              Text(
                'MOP (0-0-60): ${fertilizers['MOP']!.toStringAsFixed(1)} kg',
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
      case 'Ground nut':
        return '- Apply 100% of the recommended dose at planting\n- Additionally, if needed, apply calcium at the beginning of the flowering stage (around 30-40 days after planting)';
      case 'Mango':
        return '- Apply fertilizers in two splits: pre-monsoon (June) and post-monsoon (September-October)\n- Apply organic manure once a year';
      case 'Banana':
        return '- Apply N in 6 splits at monthly intervals\n- Apply P and K in 3 splits at planting, 3rd and 5th month';
      case 'Apple':
        return '- Apply N in two splits: 50% at bud break and 50% at fruit set\n- Apply all P and K before flowering';
      case 'Grape':
        return '- Apply N in 4 splits throughout growing season\n- Apply P and K in two splits: before flowering and during fruit development';
      case 'Orange':
        return '- Apply fertilizers in three splits: February-March, June-July, and September-October\n- Apply micronutrients through foliar spray if needed';
      default:
        return 'Follow local agricultural extension service recommendations';
    }
  }
}
