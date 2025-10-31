# Galaxy AI Platform

A multi-modal AI platform Flutter application featuring a sleek dark theme with purple accents, built with clean architecture principles.

## Features

### Home Screen
- Welcome card with gradient background
- Popular tools section with circular icons
- Libraries section (Image, Video, Audio)
- Recent and Favorites tabs with tool listings
- Bottom navigation bar

### Tools Screen
- Category filters (All, Image, Video, Text)
- Grid view of AI tools with trending badges
- Favorite/star functionality
- Tool cards with gradient backgrounds

### Settings Screen
- Account settings (Profile, Subscription)
- Preferences (Notifications, Language, Dark Mode)
- Support section (Help, Privacy Policy, Terms)

## Architecture

This project follows Clean Architecture principles with three main layers:

### 1. Domain Layer
- Entities: Core business objects
- Repository Interfaces: Abstract data contracts

### 2. Data Layer
- Models: Data transfer objects with JSON serialization
- Repository Implementations: Concrete data access
- Data Sources: API and local storage

### 3. Presentation Layer
- Pages: Screen widgets
- Widgets: Reusable UI components
- BLoC: State management (ready for implementation)

## Project Structure

```
lib/
├── core/
│   ├── constants/      # App-wide constants
│   ├── network/        # API client with Dio
│   ├── theme/          # Dark theme configuration
│   └── di/             # Dependency injection
├── features/
│   ├── home/           # Home screen feature
│   ├── tools/          # Tools screen feature
│   └── settings/       # Settings screen feature
└── main.dart           # App entry point
```

## API Integration

The app is configured with:
- Dio HTTP client with interceptors
- Authorization header injection
- Pretty logging for development
- Error handling

API endpoints are defined in `lib/core/constants/app_constants.dart` and ready for backend integration.

## Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
```bash
git clone https://github.com/swatantra1singh/galaxyai.git
cd galaxyai
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Building

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## Dependencies

Key packages used:
- `flutter_bloc` - State management
- `dio` - HTTP client
- `get_it` - Dependency injection
- `shared_preferences` - Local storage
- `equatable` - Value equality
- `json_annotation` - JSON serialization

## Design

The app features:
- Dark theme with purple accents (#7C4DFF)
- Material Design 3
- Gradient backgrounds
- Rounded corners and cards
- Bottom navigation
- Custom color scheme

## Future Enhancements

- Complete BLoC implementation for state management
- API integration with backend
- User authentication
- Tool detail pages
- Search functionality
- Image/Video generation screens
- User profile and favorites persistence
- Push notifications

## License

This project is licensed under the MIT License.

## Author

Swatantra Singh
