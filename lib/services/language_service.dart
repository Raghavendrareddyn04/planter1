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
    'name_required_': {
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
      'Telugu': 'ఎరువుల కాలిక్యులేటర���',
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
      'Telugu': 'మట్టి తయారీ',
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
      'Telugu': 'మొలకల డాంపింగ్-ఆఫ్',
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
    // Weather Widget Translations
    'current_weather': {
      'English': 'Current Weather',
      'Telugu': 'ప్రస్తుత వాతావరణం',
    },
    'humidity': {
      'English': 'Humidity',
      'Telugu': 'తేమ',
    },
    'wind_speed': {
      'English': 'Wind Speed',
      'Telugu': 'గాలి వేగం',
    },
    'pressure': {
      'English': 'Pressure',
      'Telugu': 'ఒత్తిడి',
    },
    'sunrise': {
      'English': 'Sunrise',
      'Telugu': 'సూర్యోదయం',
    },
    'sunset': {
      'English': 'Sunset',
      'Telugu': 'సూర్యాస్తమయం',
    },
    'additional_info': {
      'English': 'Additional Information',
      'Telugu': 'అదనపు సమాచారం',
    },
    'spraying_conditions': {
      'English': 'Spraying Conditions',
      'Telugu': 'పిచికారీ పరిస్థితులు',
    },
    'suitable_spraying': {
      'English': 'Current conditions are suitable for spraying.',
      'Telugu': 'ప్రస్తుత పరిస్థితులు పిచికారీకి అనుకూలంగా ఉన్నాయి.',
    },
    'not_recommended': {
      'English': 'Not recommended for spraying:',
      'Telugu': 'పిచికారీకి సిఫారసు చేయబడలేదు:',
    },
    'wind_high': {
      'English': 'Wind speed is too high',
      'Telugu': 'గాలి వేగం చాలా ఎక్కువగా ఉంది',
    },
    'humidity_low': {
      'English': 'Humidity is too low',
      'Telugu': 'తేమ చాలా తక్కువగా ఉంది',
    },
    'humidity_high': {
      'English': 'Humidity is too high',
      'Telugu': 'తేమ చాలా ఎక్కువగా ఉంది',
    },
    'temp_low': {
      'English': 'Temperature is too low',
      'Telugu': 'ఉష్ణోగ్రత చాలా తక్కువగా ఉంది',
    },
    'temp_high': {
      'English': 'Temperature is too high',
      'Telugu': 'ఉష్ణోగ్రత చాలా ఎక్కువగా ఉంది',
    },
    'last_updated': {
      'English': 'Last updated:',
      'Telugu': 'చివరిగా నవీకరించబడింది:',
    },
    'unknown_location': {
      'English': 'Unknown Location',
      'Telugu': 'తెలియని ప్రాంతం',
    },
    'chatbot_greeting': {
      'English': 'Hi! How can I help you?',
      'Telugu': 'నమస్కారం! నేను మీకు ఎలా సహాయం చేయగలను?',
    },
    'chatbot_title': {
      'English': 'Planter Assistant',
      'Telugu': 'ప్లాంటర్ సహాయకుడు',
    },
    'anything_else': {
      'English': 'Is there anything else you would like to know?',
      'Telugu': 'మీరు మరేమైనా తెలుసుకోవాలనుకుంటున్నారా?',
    },
    'yes': {
      'English': 'Yes',
      'Telugu': 'అవును',
    },
    'no': {
      'English': 'No',
      'Telugu': 'లేదు',
    },
    'thank_you': {
      'English': 'Thank you for using our planter app! Have a great day!',
      'Telugu': 'మా ప్లాంటర్ యాప్‌ని ఉపయోగించినందుకు ధన్యవాదాలు! శుభదినం!',
    },
    'plant_diseases_question': {
      'English': 'How do I identify common plant diseases?',
      'Telugu': 'సాధారణ మొక్క వ్యాధులను ఎలా గుర్తించాలి?',
    },
    'organic_farming_question': {
      'English': 'What are the best organic farming practices?',
      'Telugu': 'ఉత్తమ సేంద్రీయ వ్యవసాయ పద్ధతులు ఏమిటి?',
    },
    'seasonal_crops_question': {
      'English': 'Which crops are best for the current season?',
      'Telugu': 'ప్రస్తుత సీజన్‌కు ఏ పంటలు మంచివ?',
    },
    'pest_control_question': {
      'English': 'How can I control pests naturally?',
      'Telugu': 'పురుగులను సహజంగా ఎలా నియంత్రించవచ్చు?',
    },
    'soil_health_question': {
      'English': 'How can I improve soil health?',
      'Telugu': 'నేల ఆరోగ్యాన్ని ఎలా మెరుగుపరచవచ్చు?',
    },
    'watering_practices_question': {
      'English': 'What are the best watering practices?',
      'Telugu': 'ఉత్తమ నీటి పారుదల పద్ధతులు ఏమిటి?',
    },
    'sunlight_needs_question': {
      'English': 'How much sunlight do plants need?',
      'Telugu': 'మొక్కలకు ఎంత సూర్యరశ్మి అవసరం?',
    },
    'fertilizer_usage_question': {
      'English': 'How do I use fertilizers correctly?',
      'Telugu': 'ఎరువులను సరిగ్గా ఎలా ఉపయోగించాలి?',
    },
    'disease_resistant_question': {
      'English': 'Which plant varieties are disease-resistant?',
      'Telugu': 'ఏ మొక్క రకాలు వ్యాధి నిరోధక శక్తి కలిగి ఉన్నాయి?',
    },
    'kitchen_garden_question': {
      'English': 'How do I start a kitchen garden?',
      'Telugu': 'వంటగది తోటను ఎలా ప్రారంభించాలి?',
    },

    'chat_with_us': {
      'English': 'Chat with us',
      'Telugu': 'మాతో చాట్ చేయండి',
    },
    'profile_updated_successfully': {
      'English': 'Profile updated successfully',
      'Telugu': 'ప్రొఫైల్ విజయవంతంగా నవీకరించబడింది',
    },
    'save_changes': {
      'English': 'Save Changes',
      'Telugu': 'మార్పులను సేవ్ చేయండి',
    },
    'close': {
      'English': 'close',
      'Telugu': 'మూసి వేయండి',
    },
    'recommended_npk': {
      'English': 'Recommended NPK',
      'Telugu': 'సిఫారసు చేసిన ఎన్పీకే',
    },
    'required_fertilizers': {
      'English': 'Required Fertilizers',
      'Telugu': ' అవసరమైన ఎరువులు',
    },
    'application_schedule': {
      'English': 'Application Schedule',
      'Telugu': ' అన్వయ క్రమం ',
    },
    'schedule_': {
      'English': 'Crop Fertilizer Timing Guide',
      'Telugu': ' పంట ఎరువుల సమయ మార్గదర్శిని ',
    },
    'schedule__': {
      'English':
          'Apply N-P-K fertilizer before planting to support initial root and shoot growth.',
      'Telugu':
          'వేర్ల మరియు మొలకల మొదటి వృద్ధిని ప్రోత్సహించడాని��ి నాటడానికి ముందు N-P-K ఎరువు పెట్టండి. ',
    },
    'schedule___': {
      'English':
          'Apply a Nitrogen-rich fertilizer 2-4 weeks after planting to boost vegetative growth.',
      'Telugu':
          ' 2-4 వారాల తరువాత, శాక వృద్ధిని పెంచడానికి నైట్రోజన్ ఎక్కువగా ఉండే ఎరువును ఉపయోగించండి. ',
    },
    'schedule____': {
      'English':
          'Apply a Potassium-rich fertilizer during flowering and fruiting to enhance fruit or grain development.',
      'Telugu':
          ' పండ్ల లేదా ధాన్యాల వృద్ధిని మెరుగుపరచడానికి పువ్వులు మరియు పండ్ల దశలో పొటాషియం అధికంగా ఉండే ఎరువును ఉపయోగించండి. ',
    },
    'please_enter_field_size': {
      'English': 'Please Enter Field Size',
      'Telugu': ' దయచేసి క్షేత్ర పరిమాణాన్ని నమోదు చేయండి  ',
    },
    'Acres': {
      'English': 'Acres',
      'Telugu': 'ఎకరాలు',
    },
    'Hectares': {
      'English': 'Hectares',
      'Telugu': 'హెక్టార్లు',
    },
    'getting_started_desc': {
      'English': 'Learn how to use the basic features of the app',
      'Telugu': 'యాప్ యొక్క ప్రాథమిక లక్షణాలను ఎలా ఉపయోగించాలో తెలుసుకోండి',
    },
    'create_account_': {
      'English': 'Create an account or log in',
      'Telugu': 'ఖాతాను సృష్టించండి లేదా లాగిన్ అవ్వండి',
    },
    'add_first_plant': {
      'English': 'Add your first plant',
      'Telugu': 'మీ మొదటి మొక్కను జోడించండి',
    },
    'setup_weather': {
      'English': 'Set up weather notifications',
      'Telugu': 'వాతావరణ ప్రకటనలను సెటప్ చేయండి',
    },
    'browse_catalog': {
      'English': 'Browse the plant catalog',
      'Telugu': 'మొక్కల క్యాటలాగ్‌ను బ్రౌజ్ చేయండి',
    },
    'weather_features_desc': {
      'English': 'Understanding weather information',
      'Telugu': 'వాతావరణ సమాచారాన్ని అర్థం చేసుకోవడం',
    },
    'current_weather_c': {
      'English': 'Current weather conditions',
      'Telugu': 'ప్రస్తుత వాతావరణ పరిస్థితులు',
    },
    'spraying_time': {
      'English': 'Spraying time recommendations',
      'Telugu': 'పిచికారీ సమయ సూచనలు',
    },
    'weather_forecast': {
      'English': 'Weather forecasts',
      'Telugu': 'వాతావరణ సూచనలు',
    },
    'setup_alerts': {
      'English': 'Setting up alerts',
      'Telugu': 'అలర్ట్‌లను సెటప్ చేయడం',
    },
    'plant_care_desc': {
      'English': 'Tips for maintaining healthy plants',
      'Telugu': 'ఆరోగ్యకరమైన మొక్కలను కాపాడడానికి సూచనలు',
    },
    'watering_schedule': {
      'English': 'Watering schedules',
      'Telugu': 'నీటిపారుదల సమయ పట్టికలు',
    },
    'fertilizer_application': {
      'English': 'Fertilizer application',
      'Telugu': 'ఎరువు అన్వయం',
    },
    'pest_control': {
      'English': 'Pest control',
      'Telugu': 'కీటక నియంత్రణ',
    },
    'disease_management': {
      'English': 'Disease management',
      'Telugu': 'వ్యాధి నిర్వహణ',
    },
    'shopping_guide_desc': {
      'English': 'Guide to using the shop',
      'Telugu': 'షాప్ ఉపయోగం మార్గదర్శిని',
    },
    'browse_products': {
      'English': 'Browsing products',
      'Telugu': 'ఉత్పత్తులను బ్రౌజ్ చేయడం',
    },
    'add_to_cart_': {
      'English': 'Adding items to cart',
      'Telugu': 'కార్ట్‌లో అంశాలను చేర్చడం ',
    },
    'checkout_process': {
      'English': 'Checkout process',
      'Telugu': 'చెకౌట్ ప్రక్రియ',
    },
    'order_tracking': {
      'English': 'Order tracking',
      'Telugu': 'ఆర్డర్ ట్రాకింగ్',
    },
    // Form Fields
    'name': {
      'English': 'Name',
      'Telugu': 'పేరు',
    },
    'email': {
      'English': 'Email',
      'Telugu': 'ఇమెయిల్',
    },
    'phone': {
      'English': 'Phone',
      'Telugu': 'ఫోన్',
    },
    'location': {
      'English': 'Location',
      'Telugu': 'ప్రాంతం',
    },
    'description': {
      'English': 'Description',
      'Telugu': 'వివరణ',
    },
    'password': {
      'English': 'Password',
      'Telugu': 'పాస్వర్డ్',
    },

    // Placeholders/Hints
    'enter_name': {
      'English': 'Enter your name',
      'Telugu': 'మీ పేరు నమోదు చేయండి',
    },
    'enter_email': {
      'English': 'Enter your email',
      'Telugu': 'మీ ఇమెయిల్ నమోదు చేయండి',
    },
    'enter_phone': {
      'English': 'Enter your phone number',
      'Telugu': 'మీ ఫోన్ నంబర్ నమోదు చేయండి',
    },
    'enter_location': {
      'English': 'Enter your location',
      'Telugu': 'మీ ప్రాంతాన్ని నమోదు చేయండి',
    },
    'enter_description': {
      'English': 'Enter description',
      'Telugu': 'వివరణను నమోదు చేయండి',
    },
    'enter_password': {
      'English': 'Enter password',
      'Telugu': 'పాస్వర్డ్ నమోదు చేయండి',
    },

    // Validation Messages
    'name_required': {
      'English': 'Please enter your name',
      'Telugu': 'దయచేసి మీ పేరు నమోదు చేయండి',
    },
    'email_required_': {
      'English': 'Please enter your email',
      'Telugu': 'దయచేసి మీ ఇమెయిల్ నమోదు చేయండి',
    },
    'email_invalid': {
      'English': 'Please enter a valid email',
      'Telugu': 'దయచేసి చెల్లుబాటు అయ్యే ఇమెయిల్ నమోదు చేయండి',
    },
    'phone_required_': {
      'English': 'Please enter your phone number',
      'Telugu': 'దయచేసి మీ ఫోన్ నంబర్ నమోదు చేయండి',
    },
    'phone_invalid': {
      'English': 'Please enter a valid phone number',
      'Telugu': 'దయచేసి చెల్లుబాటు అయ్యే ఫోన్ నంబర్ నమోదు చేయండి',
    },
    'location_required': {
      'English': 'Please enter your location',
      'Telugu': 'దయచేసి మీ ప్రాంతాన్ని నమోదు చేయండి',
    },
    'description_required_': {
      'English': 'Please enter description',
      'Telugu': 'దయచేసి వివరణను నమోదు చేయండి',
    },

    // Hover Texts
    'edit_profile_hover': {
      'English': 'Edit your profile information',
      'Telugu': 'మీ ప్రొఫైల్ సమాచారాన్ని సవరించండి',
    },
    'change_photo_hover': {
      'English': 'Change profile photo',
      'Telugu': '���్రొఫైల్ ఫోటోను మార్చండి',
    },
    'save_changes_hover': {
      'English': 'Save your changes',
      'Telugu': 'మీ మార్పులను సేవ్ చేయండి',
    },
    'add_photo_hover': {
      'English': 'Add a photo',
      'Telugu': 'ఫోటోను జోడించండి',
    },

    // Login/Register Fields
    'email_phone': {
      'English': 'Email or Phone number',
      'Telugu': 'ఇమెయిల్ లేదా ఫోన్ నంబర్',
    },
    'create_account': {
      'English': 'Create Account',
      'Telugu': 'ఖాతాను సృష్టించండి',
    },
    'forgot_password': {
      'English': 'Forgot Password?',
      'Telugu': 'పాస్వర్డ్ మర్చిపోయారా?',
    },
    'name_label': {
      'English': 'Name',
      'Telugu': 'పేరు',
    },
    'email_label': {
      'English': 'Email',
      'Telugu': 'ఇమెయిల్',
    },
    'phone_label': {
      'English': 'Phone',
      'Telugu': 'ఫోన్',
    },
    'description_label': {
      'English': 'Description',
      'Telugu': 'వివరణ',
    },
    'enter_name_hint': {
      'English': 'Enter your name',
      'Telugu': 'మీ పేరు నమోదు చేయండి',
    },
    'enter_email_hint': {
      'English': 'Enter your email',
      'Telugu': 'మీ ఇమెయిల్ నమోదు చేయండి',
    },
    'enter_phone_hint': {
      'English': 'Enter your phone number',
      'Telugu': 'మీ ఫోన్ నంబర్ నమోదు చేయండి',
    },
    'enter_description_hint': {
      'English': 'Enter description',
      'Telugu': 'వివరణను నమోదు చేయండి',
    },
    'whats_on_your_mind_hint': {
      'English': 'What\'s on your mind?',
      'Telugu': 'మీ మనసులో ఏముంది?',
    },
    'post_button': {
      'English': 'Post',
      'Telugu': 'పోస్ట్',
    },
    'edit_button': {
      'English': 'Edit',
      'Telugu': 'సవరించు',
    },
    'delete_button': {
      'English': 'Delete',
      'Telugu': 'తొలగించు',
    },
    'comments_title': {
      'English': 'Comments',
      'Telugu': 'వ్యాఖ్యలు',
    },
    'no_comments': {
      'English': 'No Comments',
      'Telugu': 'వ్యాఖ్యలు లేవు',
    },
    'just_now': {
      'English': 'Just now',
      'Telugu': 'ఇప్పుడే',
    },
    'select_language_login': {
      'English': 'Select Language',
      'Telugu': 'భాషను ఎంచుకోండి',
    },
    'hover_post': {
      'English': 'Share your thoughts',
      'Telugu': 'మీ ఆలోచనలను పంచుకోండి',
    },
    'hover_edit': {
      'English': 'Edit your post',
      'Telugu': 'మీ పోస్ట్‌ని సవరించండి',
    },
    'hover_delete': {
      'English': 'Delete your post',
      'Telugu': 'మీ పోస్ట‌ని తొలగించండి',
    },
    'hover_comment': {
      'English': 'Add a comment',
      'Telugu': 'వ్యాఖ్యను జోడించండి',
    },
    'hover_like': {
      'English': 'Like this post',
      'Telugu': 'ఈ పోస్ట్‌ని ఇష్టపడండి',
    },
    'hover_share': {
      'English': 'Share this post',
      'Telugu': 'ఈ పోస్ట్‌ని షేర్ చేయండి',
    },
    'login': {
      'English': 'Login',
      'Telugu': ' లాగిన్',
    },
    'planter_title': {
      'English': 'Planter',
      'Telugu': ' ప్లాంటర్',
    },
    'hover_language': {
      'English': 'Change language',
      'Telugu': 'భాషను మార్చండి',
    },
    'back': {
      'English': 'Go back',
      'Telugu': 'వెనుకకు వెళ్ళండి',
    },
    'change_language_tooltip': {
      'English': 'Change language',
      'Telugu': 'భాషను మార్చండి',
    },
    'menu_tooltip': {
      'English': 'Show menu',
      'Telugu': 'మెనూను చూపించు',
    },
    'A': {
      'English':
          'Common plant diseases can be identified by observing symptoms like:\n\n'
              '• Spots or lesions on leaves\n'
              '• Wilting despite adequate watering\n'
              '• Yellowing or browning of leaves\n'
              '• Powdery or fuzzy growth on plants\n'
              '• Stunted growth\n\n'
              'Take a photo of the affected plant part and use our disease detection feature for accurate diagnosis.',
      'Telugu':
          'సాధారణ మొక్క వ్యాధులను పైన ఉన్న లక్షణాలను గమనించడం ద్వారా గుర్తించవచ్చు:\n\n'
              '• ఆకులపై మరకలు లేదా గాయాలు\n'
              '• తగినంత నీరు ఉన్నప్పటికీ కుళ్లడం\n'
              '• ఆకుల పసుపు లేదా బ్రౌనింగ్\n'
              '• మొక్కలపై పొడి లేదా ముదురు పెరుగుదల\n'
              '• పెరుగుదల రద్దు\n\n'
              'కారణాలు గుర్తించడానికి ప్రభావిత మొక్క భాగం ఫోటో తీసి మా వ్యాధి గుర్తింపు ఫీచర్ ఉపయోగించండి.',
    },
    'B': {
      'English': 'Key organic farming practices include:\n\n'
          '• Using compost and natural fertilizers\n'
          '• Crop rotation to maintain soil health\n'
          '• Natural pest control methods\n'
          '• Companion planting\n'
          '• Green manuring\n'
          '• Mulching for weed control\n'
          '• Maintaining biodiversity',
      'Telugu': 'ముఖ్యమైన సేంద్రీయ వ్యవసాయ పద్ధతులు:\n\n'
          '• కంపోస్టు మరియు సహజ ఎరువులు ఉపయోగించడం\n'
          '• నేల ఆరోగ్యాన్ని కాపాడటానికి పంట మార్పిడి\n'
          '• సహజ పురుగు నియంత్రణ పద్ధతులు\n'
          '• సహచర మొక్కలు పెంచడం\n'
          '• పచ్చ మల్లేటి\n'
          '• కలుపు నియంత్రణ కోసం మల్చింగ్\n'
          '• బయోడైవర్సిటీని కాపాడడం',
    },
    'C': {
      'English': 'Based on the current season, consider growing:\n\n'
          'Summer:\n'
          '• Tomatoes, Peppers, Eggplants\n'
          'Winter:\n'
          '• Leafy greens, Peas, Root vegetables\n'
          'Monsoon:\n'
          '• Rice, Corn, Pulses\n\n'
          'Use our seasonal crop calendar feature for more specific recommendations.',
      'Telugu': 'ప్రస్తుత సీజన్ ఆధారంగా, ఈ పంటలను పండించడం పరిగణించండి:\n\n'
          'సమ్మర్:\n'
          '• టమాటాలు, మిరపకాయలు, బెండకాయలు\n'
          'వింటర్:\n'
          '• ఆకుకూరలు, పెసలు, మూల పచ్చి కూరలు\n'
          'వర్షాకాలం:\n'
          '• బియ్యం, మక్క, పప్పు దినుసులు\n\n'
          'ఇంకా సవివర సిఫార్సుల కోసం మా సీజనల్ పంట క్యాలెండర్ ఫీచర్ ఉపయోగించండి.',
    },
    'D': {
      'English': 'Natural pest control methods include:\n\n'
          '• Neem oil spray\n'
          '• Companion planting\n'
          '• Introducing beneficial insects\n'
          '• Garlic and chili spray\n'
          '• Maintaining plant hygiene\n'
          '• Using physical barriers\n'
          '• Crop rotation',
      'Telugu': 'సహజ పురుగు నియంత్రణ పద్ధతులు:\n\n'
          '• నిమ్మ ఆవు నూనె స్ప్రే\n'
          '• సహచర మొక్కల పెంపకం\n'
          '• లాభదాయక కీటకాలను పరిచయం చేయడం\n'
          '• వెల్లుల్లి మరియు మిరపకాయల స్ప్రే\n'
          '• మొక్కల పరిశుభ్రత నిర్వహణ\n'
          '• భౌతిక బారియర్ల ఉపయోగం\n'
          '• పంట మార్పిడి',
    },
    'E': {
      'English': 'To improve soil health:\n\n'
          '• Add organic matter regularly\n'
          '• Use compost and vermicompost\n'
          '• Practice crop rotation\n'
          '• Avoid over-tilling\n'
          '• Maintain proper drainage\n'
          '• Use cover crops\n'
          '• Test soil regularly',
      'Telugu': 'నేల ఆరోగ్యాన్ని మెరుగుపరచడానికి:\n\n'
          '• ఆర్గానిక్ పదార్థాన్ని క్రమం తప్పకుండా జోడించండి\n'
          '• కంపోస్టు మరియు వర్మీ కంపోస్టు ఉపయోగించండి\n'
          '• పంట మార్పిడి పాటించండి\n'
          '• అధికగా టిల్లింగ్ నుండి నివారించండి\n'
          '• సరైన కాలువ నిర్వహించండి\n'
          '• కవర్ పంటలు ఉపయోగించండి\n'
          '• నేలను క్రమం తప్పకుండా పరీక్షించండి',
    },
    'F': {
      'English': 'Optimal watering practices include:\n\n'
          '• Water deeply but less frequently\n'
          '• Water at the base of plants\n'
          '• Water early morning or evening\n'
          '• Use mulch to retain moisture\n'
          '• Adjust watering based on weather\n'
          '• Check soil moisture before watering',
      'Telugu': 'సరిగా నీరు పట్టడం పద్ధతులు:\n\n'
          '• బాగా నీరు పెట్టండి కాని తక్కువగా వాడండి\n'
          '• మొక్కల అడుగున నీరు పట్టండి\n'
          '• ఉదయం లేదా సాయంత్రం నీరు పెట్టండి\n'
          '• తేమని నిలుపుకొనేందుకు మల్చ్ వాడండి\n'
          '• వాతావరణ ఆధారంగా నీరు పట్టడాన్ని మార్చండి\n'
          '• నీరు పెట్టే ముందు నేల తేమను పరీక్షించండి',
    },
    'G': {
      'English': 'Sunlight requirements vary by plant:\n\n'
          'Full Sun (6+ hours):\n'
          '• Tomatoes, Peppers, Most fruits\n\n'
          'Partial Sun (4-6 hours):\n'
          '• Herbs, Some vegetables\n\n'
          'Partial Shade (2-4 hours):\n'
          '• Leafy greens, Root vegetables\n\n'
          'Check our plant database for specific requirements.',
      'Telugu': 'సూర్యకాంతి అవసరాలు మొక్క ఆధారంగా మారుతాయి:\n\n'
          'పూర్తి సూర్యకాంతి (6+ గంటలు):\n'
          '• టమాటాలు, మిరపకాయలు, మిగతా పండ్లు\n\n'
          'భాగస్వామ్యం సూర్యకాంతి (4-6 గంటలు):\n'
          '• సుగంధ ద్రవ్యాలు, కొన్ని కూరగాయలు\n\n'
          'భాగస్వామ్యం నీడ (2-4 గంటలు):\n'
          '• ఆకుకూరలు, మూల పచ్చి కూరలు\n\n'
          'క్లారిటీ కోసం మా మొక్కల డేటాబేస్‌ను తనిఖీ చేయండి.',
    },
    'H': {
      'English': 'For proper fertilizer use:\n\n'
          '• Test soil before applying\n'
          '• Follow recommended dosage\n'
          '• Apply at right growth stage\n'
          '• Maintain proper timing\n'
          '• Use organic options when possible\n\n'
          'Use our fertilizer calculator for precise measurements.',
      'Telugu': 'సరిగ్గా ఎరువులు వాడడానికి:\n\n'
          '• ఎరువులు పెట్టే ముందు నేలను పరీక్షించండి\n'
          '• సూచించిన మోతాదును పాటించండి\n'
          '• సరైన పెరుగుదల దశలో అమలు చేయండి\n'
          '• సరైన సమయాన్ని పాటించండి\n'
          '• సాధ్యమైనంత వరకు ఆర్గానిక్ ఎంపికలను వాడండి\n\n'
          'ఖచ్చితంగా కొలవడానికి మా ఎరువు కాలిక్యులేటర్‌ను ఉపయోగించండి.',
    },
    'I': {
      'English': 'Disease-resistant varieties include:\n\n'
          'Tomatoes:\n'
          '• Better Boy, Celebrity\n\n'
          'Rice:\n'
          '• IR64, MTU1010\n\n'
          'Cotton:\n'
          '• Bt Cotton varieties\n\n'
          'Check our seed catalog for more options.',
      'Telugu': 'వ్యాధి నిరోధక రకాలు ఈ విధంగా ఉంటాయి:\n\n'
          'టమాటాలు:\n'
          '• బెటర్ బాయ్, సెలెబ్రిటీ\n\n'
          'బియ్యం:\n'
          '• IR64, MTU1010\n\n'
          'పత్తి:\n'
          '• Bt పత్తి రకాలు\n\n'
          'ఇంకా ఎంపికల కోసం మా విత్తనాల కేటలాగ్‌ని తనిఖీ చేయండి.',
    },
    'J': {
      'English': 'To start a kitchen garden:\n\n'
          '• Choose a sunny location\n'
          '• Prepare raised beds or containers\n'
          '• Use quality soil mix\n'
          '• Start with easy crops\n'
          '• Plan seasonal rotations\n'
          '• Install proper irrigation\n'
          '• Use vertical space efficiently',
      'Telugu': 'వంటగది తోటను ప్రారంభించడానికి:\n\n'
          '• ఒక సూర్యకాంతి ప్రదేశాన్ని ఎంచుకోండి\n'
          '• ఎత్తు గల మంచాలు లేదా కంటైనర్లు సిద్ధం చేయండి\n'
          '• నాణ్యమైన నేల మిశ్రమం వాడండి\n'
          '• సులభమైన పంటలతో మొదలు పెట్టండి\n'
          '• సీజనల్ రొటేషన్లను ప్లాన్ చేయండి\n'
          '• సరైన నీటి పారుదల వ్యవస్థను ఏర్పాటు చేయండి\n'
          '• నిలువు ప్రదేశాన్ని సమర్థవంతంగా వాడండి',
    },
    'update': {
      'English': 'Update',
      'Telugu': 'అప్‌డేట్',
    },
    'Search _Products': {
      'English': 'Search Products',
      'Telugu': 'ఉత్పత్తులను శోధించండి',
    },
    'logout_confirmation_title': {
      'English': 'Logout Confirmation',
      'Telugu': 'లాగ్ అవుట్ నిర్ధారణ',
    },
    'logout_confirmation_message': {
      'English': 'Are you sure you want to logout?',
      'Telugu': 'మీరు నిజంగా లాగ్ అవుట్ కావాలనుకుంటున్నారా?',
    },
    'fertilizer_application_title': {
      'English': 'Fertilizer Application',
      'Telugu': 'ఎరువు ప్రయోగం',
    },
    'pest_control_title': {
      'English': 'Pest Control',
      'Telugu': 'కీటక నియంత్రణ',
    },
    'pruning_title': {
      'English': 'Pruning',
      'Telugu': 'తొలగింపు',
    },
    'harvesting_title': {
      'English': 'Harvesting',
      'Telugu': 'పంట కోత',
    },
    'composting_title': {
      'English': 'Composting',
      'Telugu': 'కంపోస్టు తయారీ',
    },
    'mulching_title': {
      'English': 'Mulching',
      'Telugu': 'మట్టి కప్పడం',
    },
    'crop_rotation_title': {
      'English': 'Crop Rotation',
      'Telugu': 'పంటల మార్పిడి',
    },
    'climate_adaptation_title': {
      'English': 'Climate Adaptation',
      'Telugu': 'వాతావరణ అనుకూలనం',
    },
    'soil_preparation_desc_line_0': {
      'English':
          '•Soil preparation is the essential first step in successful cultivation.',
      'Telugu': '•మట్టి సిద్ధం చేయడం విజయవంతమైన సాగుకు తొలి కీలకమైన దశ.',
    },
    'soil_preparation_desc_line_1': {
      'English':
          '•Begin by clearing any weeds, stones, or debris from the area.',
      'Telugu':
          '•మొదటగా మట్టిలోని కలుపు మొక్కలు, రాళ్లు, ఇతర వ్యర్థాలను తొలగించాలి.',
    },
    'soil_preparation_desc_line_2': {
      'English': '•Loosen the soil to improve aeration and water penetration.',
      'Telugu':
          '•గాలి ప్రవేశం మరియు నీటి శోషణను మెరుగుపరచడానికి మట్టిని దులిపి తీసుకోవాలి.',
    },
    'soil_preparation_desc_line_3': {
      'English':
          '•Tilling or plowing the soil helps break up compacted layers.',
      'Telugu': '•టిల్లింగ్ లేదా దున్నడం ద్వారా గట్టి మట్టి పొరలు విరగడవుతాయి.',
    },
    'soil_preparation_desc_line_4': {
      'English':
          'Test the soil to determine its pH level and nutrient content.',
      'Telugu': 'పీహెచ్ స్థాయి మరియు పోషక పదార్థాల కోసం మట్టిని పరీక్షించండి.',
    },
    'soil_preparation_desc_line_5': {
      'English':
          'Add organic matter, such as compost, to enrich the soil with nutrients.',
      'Telugu':
          'మట్టిని సమృద్ధిగా పోషకాలతో పెంచడానికి కంపోస్టు వంటి సేంద్రీయ పదార్థాలను జోడించాలి.',
    },
    'soil_preparation_desc_line_6': {
      'English':
          'If necessary, apply lime or sulfur to adjust the soil pH for optimal growth.',
      'Telugu':
          'అవసరమైతే, పంట వృద్ధికి అనువుగా ఉండేందుకు పీహెచ్ స్థాయిని సర్దుబాటు చేయడానికి లైమ్ లేదా సల్ఫర్ ఉపయోగించండి.',
    },
    'soil_preparation_desc_line_7': {
      'English': 'Level the soil to create an even surface for planting.',
      'Telugu': 'నాటడానికి సమంగా ఉండేలా మట్టిని సాఫుగా చేయాలి.',
    },
    'soil_preparation_desc_line_8': {
      'English': 'Ensure proper drainage to prevent waterlogging and root rot.',
      'Telugu':
          'నీరు నిల్వవద్దు మరియు రూట్ రాట్ నివారించేందుకు తగిన రక్షణ కలిగించాలి.',
    },
    'soil_preparation_desc_line_9': {
      'English':
          'Allow the soil to rest for a few days before planting to settle nutrients.',
      'Telugu':
          'పంట నాటకముందు మట్టిని కొన్ని రోజులు విశ్రాంతి తీసుకోనివ్వండి, తద్వారా పోషకాలు స్థిరపడతాయి.',
    },
    'watering_guide_desc_line_0': {
      'English':
          'Watering is a crucial practice to ensure plant health and growth.',
      'Telugu': 'నీటిపారుదల మొక్కల ఆరోగ్యం మరియు వృద్ధి కోసం కీలకమైన పద్ధతి.',
    },
    'watering_guide_desc_line_1': {
      'English':
          'Water early in the morning or late in the evening for best results.',
      'Telugu': 'ఉత్తమ ఫలితాల కోసం ఉదయం లేదా సాయంత్రం నీరు పోయాలి.',
    },
    'watering_guide_desc_line_2': {
      'English':
          'Avoid watering during peak sun hours to prevent evaporation loss.',
      'Telugu': 'ఉష్ణతరం సమయాలలో నీరు పోయడం నివారించాలి, ఆవిరి తగ్గించేందుకు.',
    },
    'watering_guide_desc_line_3': {
      'English':
          'Use a watering can or drip system for controlled water distribution.',
      'Telugu':
          'నీటి పంపిణీని నియంత్రించడానికి నీటి డబ్బా లేదా డ్రిప్ సిస్టమ్ ఉపయోగించండి.',
    },
    'watering_guide_desc_line_4': {
      'English':
          'Water deeply to encourage roots to grow deeper into the soil.',
      'Telugu': 'మట్టి లోతుగా నీరు పోసి రూట్లను లోతుగా వృద్ధిచేయాలి.',
    },
    'watering_guide_desc_line_5': {
      'English':
          'Check soil moisture levels to avoid overwatering or underwatering.',
      'Telugu':
          'అధికంగా లేదా తక్కువగా నీరు పోయకుండా మట్టి తేమ స్థాయిని తనిఖీ చేయండి.',
    },
    'watering_guide_desc_line_6': {
      'English':
          'Reduce watering frequency during rainy or high humidity periods.',
      'Telugu': 'వర్షాకాలంలో లేదా అధిక ఆర్ద్రత సమయంలో నీటి పరిమాణం తగ్గించండి.',
    },
    'watering_guide_desc_line_7': {
      'English': 'Ensure the soil is well-drained to prevent root diseases.',
      'Telugu': 'రూట్ వ్యాధులను నివారించేందుకు మట్టిని బాగా పారబోనివ్వాలి.',
    },
    'watering_guide_desc_line_8': {
      'English':
          'Mulch around plants to retain soil moisture and reduce evaporation.',
      'Telugu': 'మట్టిలో తేమ నిల్వ ఉంచడానికి మొక్కల చుట్టూ మల్చింగ్ చేయండి.',
    },
    'watering_guide_desc_line_9': {
      'English':
          'Observe plant leaves; wilting may indicate insufficient water.',
      'Telugu':
          'మొక్కల ఆకులను పరిశీలించండి; వాడిపోవడం తగినంత నీరు లేకపోవడాన్ని సూచించవచ్చు.',
    },
    'fertilizer_application_desc_line_0': {
      'English':
          'Fertilizer application is essential to provide plants with nutrients.',
      'Telugu': 'మొక్కలకు పోషకాలను అందించడానికి ఎరువు ఉపయోగించడం ముఖ్యమైనది.',
    },
    'fertilizer_application_desc_line_1': {
      'English':
          'Identify the right type of fertilizer based on soil test results.',
      'Telugu': 'మట్టిలోని పరీక్షా ఫలితాల ఆధారంగా సరైన ఎరువును గుర్తించాలి.',
    },
    'fertilizer_application_desc_line_2': {
      'English':
          'Organic fertilizers like compost are beneficial for soil health.',
      'Telugu':
          'కంపోస్టు వంటి సేంద్రీయ ఎరువులు మట్టి ఆరోగ్యానికి మేలుకలిగిస్తాయి.',
    },
    'fertilizer_application_desc_line_3': {
      'English':
          'Apply fertilizers in the right amounts to avoid nutrient overload.',
      'Telugu': 'పోషకాల అధిక భారం కాకుండా సరైన పరిమాణంలో ఎరువులు ఉపయోగించండి.',
    },
    'fertilizer_application_desc_line_4': {
      'English':
          'Follow recommended guidelines for fertilizer application timing.',
      'Telugu': 'ఎరువు ఉపయోగం సమయానికి సూచించిన మార్గదర్శకాలను అనుసరించండి.',
    },
    'fertilizer_application_desc_line_5': {
      'English':
          'Apply fertilizers evenly to ensure all plants receive nutrients.',
      'Telugu':
          'అన్ని మొక్కలకు పోషకాలు అందాలనే ఉద్దేశంతో ఎరువులు సమానంగా వాడండి.',
    },
    'fertilizer_application_desc_line_6': {
      'English':
          'Avoid applying fertilizer close to the plant stem to prevent burn.',
      'Telugu': 'మొక్కల కాండం దగ్గర ఎరువులు పడకుండా ఉండేలా జాగ్రత్త వహించాలి.',
    },
    'fertilizer_application_desc_line_7': {
      'English':
          'Water the soil after applying fertilizers to aid nutrient absorption.',
      'Telugu':
          'పోషకాలు శోషించుకునేందుకు ఎరువులు వేసిన తర్వాత మట్టికి నీరు పోయాలి.',
    },
    'fertilizer_application_desc_line_8': {
      'English':
          'Use slow-release fertilizers for sustained nutrient availability.',
      'Telugu':
          'పోషకాలు నెమ్మదిగా విడుదలవుతూ ఉండేందుకు స్లో-రిస్లీస్ ఎరువులు వాడండి.',
    },
    'fertilizer_application_desc_line_9': {
      'English':
          'Observe plant health to determine if additional fertilizer is needed.',
      'Telugu':
          'మరింత ఎరువు అవసరమేమో తెలుసుకోవడానికి మొక్కల ఆరోగ్యాన్ని పరిశీలించండి.',
    },
    'pest_control_desc_line_0': {
      'English':
          'Pest control is essential to protect crops from harmful insects.',
      'Telugu':
          'పంటలను హానికర కీటకాల నుంచి రక్షించేందుకు కీటక నియంత్రణ చాలా అవసరం.',
    },
    'pest_control_desc_line_1': {
      'English':
          'Regularly inspect plants for signs of pest damage or infestation.',
      'Telugu': 'పంటలపై కీటకాల దెబ్బ లేదా ఉనికి సూచనలను తరచూ పరిశీలించాలి.',
    },
    'pest_control_desc_line_2': {
      'English':
          'Use organic pest control methods like neem oil to reduce chemical usage.',
      'Telugu':
          'రసాయనాల వాడకం తగ్గించేందుకు నిమ్మ చెట్టు నూనె వంటి సేంద్రీయ పద్ధతులను ఉపయోగించండి.',
    },
    'pest_control_desc_line_3': {
      'English':
          'Encourage natural predators, such as ladybugs, to control pest populations.',
      'Telugu':
          'కీటకాల సంఖ్యను నియంత్రించేందుకు లేడీబగ్ వంటి సహజ ప్రత్యర్థులను ప్రోత్సహించండి.',
    },
    'pest_control_desc_line_4': {
      'English':
          'Rotate crops to disrupt pest breeding cycles and reduce infestations.',
      'Telugu':
          'పంటల మార్పిడి ద్వారా కీటకాల ప్రজনనాన్ని ఆపి, వారి ఉనికిని తగ్గించండి.',
    },
    'pest_control_desc_line_5': {
      'English': 'Remove infected plants immediately to prevent pest spread.',
      'Telugu':
          'కీటకాల వ్యాప్తి నివారించేందుకు బాధిత మొక్కలను వెంటనే తొలగించండి.',
    },
    'pest_control_desc_line_6': {
      'English': 'Use insect traps to monitor and reduce pest populations.',
      'Telugu':
          'కీటకాల సంఖ్యను తగ్గించేందుకు మరియు పర్యవేక్షించేందుకు కీటక పుటలు ఉపయోగించండి.',
    },
    'pest_control_desc_line_7': {
      'English':
          'Apply pesticides only when necessary and follow safety guidelines.',
      'Telugu':
          'అవసరమైతేనే పురుగుమందులను వాడండి మరియు భద్రతా మార్గదర్శకాలను అనుసరించండి.',
    },
    'pest_control_desc_line_8': {
      'English': 'Wear protective gear when applying chemical pest controls.',
      'Telugu': 'రసాయన పద్దతులు ఉపయోగిస్తున్నప్పుడు రక్షణ పరికరాలు ధరించండి.',
    },
    'pest_control_desc_line_9': {
      'English':
          'Maintain a clean garden area to reduce hiding spots for pests.',
      'Telugu':
          'కీటకాల తలదాచుకునే ప్రదేశాలు తగ్గించేందుకు తోటను శుభ్రంగా ఉంచండి.',
    },
    'pruning_desc_line_0': {
      'English':
          'Pruning helps improve plant growth and shape by removing dead parts.',
      'Telugu':
          'ప్రూనింగ్ ద్వారా సొంపైన ఆకారం కోసం మరియు వృద్ధి మెరుగుపడేందుకు చనిపోయిన భాగాలను తొలగించవచ్చు.',
    },
    'pruning_desc_line_1': {
      'English':
          'Trim branches and leaves that block sunlight from reaching lower areas.',
      'Telugu':
          'కింద ఉన్న ప్రాంతాలకు సూర్యరశ్మి చేరడానికి అడ్డం ఉన్న కొమ్మలు మరియు ఆకులను కత్తిరించండి.',
    },
    'pruning_desc_line_2': {
      'English':
          'Use clean, sharp tools to make precise cuts without damaging the plant.',
      'Telugu':
          'మొక్కను హానీ చేయకుండా ఖచ్చితంగా కోసేందుకు పరిశుభ్రమైన, పదును ఉన్న పరికరాలు ఉపయోగించండి.',
    },
    'pruning_desc_line_3': {
      'English':
          'Prune during the dormant season to minimize stress on the plant.',
      'Telugu':
          'మొక్కలపై ఒత్తిడి తగ్గించేందుకు నిద్రావస్థలో ఉన్నప్పుడు ప్రూనింగ్ చేయండి.',
    },
    'pruning_desc_line_4': {
      'English':
          'Remove diseased branches to prevent the spread of infections.',
      'Telugu':
          'సంవాహక వ్యాధులు వ్యాప్తి చెందకుండా కీటకాల బాధిత కొమ్మలను తొలగించండి.',
    },
    'pruning_desc_line_5': {
      'English': 'Thin out crowded branches to allow better air circulation.',
      'Telugu':
          'మంచి గాలిరాకపోవడానికి భూలోకము దగ్గర ఎలాంటి చిక్కటి ఖాతలను తొలగించండి.',
    },
    'pruning_desc_line_6': {
      'English': 'Prune flowering plants after blooming to shape the plant.',
      'Telugu':
          'పువ్వుల మొక్కలను పువ్వులు ముగిసిన తర్వాత ఆకారంగా ఉండేలా ప్రూనింగ్ చేయండి.',
    },
    'pruning_desc_line_7': {
      'English': 'Remove suckers from the base to focus energy on main growth.',
      'Telugu':
          'ముఖ్యమైన వృద్ధికి శక్తి కేంద్రీకృతం కావాలనే ఉద్దేశంతో అడుగు నుండి చనిపోయిన భాగాలను తొలగించండి.',
    },
    'pruning_desc_line_8': {
      'English': 'Avoid excessive pruning to prevent weakening the plant.',
      'Telugu': 'మొక్కల విపత్తు నివారించేందుకు ఎక్కువ ప్రూనింగ్ చేయకండి.',
    },
    'pruning_desc_line_9': {
      'English':
          'Prune regularly to maintain a neat and healthy garden appearance.',
      'Telugu':
          'శుభ్రమైన మరియు ఆరోగ్యకరమైన తోట ఆకృతిని ఉంచేందుకు క్రమం తప్పకుండా ప్రూనింగ్ చేయండి.',
    },
    'composting_desc_line_0': {
      'English':
          'Composting is the process of recycling organic waste into nutrient-rich soil.',
      'Telugu':
          'కంపోస్టింగ్ అనేది సేంద్రీయ వ్యర్థాలను పోషకాలు పుష్కలంగా ఉన్న మట్టిగా మార్చే ప్రక్రియ.',
    },
    'composting_desc_line_1': {
      'English':
          'Start composting by collecting kitchen scraps, yard waste, and leaves.',
      'Telugu':
          'వంటగది అవశేషాలు, తోట వ్యర్థాలు మరియు ఆకులను సేకరించడం ద్వారా కంపోస్టింగ్ ప్రారంభించండి.',
    },
    'composting_desc_line_2': {
      'English':
          'Layer brown materials (like dry leaves) and green materials (like vegetable scraps).',
      'Telugu':
          'బూడిద రంగు పదార్థాలు (పొడి ఆకులు) మరియు ఆకుపచ్చ పదార్థాలు (కూరగాయల తుక్కు) పంచుకొనాలి.',
    },
    'composting_desc_line_3': {
      'English':
          'Maintain moisture by watering the compost pile lightly as needed.',
      'Telugu':
          'అవసరానికి అనుగుణంగా కంపోస్ట్ గుట్టను స్వల్పంగా నీరు పోసి తేమను ఉంచండి.',
    },
    'composting_desc_line_4': {
      'English':
          'Turn the compost regularly to speed up the decomposition process.',
      'Telugu': 'అలిగి వేయడం వలన కుళ్లే ప్రక్రియ వేగవంతమవుతుంది.',
    },
    'composting_desc_line_5': {
      'English': 'Composting reduces the amount of waste sent to landfills.',
      'Telugu':
          'కంపోస్టింగ్ ల్యాండ్‌ఫిల్‌లకు పంపే వ్యర్థాల పరిమాణాన్ని తగ్గిస్తుంది.',
    },
    'composting_desc_line_6': {
      'English': 'Finished compost looks dark and has an earthy smell.',
      'Telugu': 'పూర్తయిన కంపోస్ట్ నల్లగా మరియు భూమి వాసనతో కనిపిస్తుంది.',
    },
    'composting_desc_line_7': {
      'English': 'Use compost as a natural fertilizer to enrich garden soil.',
      'Telugu':
          'తోట మట్టిని సమృద్ధిగా పోషించడానికి సేంద్రియ ఎరువుగా కంపోస్ట్ ఉపయోగించండి.',
    },
    'composting_desc_line_8': {
      'English': 'Compost improves soil structure and water retention.',
      'Telugu':
          'కంపోస్ట్ మట్టి నిర్మాణం మరియు నీరు నిల్వ సామర్థ్యాన్ని మెరుగుపరుస్తుంది.',
    },
    'composting_desc_line_9': {
      'English': 'Adding compost regularly enhances plant growth and health.',
      'Telugu':
          'కంపోస్టును క్రమం తప్పకుండా జోడించడం వల్ల మొక్కల వృద్ధి మరియు ఆరోగ్యం మెరుగుపడుతుంది.',
    },
    'mulching_desc_line_0': {
      'English':
          'Mulching involves covering the soil surface with organic or inorganic materials.',
      'Telugu':
          'మల్చింగ్ అనేది మట్టిపై సేంద్రీయ లేదా అసేంద్రీయ పదార్థాలను కప్పే ప్రక్రియ.',
    },
    'mulching_desc_line_1': {
      'English': 'It helps retain soil moisture by reducing evaporation.',
      'Telugu': 'ఇది ఆవిరి తగ్గించడం ద్వారా మట్టి తేమను నిల్వ చేస్తుంది.',
    },
    'mulching_desc_line_2': {
      'English': 'Mulching also helps regulate soil temperature.',
      'Telugu': 'మట్టిలో ఉష్ణోగ్రతను నియంత్రించడంలో మల్చింగ్ సహాయపడుతుంది.',
    },
    'mulching_desc_line_3': {
      'English':
          'Organic mulches, like straw and leaves, add nutrients to the soil.',
      'Telugu':
          'విప్ప మరియు ఆకులు వంటి సేంద్రీయ మల్చ్ మట్టికి పోషకాలను అందిస్తాయి.',
    },
    'mulching_desc_line_4': {
      'English': 'Mulch suppresses weed growth by blocking sunlight.',
      'Telugu':
          'సూర్యరశ్మిని అడ్డుకోవడం ద్వారా మల్చ్ కలుపు మొక్కల పెరుగుదలను తగ్గిస్తుంది.',
    },
    'mulching_desc_line_5': {
      'English': 'A layer of mulch prevents soil erosion during heavy rains.',
      'Telugu': 'భారీ వర్షాల్లో మట్టి కాపాడేందుకు మల్చ్ పొర ఉపయోగపడుతుంది.',
    },
    'mulching_desc_line_6': {
      'English':
          'Apply mulch around plants, but keep it away from stems to prevent rot.',
      'Telugu':
          'మొక్కల చుట్టూ మల్చ్ వేయండి, కానీ కాండం దగ్గర పెట్టకండి, తద్వారా కుళ్ళదు.',
    },
    'mulching_desc_line_7': {
      'English': 'Mulching reduces the need for frequent watering.',
      'Telugu': 'మల్చింగ్ వల్ల తరచుగా నీరు పోసే అవసరం తగ్గుతుంది.',
    },
    'mulching_desc_line_8': {
      'English':
          'It improves soil structure and supports beneficial organisms.',
      'Telugu':
          'ఇది మట్టిని మెరుగుపరుస్తుంది మరియు ఉపయోగకరమైన జీవులను ప్రోత్సహిస్తుంది.',
    },
    'mulching_desc_line_9': {
      'English':
          'Mulch should be reapplied periodically as it decomposes over time.',
      'Telugu': 'మల్చ్ క్రమంగా కుళ్ళిపోవడంతో అది తరచుగా పునరుద్ధరించాలి.',
    },
    'crop_rotation_desc_line_0': {
      'English':
          'Crop rotation involves changing the type of crop grown in a field each season.',
      'Telugu':
          'పంటల మార్పిడి అనేది ప్రతి సీజన్‌లో పొలంలో పెంచే పంట రకాన్ని మార్చడం.',
    },
    'crop_rotation_desc_line_1': {
      'English':
          'It helps prevent soil depletion by alternating nutrient requirements.',
      'Telugu':
          'వివిధ పోషకాల అవసరాల మార్పు ద్వారా మట్టిలో పోషకాలు తగ్గకుండా చేస్తుంది.',
    },
    'crop_rotation_desc_line_2': {
      'English':
          'Legumes in rotation add nitrogen to the soil, enriching it naturally.',
      'Telugu':
          'మార్పిడి చక్రంలో పప్పుదినుసులు నైట్రోజన్‌ను మట్టిలోకి ఇనుమడింపజేస్తాయి.',
    },
    'crop_rotation_desc_line_3': {
      'English':
          'It helps control pests and diseases by disrupting their life cycles.',
      'Telugu':
          'పంట మార్పిడి ద్వారా కీటకాలు మరియు రోగాల జీవన చక్రాన్ని భంగపరిచి వాటిని నియంత్రించవచ్చు.',
    },
    'crop_rotation_desc_line_4': {
      'English':
          'Rotating crops improves soil structure and reduces soil erosion.',
      'Telugu':
          'పంటలను మార్చడం మట్టిని మెరుగుపరుస్తుంది మరియు మట్టి దెబ్బతినకుండా కాపాడుతుంది.',
    },
    'crop_rotation_desc_line_5': {
      'English':
          'Different crops absorb different nutrients, maintaining soil balance.',
      'Telugu':
          'వివిధ పంటలు వివిధ పోషకాలను గ్రహిస్తాయి, తద్వారా మట్టిలో సంతులనం నిలవ ఉంటుంది.',
    },
    'crop_rotation_desc_line_6': {
      'English':
          'It reduces the dependency on chemical fertilizers and pesticides.',
      'Telugu': 'ఇది రసాయన ఎరువులు మరియు పురుగుమందులపై ఆధారపడకుండా చేస్తుంది.',
    },
    'crop_rotation_desc_line_7': {
      'English':
          'Crop rotation enhances biodiversity in the field environment.',
      'Telugu': 'పంటల మార్పిడి పొలంలో జీవ వైవిధ్యాన్ని పెంచుతుంది.',
    },
    'crop_rotation_desc_line_8': {
      'English': 'It can increase yields by maintaining long-term soil health.',
      'Telugu':
          'మట్టిలో దీర్ఘకాల ఆరోగ్యాన్ని నిలుపుకోవడం ద్వారా దిగుబడులు పెరుగుతాయి.',
    },
    'crop_rotation_desc_line_9': {
      'English':
          'Crop rotation is an eco-friendly and sustainable farming practice.',
      'Telugu': 'పంటల మార్పిడి పర్యావరణ అనుకూల మరియు సుస్థిర వ్యవసాయ పద్ధతి.',
    },
    'climate_adaptation_desc_line_0': {
      'English':
          'Climate adaptation involves adjusting practices to cope with changing climates.',
      'Telugu':
          'వాతావరణ అనుకూలనం అనేది మారుతున్న వాతావరణాలతో తట్టుకునేందుకు పద్ధతులను సర్దుబాటు చేయడం.',
    },
    'climate_adaptation_desc_line_1': {
      'English':
          'Farmers can choose crop varieties that are more resilient to climate stress.',
      'Telugu': 'రైతులు వాతావరణ ఒత్తిడిని తట్టుకునే పంట రకాలను ఎంచుకోవచ్చు.',
    },
    'climate_adaptation_desc_line_2': {
      'English':
          'Improved irrigation methods help conserve water during droughts.',
      'Telugu':
          'మెరుగైన నీటిపారుదల పద్ధతులు ఎడారిలో నీటిని సంరక్షించడంలో సహాయపడతాయి.',
    },
    'climate_adaptation_desc_line_3': {
      'English':
          'Mulching helps retain soil moisture, especially in warmer climates.',
      'Telugu':
          'మల్చింగ్ వలన మట్టి తేమ నిలవడం, ముఖ్యంగా వేడి వాతావరణాల్లో సహాయపడుతుంది.',
    },
    'climate_adaptation_desc_line_4': {
      'English':
          'Shade nets and greenhouses protect crops from extreme temperatures.',
      'Telugu':
          'షేడ్ నెట్‌లు మరియు గ్రీన్‌హౌస్‌లు తీవ్రమైన ఉష్ణోగ్రతల నుంచి పంటలను రక్షిస్తాయి.',
    },
    'climate_adaptation_desc_line_5': {
      'English':
          'Soil conservation techniques prevent erosion during heavy rains.',
      'Telugu': 'భారీ వర్షాల్లో మట్టి దెబ్బతినకుండా రక్షణ పద్ధతులు సహాయపడతాయి.',
    },
    'climate_adaptation_desc_line_6': {
      'English':
          'Using drought-resistant crops reduces the impact of water scarcity.',
      'Telugu': 'ఎడారి నిరోధక పంటలు నీటి కొరత ప్రభావాన్ని తగ్గిస్తాయి.',
    },
    'climate_adaptation_desc_line_7': {
      'English':
          'Early warning systems help farmers prepare for extreme weather events.',
      'Telugu':
          'తీవ్ర వాతావరణ పరిస్థితులకు సన్నద్ధం కావడానికి ముందస్తు హెచ్చరికా వ్యవస్థలు సహాయపడతాయి.',
    },
    'climate_adaptation_desc_line_8': {
      'English':
          'Diversifying crops reduces risk and enhances resilience to climate change.',
      'Telugu':
          'పంటల వైవిధ్యం ద్వారా సురక్షితత పెరుగుతుంది మరియు వాతావరణ మార్పులకు సహనంగా ఉంటుంది.',
    },
    'climate_adaptation_desc_line_9': {
      'English':
          'Climate adaptation ensures sustainable farming in the face of global warming.',
      'Telugu':
          'భూమి తాపన పరిస్థితుల మధ్య సుస్థిర వ్యవసాయానికి వాతావరణ అనుకూలనం అవసరం.',
    },
    'harvesting_desc_line_0': {
      'English':
          'Harvesting is the process of collecting mature crops from the field.',
      'Telugu':
          'పంట కోత అనేది పొలంలో నూతనంగా పెరిగిన పంటలను సేకరించే ప్రక్రియ.',
    },
    'harvesting_desc_line_1': {
      'English':
          'It’s essential to harvest crops at the right time for best quality.',
      'Telugu': 'అత్యుత్తమ నాణ్యత కోసం సరైన సమయానికి పంటలను కోత చేయడం అవసరం.',
    },
    'harvesting_desc_line_2': {
      'English': 'Use appropriate tools for harvesting to prevent crop damage.',
      'Telugu': 'పంట నష్టాన్ని తగ్గించడానికి సరైన పరికరాలు ఉపయోగించాలి.',
    },
    'harvesting_desc_line_3': {
      'English':
          'Harvesting early in the morning helps retain moisture in crops.',
      'Telugu': 'పంటల్లో తేమ నిల్వ ఉండేందుకు ఉదయం కోత జరిపి సేకరించడం మంచిది.',
    },
    'harvesting_desc_line_4': {
      'English':
          'Store harvested crops in a cool, dry place to preserve freshness.',
      'Telugu':
          'కోసిన పంటలను చల్లని, పొడి ప్రదేశంలో నిల్వ ఉంచితే తాజాదనంగా ఉంటాయి.',
    },
    'harvesting_desc_line_5': {
      'English': 'Separate damaged produce to maintain overall crop quality.',
      'Telugu':
          'మొత్తం పంట నాణ్యతను కాపాడేందుకు దెబ్బతిన్న ఉత్పత్తిని విడదీయాలి.',
    },
    'harvesting_desc_line_6': {
      'English': 'Proper harvesting reduces post-harvest losses and spoilage.',
      'Telugu': 'సరైన కోత అనంతర నష్టాలను మరియు పంట పాడును తగ్గిస్తుంది.',
    },
    'harvesting_desc_line_7': {
      'English': 'Some crops require gentle handling to avoid bruising.',
      'Telugu': 'కొన్ని పంటలను పగుళ్లు రాకుండా మృదువుగా సంరక్షించాలి.',
    },
    'harvesting_desc_line_8': {
      'English': 'Timely harvesting ensures maximum yield and profitability.',
      'Telugu': 'సమయానికి కోత పెరిగిన దిగుబడిని మరియు లాభదాయకతను కలిగిస్తుంది.',
    },
    'harvesting_desc_line_9': {
      'English':
          'Harvested crops should be processed quickly to maintain quality.',
      'Telugu': 'నాణ్యతను నిలుపుకునేందుకు కోసిన పంటలను త్వరగా ప్రాసెస్ చేయాలి.',
    },
    'damping_off_desc_line_0': {
      'English': 'Damping off is a common disease that affects seedlings.',
      'Telugu':
          'డాంపింగ్ ఆఫ్ అనేది పిండి మొక్కలను ప్రభావితం చేసే సాధారణ వ్యాధి.',
    },
    'damping_off_desc_line_1': {
      'English': 'It is caused by soil-borne fungi that attack young plants.',
      'Telugu':
          'ఇది పిన్న మొక్కలను దాడి చేసే మట్టి ద్వారా వ్యాపించే శిలీంధ్రాల వల్ల సంభవిస్తుంది.',
    },
    'damping_off_desc_line_2': {
      'English': 'Symptoms include wilting, stem rot, and seedling collapse.',
      'Telugu':
          'లక్షణాలలో వాడిపోవడం, కాండం కుళ్ళడం మరియు మొక్కలు పతనమవడం ఉన్నాయి.',
    },
    'damping_off_desc_line_3': {
      'English': 'Damping off usually occurs in moist, poorly drained soils.',
      'Telugu':
          'డాంపింగ్ ఆఫ్ సాధారణంగా తడిగా, తక్కువ నీరు కలిగిన మట్టిలో వస్తుంది.',
    },
    'damping_off_desc_line_4': {
      'English': 'Overcrowded planting increases the risk of damping off.',
      'Telugu': 'మొక్కలను సమీకరించి నాటడం డాంపింగ్ ఆఫ్ ప్రమాదాన్ని పెంచుతుంది.',
    },
    'damping_off_desc_line_5': {
      'English':
          'Proper soil drainage helps reduce the incidence of this disease.',
      'Telugu': 'సరైన మట్టి డ్రైనేజీ ఈ వ్యాధి వచ్చే అవకాశాన్ని తగ్గిస్తుంది.',
    },
    'damping_off_desc_line_6': {
      'English':
          'Use sterilized soil to prevent fungus from spreading to seedlings.',
      'Telugu':
          'పిండి మొక్కలకు శిలీంధ్రం వ్యాపించకుండా ఉండేందుకు శుద్ధి చేసిన మట్టిని ఉపయోగించాలి.',
    },
    'damping_off_desc_line_7': {
      'English': 'Avoid overwatering to keep the soil from becoming too damp.',
      'Telugu':
          'మట్టిని తడి కాకుండా ఉండేందుకు నీరు ఎక్కువగా పోయకుండా జాగ్రత్త వహించాలి.',
    },
    'damping_off_desc_line_8': {
      'English':
          'Applying fungicides can help protect seedlings from damping off.',
      'Telugu':
          'ఫంగిసైడ్లను ఉపయోగించడం ద్వారా పిండి మొక్కలను డాంపింగ్ ఆఫ్ నుండి రక్షించవచ్చు.',
    },
    'damping_off_desc_line_9': {
      'English':
          'Ensure good air circulation around seedlings to prevent disease.',
      'Telugu':
          'వ్యాధిని నివారించేందుకు పిండి మొక్కల చుట్టూ గాలి ప్రసరణ బాగా ఉండేలా చూడాలి.',
    },
    'bacterial_black_spot_desc_line_0': {
      'English': 'Bacterial black spot is a disease affecting citrus plants.',
      'Telugu':
          'బ్యాక్టీరియల్ బ్లాక్ స్పాట్ అనేది సిట్రస్ మొక్కలను ప్రభావితం చేసే వ్యాధి.',
    },
    'bacterial_black_spot_desc_line_1': {
      'English': 'It is caused by the bacterium Xanthomonas citri.',
      'Telugu': 'ఇది జాంటోమోనాస్ సిట్రి అనే బ్యాక్టీరియా వల్ల సంభవిస్తుంది.',
    },
    'bacterial_black_spot_desc_line_2': {
      'English': 'Symptoms include small, black lesions on leaves and fruit.',
      'Telugu': 'లక్షణాల్లో ఆకులు మరియు పండ్లపై చిన్న నల్లటి మచ్చలు ఉంటాయి.',
    },
    'bacterial_black_spot_desc_line_3': {
      'English': 'The lesions may have a yellow halo around them.',
      'Telugu': 'మచ్చల చుట్టూ పసుపు రంగు హాలో ఉండవచ్చు.',
    },
    'bacterial_black_spot_desc_line_4': {
      'English':
          'The disease spreads through wind, rain, and contaminated tools.',
      'Telugu':
          'ఈ వ్యాధి గాలి, వర్షం మరియు కాలుష్యకరమైన పరికరాల ద్వారా వ్యాపిస్తుంది.',
    },
    'bacterial_black_spot_desc_line_5': {
      'English': 'Warm, humid conditions favor the spread of this bacteria.',
      'Telugu':
          'ఈ బ్యాక్టీరియా వ్యాప్తికి వేడి, తేమ ఉన్న పరిస్థితులు అనుకూలంగా ఉంటాయి.',
    },
    'bacterial_black_spot_desc_line_6': {
      'English':
          'Prune affected branches and dispose of infected plant material.',
      'Telugu':
          'ప్రభావిత కొమ్మలను కత్తిరించి, బాధిత మొక్కల భాగాలను తీసివేయాలి.',
    },
    'bacterial_black_spot_desc_line_7': {
      'English': 'Copper-based sprays can help reduce bacterial black spot.',
      'Telugu':
          'కాపర్ ఆధారిత స్ప్రేలు బ్యాక్టీరియల్ బ్లాక్ స్పాట్‌ను తగ్గించడంలో సహాయపడతాయి.',
    },
    'bacterial_black_spot_desc_line_8': {
      'English': 'Use disease-free seeds and seedlings to prevent infection.',
      'Telugu':
          'వ్యాధి రహిత విత్తనాలు మరియు పిండి మొక్కలను ఉపయోగించడం ద్వారా సంక్రమణను నివారించవచ్చు.',
    },
    'bacterial_black_spot_desc_line_9': {
      'English': 'Practice crop rotation and avoid planting in infected soil.',
      'Telugu':
          'పంటల మార్పిడి పాటించాలి మరియు వ్యాధిగ్రస్తమైన మట్టిలో నాటడాన్ని నివారించాలి.',
    },
    'aphids_desc_line_0': {
      'English':
          'Aphids are small, soft-bodied insects that feed on plant sap.',
      'Telugu':
          'ఆఫిడ్లు చిన్న, మృదువైన శరీర కలిగిన పురుగులు, ఇవి మొక్కల రసాన్ని తింటాయి.',
    },
    'aphids_desc_line_1': {
      'English':
          'They are usually found in clusters on leaves, stems, and buds.',
      'Telugu':
          'ఇవి సాధారణంగా ఆకులు, కాండం మరియు మొగ్గలపై గుంపులుగా కనిపిస్తాయి.',
    },
    'aphids_desc_line_2': {
      'English': 'Aphids can cause yellowing and curling of leaves.',
      'Telugu':
          'ఆఫిడ్లు ఆకులు పసుపు రంగులోకి మారడం మరియు మడతపెట్టడం వంటి సమస్యలకు దారి తీస్తాయి.',
    },
    'aphids_desc_line_3': {
      'English':
          'They excrete a sticky substance called honeydew, which attracts ants.',
      'Telugu':
          'ఇవి హనిడ్యూ అనే కొమలమైన పదార్థాన్ని ఉత్పత్తి చేస్తాయి, ఇది చీమలను ఆకర్షిస్తుంది.',
    },
    'aphids_desc_line_4': {
      'English': 'Honeydew can lead to sooty mold growth on plant surfaces.',
      'Telugu': 'హనిడ్యూ వల్ల మొక్కల మీద నల్ల కూజాడు పెరగడం జరుగుతుంది.',
    },
    'aphids_desc_line_5': {
      'English': 'Aphids reproduce quickly, leading to large infestations.',
      'Telugu':
          'ఆఫిడ్లు త్వరగా పెరుగుతాయి, దీని వలన పెద్ద స్థాయిలో వ్యాప్తి చెందుతాయి.',
    },
    'aphids_desc_line_6': {
      'English':
          'Introduce natural predators like ladybugs to control aphid populations.',
      'Telugu':
          'ఆఫిడ్ జనాభాను నియంత్రించేందుకు లేడీబగ్ వంటి సహజ ప్రత్యర్థులను పరిచయం చేయండి.',
    },
    'aphids_desc_line_7': {
      'English':
          'Spraying neem oil is an effective organic method to reduce aphids.',
      'Telugu':
          'నిమ్మ నూనెను పిచికారీ చేయడం ఆఫిడ్లను తగ్గించడానికి సమర్థవంతమైన సేంద్రీయ విధానం.',
    },
    'aphids_desc_line_8': {
      'English':
          'Avoid over-fertilizing plants, as this can encourage aphid growth.',
      'Telugu':
          'మొక్కలకు అధిక ఎరువు ఇవ్వడం నివారించండి, ఇది ఆఫిడ్ పెరుగుదలకు ప్రోత్సాహం ఇస్తుంది.',
    },
    'aphids_desc_line_9': {
      'English':
          'Regularly inspect plants to catch and treat aphid infestations early.',
      'Telugu':
          'ఆఫిడ్ వ్యాప్తిని తొందరగా గుర్తించి చికిత్స చేయడానికి మొక్కలను క్రమం తప్పకుండా పరిశీలించండి.',
    },
    'black_citrus_aphid_desc_line_0': {
      'English':
          'Black citrus aphids are pests that primarily affect citrus plants.',
      'Telugu':
          'బ్లాక్ సిట్రస్ ఆఫిడ్లు ప్రధానంగా సిట్రస్ మొక్కలను ప్రభావితం చేసే కీటకాలు.',
    },
    'black_citrus_aphid_desc_line_1': {
      'English': 'They are small, dark-colored insects that feed on plant sap.',
      'Telugu': 'ఇవి చిన్న, నలుపు రంగు కీటకాలు, ఇవి మొక్కల రసాన్ని తింటాయి.',
    },
    'black_citrus_aphid_desc_line_2': {
      'English': 'Infestations can lead to curled and distorted leaves.',
      'Telugu':
          'వీటి వ్యాప్తి వల్ల ఆకులు మడతపెట్టడం మరియు ఆకారభంగం కలుగుతుంది.',
    },
    'black_citrus_aphid_desc_line_3': {
      'English':
          'They produce honeydew, which promotes the growth of sooty mold.',
      'Telugu': 'ఇవి హనిడ్యూ ఉత్పత్తి చేస్తాయి, ఇది నల్ల కూజాడును పెంచుతుంది.',
    },
    'black_citrus_aphid_desc_line_4': {
      'English': 'Sooty mold can reduce photosynthesis and weaken the plant.',
      'Telugu':
          'నల్ల కూజాడు ఫోటోసింథసిస్‌ను తగ్గిస్తుంది మరియు మొక్కలను బలహీనపరుస్తుంది.',
    },
    'black_citrus_aphid_desc_line_5': {
      'English':
          'Heavy infestations can stunt growth and reduce fruit quality.',
      'Telugu':
          'భారీ స్థాయి వ్యాప్తి వృద్ధిని అడ్డుకుంటుంది మరియు పండ్ల నాణ్యతను తగ్గిస్తుంది.',
    },
    'black_citrus_aphid_desc_line_6': {
      'English':
          'Ladybugs and parasitic wasps are natural predators of aphids.',
      'Telugu':
          'లేడీబగ్‌లు మరియు పరాన్నజీవి వాస్ప్‌లు ఆఫిడ్ల సహజ ప్రత్యర్థులు.',
    },
    'black_citrus_aphid_desc_line_7': {
      'English':
          'Insecticidal soap or neem oil can help control black citrus aphids.',
      'Telugu':
          'కీటక సంహారక సబ్బు లేదా నిమ్మ నూనె బ్లాక్ సిట్రస్ ఆఫిడ్లను నియంత్రించడంలో సహాయపడతాయి.',
    },
    'black_citrus_aphid_desc_line_8': {
      'English': 'Prune infested branches to reduce the spread of aphids.',
      'Telugu': 'ఆఫిడ్లు వ్యాప్తి చెందకుండా బాధిత కొమ్మలను కత్తిరించండి.',
    },
    'black_citrus_aphid_desc_line_9': {
      'English':
          'Inspect plants regularly to detect and manage infestations early.',
      'Telugu':
          'కీటక సంక్రమణను తొందరగా గుర్తించి నియంత్రించేందుకు మొక్కలను క్రమం తప్పకుండా పరిశీలించండి.',
    },
    'powdery_mildew_desc_line_0': {
      'English':
          'Powdery mildew is a fungal disease that affects a wide range of plants.',
      'Telugu':
          'పౌడరీ మిల్డ్యూ అనేది అనేక రకాల మొక్కలను ప్రభావితం చేసే శిలీంధ్ర వ్యాధి.',
    },
    'powdery_mildew_desc_line_1': {
      'English':
          'It appears as a white or gray powdery coating on leaves and stems.',
      'Telugu':
          'ఇది ఆకులు మరియు కాండంపై తెలుపు లేదా బూడిద రంగు పొడిగట్టు పూతగా కనిపిస్తుంది.',
    },
    'powdery_mildew_desc_line_2': {
      'English':
          'Powdery mildew thrives in warm, dry climates with high humidity.',
      'Telugu':
          'పౌడరీ మిల్డ్యూ వేడి, పొడి వాతావరణాలలో మరియు అధిక ఆర్ద్రతతో ఉన్న ప్రదేశాలలో విస్తరిస్తుంది.',
    },
    'powdery_mildew_desc_line_3': {
      'English': 'Infected leaves may become yellow and distorted over time.',
      'Telugu': 'బాధిత ఆకులు క్రమంగా పసుపుగా మరియు వంకరగా మారవచ్చు.',
    },
    'powdery_mildew_desc_line_4': {
      'English': 'This disease can reduce photosynthesis, weakening the plant.',
      'Telugu': 'ఈ వ్యాధి ఫోటోసింథసిస్‌ను తగ్గించి, మొక్కను బలహీనపరుస్తుంది.',
    },
    'powdery_mildew_desc_line_5': {
      'English':
          'Removing infected leaves can help prevent the disease from spreading.',
      'Telugu': 'బాధిత ఆకులను తొలగించడం ద్వారా వ్యాధి వ్యాప్తి తగ్గించవచ్చు.',
    },
    'powdery_mildew_desc_line_6': {
      'English':
          'Water plants at the base to keep leaves dry and reduce mildew risk.',
      'Telugu':
          'మొక్కలను అడుగున నీరు పోయడం ద్వారా ఆకులు పొడిగా ఉండి, మిల్డ్యూ ప్రమాదాన్ని తగ్గించవచ్చు.',
    },
    'powdery_mildew_desc_line_7': {
      'English': 'Apply sulfur or neem oil to help control powdery mildew.',
      'Telugu':
          'పౌడరీ మిల్డ్యూ నియంత్రించేందుకు గంధకం లేదా నిమ్మ నూనె ఉపయోగించండి.',
    },
    'powdery_mildew_desc_line_8': {
      'English':
          'Ensure good air circulation around plants to reduce humidity.',
      'Telugu':
          'మొక్కల చుట్టూ గాలి ప్రసరణ బాగా ఉండేలా చేయడం ద్వారా ఆర్ద్రత తగ్గుతుంది.',
    },
    'powdery_mildew_desc_line_9': {
      'English': 'Plant disease-resistant varieties to prevent powdery mildew.',
      'Telugu':
          'పౌడరీ మిల్డ్యూ నివారించడానికి వ్యాధి నిరోధక మొక్కల రకాలను నాటండి.',
    },
    'phoma_blight_desc_line_0': {
      'English':
          'Phoma blight is a fungal disease that affects various crops and plants.',
      'Telugu':
          'ఫోమా బ్లైట్ అనేది వివిధ పంటలు మరియు మొక్కలను ప్రభావితం చేసే శిలీంధ్ర వ్యాధి.',
    },
    'phoma_blight_desc_line_1': {
      'English':
          'It appears as dark, sunken lesions on leaves, stems, and fruits.',
      'Telugu':
          'ఇది ఆకులు, కాండం మరియు పండ్లపై నలుపు రంగు ముంచిన మచ్చలుగా కనిపిస్తుంది.',
    },
    'phoma_blight_desc_line_2': {
      'English': 'Infected areas may develop a yellow halo around the lesions.',
      'Telugu': 'బాధిత ప్రాంతాల చుట్టూ పసుపు రంగు హాలో ఏర్పడవచ్చు.',
    },
    'phoma_blight_desc_line_3': {
      'English': 'Phoma blight thrives in humid and cool conditions.',
      'Telugu': 'ఫోమా బ్లైట్ తేమ మరియు చల్లని పరిస్థితుల్లో విస్తరిస్తుంది.',
    },
    'phoma_blight_desc_line_4': {
      'English': 'This disease can weaken plants and reduce crop yield.',
      'Telugu':
          'ఈ వ్యాధి మొక్కలను బలహీనపరుస్తుంది మరియు పంట దిగుబడిని తగ్గిస్తుంది.',
    },
    'phoma_blight_desc_line_5': {
      'English':
          'Infected plants should be removed to prevent the spread of the disease.',
      'Telugu': 'వ్యాధి వ్యాప్తి తగ్గించడానికి బాధిత మొక్కలను తొలగించాలి.',
    },
    'phoma_blight_desc_line_6': {
      'English':
          'Proper crop rotation can help reduce phoma blight infections.',
      'Telugu':
          'సరైన పంట మార్పిడి ఫోమా బ్లైట్ సంక్రమణను తగ్గించడంలో సహాయపడుతుంది.',
    },
    'phoma_blight_desc_line_7': {
      'English':
          'Fungicides can be applied to control the spread of phoma blight.',
      'Telugu': 'ఫోమా బ్లైట్ వ్యాప్తిని నియంత్రించేందుకు ఫంగిసైడ్లను వాడవచ్చు.',
    },
    'phoma_blight_desc_line_8': {
      'English':
          'Avoid overhead watering to keep leaves dry and prevent infection.',
      'Telugu':
          'ఆకులు పొడిగా ఉండేందుకు మరియు వ్యాధి రాకుండా ఉండేందుకు పై నుండి నీరు పోసినటువంటి నీరు మానుకోండి.',
    },
    'phoma_blight_desc_line_9': {
      'English':
          'Maintain good field sanitation to reduce the risk of phoma blight.',
      'Telugu':
          'ఫోమా బ్లైట్ ప్రమాదాన్ని తగ్గించడానికి పొలంలో శుభ్రతను పాటించాలి.',
    },
    'pineapple_disease_desc_line_0': {
      'English':
          'Pineapple disease is a fungal infection that affects sugarcane.',
      'Telugu': 'పైనాపిల్ వ్యాధి అనేది చెరకు పై ప్రభావం చూపే శిలీంధ్ర సంక్రమణ.',
    },
    'pineapple_disease_desc_line_1': {
      'English': 'It is caused by the fungus Ceratocystis paradoxa.',
      'Telugu': 'ఇది సెరాటోసిస్టిస్ పరాడాక్సా అనే శిలీంధ్రం కారణంగా వస్తుంది.',
    },
    'pineapple_disease_desc_line_2': {
      'English': 'Infected plants emit a distinct pineapple-like odor.',
      'Telugu':
          'బాధిత మొక్కలు ప్రత్యేకమైన పైనాపిల్ వంటి వాసన ఉత్పత్తి చేస్తాయి.',
    },
    'pineapple_disease_desc_line_3': {
      'English': 'Symptoms include blackening and rotting of sugarcane stalks.',
      'Telugu': 'లక్షణాలలో చెరకు కాండం నల్లబారడం మరియు కుళ్ళడం ఉన్నాయి.',
    },
    'pineapple_disease_desc_line_4': {
      'English': 'The disease spreads quickly in warm, moist conditions.',
      'Telugu': 'వెచ్చని, తేమగల పరిస్థితుల్లో ఈ వ్యాధి వేగంగా వ్యాపిస్తుంది.',
    },
    'pineapple_disease_desc_line_5': {
      'English': 'It primarily affects newly planted sugarcane setts.',
      'Telugu': 'ఇది ప్రధానంగా కొత్తగా నాటిన చెరకు సెట్లపై ప్రభావం చూపుతుంది.',
    },
    'pineapple_disease_desc_line_6': {
      'English': 'Dipping cuttings in fungicide can reduce infection risk.',
      'Telugu':
          'కోసిన సెట్లను ఫంగిసైడ్‌లో ముంచడం ద్వారా సంక్రమణ ప్రమాదం తగ్గించవచ్చు.',
    },
    'pineapple_disease_desc_line_7': {
      'English': 'Good drainage is essential to prevent pineapple disease.',
      'Telugu':
          'పైనాపిల్ వ్యాధిని నివారించడానికి మంచి నీటి డ్రైనేజీ అనివార్యం.',
    },
    'pineapple_disease_desc_line_8': {
      'English':
          'Rotate crops to reduce the buildup of fungal pathogens in soil.',
      'Telugu': 'మట్టిలో శిలీంధ్రాల సంచయం తగ్గించడానికి పంట మార్పిడి చేయాలి.',
    },
    'pineapple_disease_desc_line_9': {
      'English': 'Remove and destroy infected plants to stop disease spread.',
      'Telugu':
          'వ్యాధి వ్యాప్తిని ఆపేందుకు బాధిత మొక్కలను తొలగించి నాశనం చేయాలి.',
    },
    'sooty_mold_desc_line_0': {
      'English':
          'Sooty mold is a fungal disease that appears as black, soot-like coating on plants.',
      'Telugu':
          'సూటీ మోల్డ్ అనేది మొక్కలపై నల్లటి బూడిద వంటి పూతగా కనిపించే శిలీంధ్ర వ్యాధి.',
    },
    'sooty_mold_desc_line_1': {
      'English':
          'It usually grows on the honeydew secreted by aphids and other insects.',
      'Telugu':
          'ఇది సాధారణంగా ఆఫిడ్లు మరియు ఇతర కీటకాల వల్ల విడుదలైన హనిడ్యూ మీద పెరుగుతుంది.',
    },
    'sooty_mold_desc_line_2': {
      'English':
          'The black coating can block sunlight, reducing photosynthesis.',
      'Telugu':
          'ఈ నల్ల పూత సూర్యకాంతిని అడ్డుకొని ఫోటోసింథసిస్‌ను తగ్గిస్తుంది.',
    },
    'sooty_mold_desc_line_3': {
      'English': 'Plants affected by sooty mold may appear weak and stunted.',
      'Telugu':
          'సూటీ మోల్డ్ కారణంగా ప్రభావిత మొక్కలు బలహీనంగా మరియు వృద్ధి రహితంగా కనిపించవచ్చు.',
    },
    'sooty_mold_desc_line_4': {
      'English':
          'This mold does not directly harm plants but affects their health indirectly.',
      'Telugu':
          'ఈ శిలీంధ్రం మొక్కలకు ప్రత్యక్షంగా హానీ చేయదు కానీ పరోక్షంగా వాటి ఆరోగ్యాన్ని ప్రభావితం చేస్తుంది.',
    },
    'sooty_mold_desc_line_5': {
      'English':
          'Controlling aphids and other pests can help prevent sooty mold.',
      'Telugu':
          'ఆఫిడ్లు మరియు ఇతర కీటకాలను నియంత్రించడం సూటీ మోల్డ్ నివారించడంలో సహాయపడుతుంది.',
    },
    'sooty_mold_desc_line_6': {
      'English': 'Washing leaves with water can help remove the mold coating.',
      'Telugu': 'ఆకులను నీటితో కడగడం ద్వారా శిలీంధ్ర పూత తొలగించవచ్చు.',
    },
    'sooty_mold_desc_line_7': {
      'English':
          'Insecticidal soaps can be used to control honeydew-secreting insects.',
      'Telugu':
          'హనిడ్యూ విడుదల చేసే కీటకాలను నియంత్రించడానికి కీటక సంహారక సబ్బులు వాడవచ్చు.',
    },
    'sooty_mold_desc_line_8': {
      'English':
          'Trim and remove heavily affected leaves to reduce mold growth.',
      'Telugu':
          'శిలీంధ్రం విస్తరణ తగ్గించేందుకు తీవ్రంగా ప్రభావిత ఆకులను తొలగించండి.',
    },
    'sooty_mold_desc_line_9': {
      'English':
          'Ensure proper air circulation around plants to prevent mold buildup.',
      'Telugu':
          'శిలీంధ్రం పెరగకుండా ఉండేందుకు మొక్కల చుట్టూ గాలి ప్రసరణ బాగా ఉండేలా చూడాలి.',
    },
    'anthracnose_desc_line_0': {
      'English':
          'Anthracnose is a fungal disease that affects many types of plants.',
      'Telugu':
          'ఆన్ట్రాక్నోస్ అనేది అనేక రకాల మొక్కలను ప్రభావితం చేసే శిలీంధ్ర వ్యాధి.',
    },
    'anthracnose_desc_line_1': {
      'English':
          'It appears as dark, sunken lesions on leaves, stems, flowers, and fruits.',
      'Telugu':
          'ఇది ఆకులు, కాండం, పువ్వులు, మరియు పండ్లపై నలుపు, ముంచిన మచ్చలుగా కనిపిస్తుంది.',
    },
    'anthracnose_desc_line_2': {
      'English': 'Infected areas may turn brown and dry out over time.',
      'Telugu': 'బాధిత ప్రాంతాలు క్రమంగా తడి పోయి గోధుమ రంగులోకి మారతాయి.',
    },
    'anthracnose_desc_line_3': {
      'English':
          'Warm, wet weather conditions favor the spread of anthracnose.',
      'Telugu':
          'వెచ్చని, తేమగల వాతావరణ పరిస్థితులు ఆన్ట్రాక్నోస్ వ్యాప్తికి అనుకూలంగా ఉంటాయి.',
    },
    'anthracnose_desc_line_4': {
      'English':
          'This disease can cause premature leaf drop and reduced plant health.',
      'Telugu':
          'ఈ వ్యాధి ఆకులు ముందుగా రాలిపోవడానికి మరియు మొక్కల ఆరోగ్యం తగ్గిపోవడానికి దారితీస్తుంది.',
    },
    'anthracnose_desc_line_5': {
      'English': 'Pruning infected plant parts can help limit the spread.',
      'Telugu':
          'బాధిత మొక్కల భాగాలను కత్తిరించడం ద్వారా వ్యాప్తి తగ్గించవచ్చు.',
    },
    'anthracnose_desc_line_6': {
      'English':
          'Avoid overhead watering to keep leaves dry and reduce infection risk.',
      'Telugu':
          'ఆకులను పొడిగా ఉంచేందుకు మరియు వ్యాధి ప్రమాదాన్ని తగ్గించేందుకు పై నుండి నీరు పోయడం నివారించండి.',
    },
    'anthracnose_desc_line_7': {
      'English': 'Applying copper-based fungicides can control anthracnose.',
      'Telugu':
          'కాపర్ ఆధారిత ఫంగిసైడ్లను వాడడం ద్వారా ఆన్ట్రాక్నోస్ నియంత్రించవచ్చు.',
    },
    'anthracnose_desc_line_8': {
      'English':
          'Remove and dispose of fallen leaves to reduce fungal buildup.',
      'Telugu':
          'శిలీంధ్రాల నిల్వ తగ్గించేందుకు రాలిన ఆకులను తొలగించి పూడ్చాలి.',
    },
    'anthracnose_desc_line_9': {
      'English':
          'Crop rotation and proper spacing can help prevent anthracnose.',
      'Telugu':
          'పంట మార్పిడి మరియు సరైన దూరం ఆన్ట్రాక్నోస్‌ను నివారించడంలో సహాయపడతాయి.',
    },
    'leaf_spot_desc_line_0': {
      'English':
          'Leaf spot is a common fungal or bacterial disease affecting plants.',
      'Telugu':
          'లీఫ్ స్పాట్ అనేది మొక్కలను ప్రభావితం చేసే సాధారణ శిలీంధ్ర లేదా బ్యాక్టీరియల్ వ్యాధి.',
    },
    'leaf_spot_desc_line_1': {
      'English': 'It appears as small, round, brown or black spots on leaves.',
      'Telugu':
          'ఇది ఆకులపై చిన్న, వృత్తాకార, గోధుమ లేదా నల్లటి మచ్చలుగా కనిపిస్తుంది.',
    },
    'leaf_spot_desc_line_2': {
      'English': 'The spots may enlarge and cause leaves to yellow and drop.',
      'Telugu': 'ఈ మచ్చలు పెరిగి, ఆకులు పసుపు రంగులోకి మారి రాలిపోతాయి.',
    },
    'leaf_spot_desc_line_3': {
      'English': 'Leaf spot diseases thrive in warm, moist environments.',
      'Telugu':
          'లీఫ్ స్పాట్ వ్యాధులు వేడి మరియు తేమగల వాతావరణంలో విస్తరిస్తాయి.',
    },
    'leaf_spot_desc_line_4': {
      'English':
          'Overhead watering can spread the spores that cause leaf spot.',
      'Telugu':
          'పై నుండి నీరు పోయడం వలన లీఫ్ స్పాట్ వ్యాధి స్పోర్లు వ్యాపిస్తాయి.',
    },
    'leaf_spot_desc_line_5': {
      'English':
          'Removing infected leaves can help prevent the disease from spreading.',
      'Telugu': 'బాధిత ఆకులను తొలగించడం ద్వారా వ్యాధి వ్యాప్తి తగ్గించవచ్చు.',
    },
    'leaf_spot_desc_line_6': {
      'English':
          'Ensure proper air circulation around plants to reduce humidity.',
      'Telugu':
          'తేమ తగ్గించేందుకు మొక్కల చుట్టూ సరైన గాలి ప్రసరణ ఉండేలా చూడాలి.',
    },
    'leaf_spot_desc_line_7': {
      'English': 'Fungicides can be used to treat leaf spot infections.',
      'Telugu':
          'ఫంగిసైడ్లను లీఫ్ స్పాట్ సంక్రమణను నివారించడానికి ఉపయోగించవచ్చు.',
    },
    'leaf_spot_desc_line_8': {
      'English':
          'Avoid working with plants when they are wet to prevent spread.',
      'Telugu':
          'వ్యాధి వ్యాప్తిని నివారించేందుకు తడిగా ఉన్నప్పుడు మొక్కలతో పనులు చేయకండి.',
    },
    'leaf_spot_desc_line_9': {
      'English':
          'Practice crop rotation to reduce the buildup of pathogens in the soil.',
      'Telugu': 'మట్టిలో పాథోజెన్ల నిల్వ తగ్గించేందుకు పంట మార్పిడి పాటించండి.',
    },
    'powdery_mildew': {
      'English': 'Powdery Mildew',
      'Telugu': 'పొడి నలుపు',
    },
    'leaf_spot': {
      'English': 'Leaf Spot',
      'Telugu': 'ఆకు మచ్చ',
    },
    'urea': {
      'English': 'Urea',
      'Telugu': 'యూరియా',
    },
    'tsp': {
      'English': 'Leaf Spot',
      'Telugu': 'టీఎస్పి',
    },
    'mop': {
      'English': 'Leaf Spot',
      'Telugu': 'ఎంఓపి ',
    },
    'kg': {
      'English': 'Kg',
      'Telugu': 'కెజి ',
    },
    'cereals_detailed_guide': {
      'English':
          'Basal Application: Apply 50% Nitrogen (N), all Phosphorus (P), and Potassium (K) before sowing or transplanting.\nTillering Stage: Apply 25% Nitrogen at the beginning of tillering.\nPanicle or Flowering Stage: Apply the remaining 25% Nitrogen during the panicle initiation or flowering stage to enhance grain yield.',
      'Telugu':
          'మొదటి దశ (బేస్ ఎరువు): 50% నత్రజని (N), మొత్తం ఫాస్పరస్ (P), మరియు పొటాషియం (K)ను సూత్రం వేసే ముందు అందించాలి.\nమొగ్గల దశ: మొగ్గల ప్రారంభంలో 25% నత్రజని వాడాలి.\nపుష్పం లేదా కతిమి దశ: తోట మొగ్గల పుష్పంలో చివరి 25% నత్రజని అందించండి.'
    },
    'commercial_detailed_guide': {
      'English':
          'Basal Application: Apply 40% Nitrogen, all Phosphorus, and Potassium before planting.\nVegetative Growth: Apply 30% Nitrogen during early vegetative growth (around 30-40 days after planting).\nFlowering or Bud Stage: Apply the remaining 30% Nitrogen to support flowering and bud development.',
      'Telugu':
          'బేస్ ఎరువు: నత్రజని 40%, మొత్తం ఫాస్పరస్ మరియు పొటాషియం మొక్కలు నాటే ముందు అందించాలి.\nశాఖావృద్ధి దశ: మొక్కల పెరుగుదల ప్రారంభంలో (నాటిన 30-40 రోజులు తరువాత) 30% నత్రజని ఇవ్వాలి.\nపుష్పం లేదా మొగ్గల దశ: చివరి 30% నత్రజని పుష్పాలు మరియు మొగ్గల వృద్ధికి అందించండి.'
    },
    'fruits_detailed_guide': {
      'English':
          'Basal Application: Apply 50% Nitrogen, all Phosphorus, and Potassium at the beginning of the growing season.\nMid-Season: Apply 25% Nitrogen to support fruit development.\nFruit Expansion Stage: Apply the remaining 25% Nitrogen when fruits start enlarging to increase yield and quality.',
      'Telugu':
          'ప్రాథమిక దశ: వృద్ధి సీజన్ ప్రారంభంలో 50% నత్రజని, మొత్తం ఫాస్పరస్, మరియు పొటాషియం అందించాలి.\nమధ్య దశ: పండ్ల వృద్ధిని ప్రోత్సహించడానికి 25% నత్రజని ఇవ్వాలి.\nపండు పెరుగుదల దశ: పండ్లు పెరుగుతున్నప్పుడు మిగిలిన 25% నత్రజని ఇవ్వడం వల్ల దిగుబడి మరియు నాణ్యత పెరుగుతుంది.'
    },
    'jute': {
      'English': 'Jute',
      'Telugu': 'జ్యూట్',
    },    
    'tea': {
      'English': 'Tea',
      'Telugu': 'టీ',
    },    
    'millets': {
      'English': 'Millets',
      'Telugu': 'చిరుధాన్యాలు',
    },  
    'pulses': {
      'English': 'Pulses',
      'Telugu': 'పప్పులు',
    },      
  };
}
