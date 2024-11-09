class LanguageService {
  static final LanguageService _instance = LanguageService._internal();
  factory LanguageService() => _instance;
  LanguageService._internal();

  String _currentLanguage = 'English';
  final _listeners = <Function(String)>[];

  String get currentLanguage => _currentLanguage;

  void setLanguage(String language) {
    _currentLanguage = language;
    for (var listener in _listeners) {
      listener(language);
    }
  }

  void addListener(Function(String) listener) {
    _listeners.add(listener);
  }

  void removeListener(Function(String) listener) {
    _listeners.remove(listener);
  }

  String getText(String key) {
    return _translations[key]?[_currentLanguage] ?? key;
  }

  static final Map<String, Map<String, String>> _translations = {
    'app_title': {
      'English': 'Planter',
      'Telugu': 'ప్లాంటర్',
    },
    'save_crop': {
      'English': 'Save your crop',
      'Telugu': 'మీ పంటను కాపాడండి',
    },
    'take_picture': {
      'English': 'Take a picture',
      'Telugu': 'ఫోటో తీయండి',
    },
    'see_diagnosis': {
      'English': 'See diagnosis',
      'Telugu': 'రోగనిర్ధారణ చూడండి',
    },
    'get_medicine': {
      'English': 'Get medicine',
      'Telugu': 'మందు పొందండి',
    },
    'fertilizer_calculator': {
      'English': 'Fertilizer calculator',
      'Telugu': 'ఎరువుల కాలిక్యులేటర్',
    },
    'pests_diseases': {
      'English': 'Pests & diseases',
      'Telugu': 'పురుగులు & వ్యాధులు',
    },
    'cultivation_tips': {
      'English': 'Cultivation Tips',
      'Telugu': 'సాగు చిట్కాలు',
    },
    'results_output': {
      'English': 'Results/Output',
      'Telugu': 'ఫలితాలు',
    },
    'your_crops': {
      'English': 'Your crops',
      'Telugu': 'మీ పంటలు',
    },
    'community': {
      'English': 'Community',
      'Telugu': 'సమాజం',
    },
    'dukaan': {
      'English': 'Dukaan',
      'Telugu': 'దుకాణం',
    },
    'you': {
      'English': 'You',
      'Telugu': 'మీరు',
    },
    'select_image_source': {
      'English': 'Select Image Source',
      'Telugu': 'చిత్రం మూలాన్ని ఎంచుకోండి',
    },
    'take_picture_option': {
      'English': 'Take a Picture',
      'Telugu': 'ఫోటో తీయండి',
    },
    'choose_gallery': {
      'English': 'Choose from Gallery',
      'Telugu': 'గ్యాలరీ నుండి ఎంచుకోండి',
    },
    'selected_image': {
      'English': 'Selected Image',
      'Telugu': 'ఎంచుకున్న చిత్రం',
    },
    'analyze_plant_question': {
      'English': 'Would you like to analyze this plant?',
      'Telugu': 'ఈ మొక్కను విశ్లేషించాలనుకుంటున్నారా?',
    },
    'cancel': {
      'English': 'Cancel',
      'Telugu': 'రద్దు చేయండి',
    },
    'analyze': {
      'English': 'Analyze',
      'Telugu': 'విశ్లేషించండి',
    },
    'analyzing_plant': {
      'English': 'Analyzing plant...',
      'Telugu': 'మొక్కను విశ్లేషిస్తోంది...',
    },
    'select_language': {
      'English': 'Select Language',
      'Telugu': 'భాషను ఎంచుకోండి',
    },
    'about': {
      'English': 'About',
      'Telugu': 'గురించి',
    },
    'help': {
      'English': 'Help',
      'Telugu': 'సహాయం',
    },
  };
}
