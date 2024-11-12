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
      'Telugu': 'మొలకల డ్యాంపంగ్-ఆఫ్',
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
          '  వేర్ల మరియు మొలకల మొదటి వృద్ధిని ప్రోత్సహించడానికి నాటడానికి ముందు N-P-K ఎరువు పెట్టండి. ',
    },
    'schedule___': {
      'English':
          ' Apply a Nitrogen-rich fertilizer 2-4 weeks after planting to boost vegetative growth.',
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
    'create_account': {
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
  };
}
