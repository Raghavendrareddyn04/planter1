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
    // About screen translations
    'created_by': {
      'English': 'Created by',
      'Telugu': 'రూపొందించినవారు',
    },
    'team_leader': {
      'English': 'TEAM LEADER',
      'Telugu': 'టీమ్ లీడర్',
    },
    'team_member': {
      'English': 'TEAM MEMBER',
      'Telugu': 'టీమ్ సభ్యుడు',
    },
    'project_guide': {
      'English': 'PROJECT GUIDE',
      'Telugu': 'ప్రాజెక్ట్ గైడ్',
    },
    'guide': {
      'English': 'Guide',
      'Telugu': 'మార్గదర్శి',
    },
    'contact_us': {
      'English': 'Contact Us',
      'Telugu': 'మమ్మల్ని సంప్రదించండి',
    },
    // Team member names
    'member_eswar': {
      'English': 'M ESWAR KUMAR',
      'Telugu': 'ఎం ఈశ్వర్ కుమార్',
    },
    'member_raghavendra': {
      'English': 'N RAGHAVENDRA REDDY',
      'Telugu': 'ఎన్ రాఘవేంద్ర రెడ్డి',
    },
    'member_sujana': {
      'English': 'SUJANA P',
      'Telugu': 'సుజన పి',
    },
    'member_keerthi': {
      'English': 'KEERTHI PRIYA',
      'Telugu': 'కీర్తి ప్రియ',
    },
    'guide_name': {
      'English': 'Mrs.S.RAJESWARI',
      'Telugu': 'శ్రీమతి ఎస్.రాజేశ్వరి',
    },
    // Cart Screen
    'shopping_cart': {
      'English': 'Shopping Cart',
      'Telugu': 'షాపింగ్ కార్ట్',
    },
    'cart_empty': {
      'English': 'Your cart is empty',
      'Telugu': 'మీ కార్ట్ ఖాళీగా ఉంది',
    },
    'total': {
      'English': 'Total:',
      'Telugu': 'మొత్తం:',
    },
    'proceed_checkout': {
      'English': 'Proceed to Checkout',
      'Telugu': 'చెక్అవుట్ కొనసాగించండి',
    },

    // Community Screen
    'community_screen': {
      'English': 'Community',
      'Telugu': 'సమాజం',
    },
    'create_post': {
      'English': 'Create Post',
      'Telugu': 'పోస్ట్ సృష్టించండి',
    },
    'whats_on_mind': {
      'English': 'What\'s on your mind?',
      'Telugu': 'మీ మనసులో ఏముంది?',
    },
    'add_image': {
      'English': 'Add Image',
      'Telugu': 'చిత్రాన్ని జోడించండి',
    },

    // Contact Form
    'contact_form': {
      'English': 'Contact Us',
      'Telugu': 'మమ్మల్ని సంప్రదించండి',
    },
    'name_required': {
      'English': 'Name *',
      'Telugu': 'పేరు *',
    },
    'email_required': {
      'English': 'Email *',
      'Telugu': 'ఇమెయిల్ *',
    },
    'phone_required': {
      'English': 'Phone Number *',
      'Telugu': 'ఫోన్ నంబర్ *',
    },
    'description_required': {
      'English': 'Description *',
      'Telugu': 'వివరణ *',
    },

    // Cultivation Tips
    '#cultivation_tips': {
      'English': 'Cultivation Tips',
      'Telugu': 'సాగు చిట్కాలు',
    },
    'soil_preparation': {
      'English': 'Soil Preparation',
      'Telugu': 'నేల తయారీ',
    },
    'watering_guide': {
      'English': 'Watering Guide',
      'Telugu': 'నీరు పోయడం గైడ్',
    },

    // Dukaan Screen
    '#dukaan': {
      'English': 'Dukaan',
      'Telugu': 'దుకాణం',
    },
    'search_products': {
      'English': 'Search products...',
      'Telugu': 'ఉత్పత్తులను వెతకండి...',
    },
    'add_to_cart': {
      'English': 'Add to Cart',
      'Telugu': 'కార్ట్‌కి జోడించండి',
    },

    // Fertilizer Calculator
    '#fertilizer_calculator': {
      'English': 'Fertilizer Calculator',
      'Telugu': 'ఎరువుల కాలిక్యులేటర్',
    },
    'select_category': {
      'English': 'Select Category',
      'Telugu': 'వర్గాన్ని ఎంచుకోండి',
    },
    'select_crop': {
      'English': 'Select Crop',
      'Telugu': 'పంటను ఎంచుకోండి',
    },
    'field_size': {
      'English': 'Field Size',
      'Telugu': 'పొలం పరిమాణం',
    },
    'calculate_fertilizer': {
      'English': 'Calculate Fertilizer',
      'Telugu': 'ఎరువును లెక్కించండి',
    },

    // Help Screen
    '#help': {
      'English': 'Help',
      'Telugu': 'సహాయం',
    },
    'getting_started': {
      'English': 'Getting Started',
      'Telugu': 'మొదలు పెట్టడం',
    },
    'weather_features': {
      'English': 'Weather Features',
      'Telugu': 'వాతావరణ ఫీచర్లు',
    },
    'plant_care': {
      'English': 'Plant Care',
      'Telugu': 'మొక్క సంరక్షణ',
    },

    // Profile Screen
    'profile': {
      'English': 'Profile',
      'Telugu': 'ప్రొఫైల్',
    },
    'edit_profile': {
      'English': 'Edit Profile',
      'Telugu': 'ప్రొఫైల్‌ని సవరించండి',
    },
    'my_favorites': {
      'English': 'My Favorites',
      'Telugu': 'నా ఇష్టమైనవి',
    },
    'purchase_history': {
      'English': 'Purchase History',
      'Telugu': 'కొనుగోలు చరిత్ర',
    },
    'address': {
      'English': 'Address',
      'Telugu': 'చిరునామా',
    },
    'logout': {
      'English': 'Logout',
      'Telugu': 'లాగ్అవుట్',
    },

    // Pests & Diseases
    '#pests_diseases': {
      'English': 'Pests & Diseases',
      'Telugu': 'పురుగులు & వ్యాధులు',
    },
    'seedling_stage': {
      'English': 'Seedling Stage',
      'Telugu': 'మొలక దశ',
    },
    'vegetative_stage': {
      'English': 'Vegetative Stage',
      'Telugu': 'వృక్ష దశ',
    },
    'see_more': {
      'English': 'See More',
      'Telugu': 'మరిన్ని చూడండి',
    },
    'see_less': {
      'English': 'See Less',
      'Telugu': 'తక్కువ చూడండి',
    },

    // Categories
    'cereals': {
      'English': 'Cereals',
      'Telugu': 'ధాన్యాలు',
    },
    'commercial': {
      'English': 'Commercial',
      'Telugu': 'వాణిజ్య',
    },
    'fruits': {
      'English': 'Fruits',
      'Telugu': 'పండ్లు',
    },

    // Crops
    'rice': {
      'English': 'Rice',
      'Telugu': 'వరి',
    },
    'wheat': {
      'English': 'Wheat',
      'Telugu': 'గోధుమ',
    },
    'corn': {
      'English': 'Corn',
      'Telugu': 'మొక్కజొన్న',
    },
    'cotton': {
      'English': 'Cotton',
      'Telugu': 'పత్తి',
    },
    'sugarcane': {
      'English': 'Sugarcane',
      'Telugu': 'చెరకు',
    },
    'groundnut': {
      'English': 'Ground nut',
      'Telugu': 'వేరుశనగ',
    },
    'mango': {
      'English': 'Mango',
      'Telugu': 'మామిడి',
    },
    'banana': {
      'English': 'Banana',
      'Telugu': 'అరటి',
    },
    'apple': {
      'English': 'Apple',
      'Telugu': 'ఆపిల్',
    },
    'grape': {
      'English': 'Grape',
      'Telugu': 'ద్రాక్ష',
    },
    'orange': {
      'English': 'Orange',
      'Telugu': 'నారింజ',
    },
    // Contact Form Screen
    'form_submitted_successfully': {
      'English': 'Form submitted successfully!',
      'Telugu': 'ఫారమ్ విజయవంతంగా సమర్పించబడింది!',
    },
    'error_submitting_form': {
      'English': 'Error submitting form',
      'Telugu': 'ఫారమ్ సమర్పించడంలో లోపం',
    },
    'please_attach_screenshot': {
      'English': 'Please attach a screenshot',
      'Telugu': 'దయచేసి స్క్రీన్‌షాట్‌ను జోడించండి',
    },
    'screenshot': {
      'English': 'Screenshot',
      'Telugu': 'స్క్రీన్‌షాట్',
    },
    'add_screenshot': {
      'English': 'Add Screenshot',
      'Telugu': 'స్క్రీన్‌షాట్ జోడించండి',
    },
    'change_screenshot': {
      'English': 'Change Screenshot',
      'Telugu': 'స్క్రీన్‌షాట్ మార్చండి',
    },
    'send': {
      'English': 'Send',
      'Telugu': 'పంపండి',
    },

    // Cultivation Tips Screen
    'soil_preparation_title': {
      'English': 'Soil Preparation',
      'Telugu': 'నేల తయారీ',
    },
    'soil_preparation_desc': {
      'English': 'Learn how to prepare soil for optimal plant growth',
      'Telugu': 'మొక్కల పెరుగుదలకు అనువైన నేలను ఎలా తయారు చేయాలో తెలుసుకోండి',
    },
    'watering_guide_title': {
      'English': 'Watering Guide',
      'Telugu': 'నీటి పారుదల మార్గదర్శి',
    },
    'watering_guide_desc': {
      'English': 'Best practices for watering different types of plants',
      'Telugu': 'వివిధ రకాల మొక్కలకు నీరు పెట్టడానికి ఉత్తమ పద్ధతులు',
    },

    // Dukaan Screen
    'search_products_placeholder': {
      'English': 'Search products...',
      'Telugu': 'ఉత్పత్తులను వెతకండి...',
    },
    'seeds_category': {
      'English': 'Seeds',
      'Telugu': 'విత్తనాలు',
    },
    'fertilizers_category': {
      'English': 'Fertilizers',
      'Telugu': 'ఎరువులు',
    },
    'pesticides_category': {
      'English': 'Pesticides',
      'Telugu': 'పురుగుమందులు',
    },
    'tools_category': {
      'English': 'Tools',
      'Telugu': 'పనిముట్లు',
    },

    // Fertilizer Calculator Screen
    'field_size_label': {
      'English': 'Field Size',
      'Telugu': 'పొలం పరిమాణం',
    },
    'enter_field_size': {
      'English': 'Enter field size',
      'Telugu': 'పొలం పరిమాణాన్ని నమోదు చేయండి',
    },
    'recommended_fertilizer': {
      'English': 'Recommended Fertilizer',
      'Telugu': 'సిఫార్సు చేయబడిన ఎరువు',
    },

    // Help Screen
    'getting_started_title': {
      'English': 'Getting Started',
      'Telugu': 'ప్రారంభించడం',
    },
    'weather_features_title': {
      'English': 'Weather Features',
      'Telugu': 'వాతావరణ లక్షణాలు',
    },
    'plant_care_title': {
      'English': 'Plant Care',
      'Telugu': 'మొక్క సంరక్షణ',
    },
    'shopping_guide_title': {
      'English': 'Shopping Guide',
      'Telugu': 'షాపింగ్ మార్గదర్శి',
    },

    // Profile Screen
    'edit_profile_button': {
      'English': 'Edit Profile',
      'Telugu': 'ప్రొఫైల్ సవరించండి',
    },

    'address_book': {
      'English': 'Address Book',
      'Telugu': 'చిరునామా పుస్తకం',
    },
    'logout_button': {
      'English': 'Logout',
      'Telugu': 'లాగ్అవుట్',
    },

    // Pests & Diseases Screen
    'pests_diseases_title': {
      'English': 'Pests & Diseases',
      'Telugu': 'పురుగులు & వ్యాధులు',
    },
    'damping_off': {
      'English': 'Damping-Off of Seedlings',
      'Telugu': 'మొలకల డ్యాంపింగ్-ఆఫ్',
    },
    'bacterial_black_spot': {
      'English': 'Bacterial Black Spot',
      'Telugu': 'బాక్టీరియల్ బ్లాక్ స్పాట్',
    },
    'aphids': {
      'English': 'Aphids',
      'Telugu': 'ఆఫిడ్స్',
    },
    'black_citrus_aphid': {
      'English': 'Black Citrus Aphid',
      'Telugu': 'నల్ల సిట్రస్ ఆఫిడ్',
    },
    'phoma_blight': {
      'English': 'Phoma Blight',
      'Telugu': 'ఫోమా బ్లైట్',
    },
    'pineapple_disease': {
      'English': 'Pineapple Disease',
      'Telugu': 'అనాస వ్యాధి',
    },
    'sooty_mold': {
      'English': 'Sooty Mold',
      'Telugu': 'సూటీ మోల్డ్',
    },
    'anthracnose': {
      'English': 'Anthracnose',
      'Telugu': 'ఆంథ్రాక్నోస్',
    },
  };
}
