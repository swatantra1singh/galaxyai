class ApiConstants {
  // Base URLs
  static const String baseUrl = 'https://api.galaxyai.com/v1';
  static const String imageBaseUrl = 'https://cdn.galaxyai.com';
  
  // Endpoints
  static const String tools = '/tools';
  static const String popularTools = '/tools/popular';
  static const String trendingTools = '/tools/trending';
  static const String toolsByCategory = '/tools/category';
  static const String imageGenerator = '/tools/image-generator';
  static const String videoGenerator = '/tools/video-generator';
  static const String textToSpeech = '/tools/text-to-speech';
  static const String voiceCloner = '/tools/voice-cloner';
  static const String libraries = '/libraries';
  static const String recentTools = '/user/recent';
  static const String favorites = '/user/favorites';
  
  // Headers
  static const String authorization = 'Authorization';
  static const String contentType = 'Content-Type';
  static const String accept = 'Accept';
  
  // Timeout
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}

class AppConstants {
  static const String appName = 'Galaxy.ai';
  static const String welcomeTitle = 'Welcome To Galaxy.ai';
  static const String welcomeDescription = 'Discover 2113 powerful AI tools to enhance your productivity';
  static const String exploreTools = 'Explore Tools';
  static const String popularTools = 'Popular Tools';
  static const String seeAll = 'See all';
  static const String libraries = 'Libraries';
  static const String recent = 'Recent';
  static const String favourites = 'Favourites';
  static const String trending = 'Trending';
  
  // Categories
  static const String all = 'All';
  static const String image = 'Image';
  static const String video = 'Video';
  static const String text = 'Text';
  static const String audio = 'Audio';
  
  // Tool Names
  static const String aiImageGenerator = 'AI Image Generator';
  static const String aiVideoGenerator = 'AI Video Generator';
  static const String aiMusicGenerator = 'AI Music Generator';
  static const String aiVoiceCloner = 'AI Voice Cloner';
  static const String aiIconGenerator = 'AI Icon Generator';
  static const String textToSpeech = 'Text to Speech';
  static const String aiVoiceChanger = 'AI Voice Changer';
  static const String aiClothesChanger = 'AI Clothes Changer';
  
  // Library Names
  static const String imageLibrary = 'Image Library';
  static const String videoLibrary = 'Video Library';
  static const String audioLibrary = 'Audio Library';
  
  // Storage Keys
  static const String tokenKey = 'auth_token';
  static const String userIdKey = 'user_id';
  static const String themeKey = 'theme_mode';
}
