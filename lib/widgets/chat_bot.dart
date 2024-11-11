import 'package:flutter/material.dart';
import '../widgets/localized_text.dart';
import '../services/language_service.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  bool _isOpen = false;
  bool _showQuestions = true;
  String? _selectedQuestion;
  final ScrollController _scrollController = ScrollController();
  final _languageService = LanguageService();

  final List<String> _questionKeys = [
    'plant_diseases_question',
    'organic_farming_question',
    'seasonal_crops_question',
    'pest_control_question',
    'soil_health_question',
    'watering_practices_question',
    'sunlight_needs_question',
    'fertilizer_usage_question',
    'disease_resistant_question',
    'kitchen_garden_question',
  ];

  final Map<String, String> _answers = {
    'plant_diseases_question':
        'Common plant diseases can be identified by observing symptoms like:\n\n'
            '• Spots or lesions on leaves\n'
            '• Wilting despite adequate watering\n'
            '• Yellowing or browning of leaves\n'
            '• Powdery or fuzzy growth on plants\n'
            '• Stunted growth\n\n'
            'Take a photo of the affected plant part and use our disease detection feature for accurate diagnosis.',
    'organic_farming_question': 'Key organic farming practices include:\n\n'
        '• Using compost and natural fertilizers\n'
        '• Crop rotation to maintain soil health\n'
        '• Natural pest control methods\n'
        '• Companion planting\n'
        '• Green manuring\n'
        '• Mulching for weed control\n'
        '• Maintaining biodiversity',
    'seasonal_crops_question': 'Based on the current season, consider growing:\n\n'
        'Summer:\n'
        '• Tomatoes, Peppers, Eggplants\n'
        'Winter:\n'
        '• Leafy greens, Peas, Root vegetables\n'
        'Monsoon:\n'
        '• Rice, Corn, Pulses\n\n'
        'Use our seasonal crop calendar feature for more specific recommendations.',
    'pest_control_question': 'Natural pest control methods include:\n\n'
        '• Neem oil spray\n'
        '• Companion planting\n'
        '• Introducing beneficial insects\n'
        '• Garlic and chili spray\n'
        '• Maintaining plant hygiene\n'
        '• Using physical barriers\n'
        '• Crop rotation',
    'soil_health_question': 'To improve soil health:\n\n'
        '• Add organic matter regularly\n'
        '• Use compost and vermicompost\n'
        '• Practice crop rotation\n'
        '• Avoid over-tilling\n'
        '• Maintain proper drainage\n'
        '• Use cover crops\n'
        '• Test soil regularly',
    'watering_practices_question': 'Optimal watering practices include:\n\n'
        '• Water deeply but less frequently\n'
        '• Water at the base of plants\n'
        '• Water early morning or evening\n'
        '• Use mulch to retain moisture\n'
        '• Adjust watering based on weather\n'
        '• Check soil moisture before watering',
    'sunlight_needs_question': 'Sunlight requirements vary by plant:\n\n'
        'Full Sun (6+ hours):\n'
        '• Tomatoes, Peppers, Most fruits\n\n'
        'Partial Sun (4-6 hours):\n'
        '• Herbs, Some vegetables\n\n'
        'Partial Shade (2-4 hours):\n'
        '• Leafy greens, Root vegetables\n\n'
        'Check our plant database for specific requirements.',
    'fertilizer_usage_question': 'For proper fertilizer use:\n\n'
        '• Test soil before applying\n'
        '• Follow recommended dosage\n'
        '• Apply at right growth stage\n'
        '• Maintain proper timing\n'
        '• Use organic options when possible\n\n'
        'Use our fertilizer calculator for precise measurements.',
    'disease_resistant_question': 'Disease-resistant varieties include:\n\n'
        'Tomatoes:\n'
        '• Better Boy, Celebrity\n\n'
        'Rice:\n'
        '• IR64, MTU1010\n\n'
        'Cotton:\n'
        '• Bt Cotton varieties\n\n'
        'Check our seed catalog for more options.',
    'kitchen_garden_question': 'To start a kitchen garden:\n\n'
        '• Choose a sunny location\n'
        '• Prepare raised beds or containers\n'
        '• Use quality soil mix\n'
        '• Start with easy crops\n'
        '• Plan seasonal rotations\n'
        '• Install proper irrigation\n'
        '• Use vertical space efficiently',
  };

  @override
  void initState() {
    super.initState();
    _languageService.addListener(_onLanguageChanged);
  }

  @override
  void dispose() {
    _languageService.removeListener(_onLanguageChanged);
    _scrollController.dispose();
    super.dispose();
  }

  void _onLanguageChanged(String _) {
    if (mounted) {
      setState(() {});
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isOpen) {
      return Positioned(
        right: 16,
        bottom: 16,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Tooltip(
            message:
                _languageService.getText('chat_with_us'), // Tooltip message
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              // Add hover effect by changing the size or color
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _isOpen = true;
                    _showQuestions = true;
                    _selectedQuestion = null;
                  });
                },
                child: const Icon(Icons.chat),
              ),
            ),
          ),
        ),
      );
    }

    return Positioned(
      right: 16,
      bottom: 16,
      child: Card(
        elevation: 8,
        child: Container(
          width: 300,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: _buildChatContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LocalizedText(
            'chatbot_title',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              setState(() {
                _isOpen = false;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChatContent() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            children: [
              LocalizedText(
                'chatbot_greeting',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              if (_showQuestions)
                ...List.generate(
                  _questionKeys.length,
                  (index) => _buildQuestionButton(_questionKeys[index]),
                )
              else if (_selectedQuestion != null) ...[
                _buildSelectedQuestion(),
                const SizedBox(height: 16),
                _buildFollowUpQuestion(),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionButton(String questionKey) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextButton(
        onPressed: () {
          setState(() {
            _selectedQuestion = questionKey;
            _showQuestions = false;
          });
          _scrollToBottom();
        },
        style: TextButton.styleFrom(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(12),
          backgroundColor: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: LocalizedText(
          questionKey,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
    );
  }

  Widget _buildSelectedQuestion() {
    if (_selectedQuestion == null || !_answers.containsKey(_selectedQuestion)) {
      return const SizedBox
          .shrink(); // Return an empty widget if no question is selected
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LocalizedText(
          _selectedQuestion!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          _answers[_selectedQuestion] ?? '',
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildFollowUpQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LocalizedText(
          'anything_else',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showQuestions = true;
                  _selectedQuestion = null;
                });
                _scrollToBottom();
              },
              child: const LocalizedText('yes'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedQuestion = 'goodbye';
                  _showQuestions = false;
                });
                _scrollToBottom();
                Future.delayed(const Duration(seconds: 2), () {
                  setState(() {
                    _isOpen = false;
                  });
                });
              },
              child: const LocalizedText('no'),
            ),
          ],
        ),
        if (_selectedQuestion == 'goodbye')
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: LocalizedText(
              'thank_you',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
      ],
    );
  }
}
