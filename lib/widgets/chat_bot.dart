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

  final Map<String, String> _answers = {};

  @override
  void initState() {
    super.initState();
    _languageService.addListener(_onLanguageChanged);
    _populateAnswers();
  }

  @override
  void dispose() {
    _languageService.removeListener(_onLanguageChanged);
    _scrollController.dispose();
    super.dispose();
  }

  void _onLanguageChanged(String _) {
    if (mounted) {
      setState(() {
        _populateAnswers(); // Update answers when the language changes
      });
    }
  }

  void _populateAnswers() {
    _answers.clear();
    _answers.addAll({
      'plant_diseases_question': _languageService.getText('A'),
      'organic_farming_question': _languageService.getText('B'),
      'seasonal_crops_question': _languageService.getText('C'),
      'pest_control_question': _languageService.getText('D'),
      'soil_health_question': _languageService.getText('E'),
      'watering_practices_question': _languageService.getText('F'),
      'sunlight_needs_question': _languageService.getText('G'),
      'fertilizer_usage_question': _languageService.getText('H'),
      'disease_resistant_question': _languageService.getText('I'),
      'kitchen_garden_question': _languageService.getText('J'),
      'thank_you':
          _languageService.getText('thank_you'), // Adding thank_you text
    });
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
            message: _languageService.getText('chat_with_us'),
            child: FloatingActionButton(
              backgroundColor: Colors.black.withOpacity(0.01),
              elevation: 0,
              onPressed: () {
                setState(() {
                  _isOpen = true;
                  _showQuestions = true;
                  _selectedQuestion = null;
                });
              },
              child: const Icon(
                Icons.chat,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }

    return Positioned(
      right: 16,
      bottom: 16,
      child: Container(
        width: 300,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white.withOpacity(0.85),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: BackdropFilter(
            filter: ColorFilter.mode(
              Colors.white.withOpacity(0.5),
              BlendMode.overlay,
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
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.85),
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
    return Container(
      color: Colors.white.withOpacity(0.7),
      child: Column(
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
      ),
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
          backgroundColor: Colors.white.withOpacity(0.7),
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
      return const SizedBox.shrink();
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
    if (_selectedQuestion == 'thank_you') {
      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          _answers['thank_you'] ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      );
    }

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
                  _selectedQuestion = 'thank_you';
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
      ],
    );
  }
}
