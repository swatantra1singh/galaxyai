# GalaxyAI

A basic Flutter application for GalaxyAI.

## Getting Started

This is a Flutter project that provides a simple counter app as a starting point.

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (included with Flutter)
- An IDE with Flutter support (VS Code, Android Studio, or IntelliJ)

### Installation

1. Install Flutter by following the official guide: https://flutter.dev/docs/get-started/install

2. Clone this repository:
   ```bash
   git clone https://github.com/swatantra1singh/galaxyai.git
   cd galaxyai
   ```

3. Get the dependencies:
   ```bash
   flutter pub get
   ```

### Running the App

#### For Web
```bash
flutter run -d chrome
```

#### For Android
```bash
flutter run -d android
```

#### For iOS (macOS only)
```bash
flutter run -d ios
```

### Building the App

#### For Web
```bash
flutter build web
```

#### For Android
```bash
flutter build apk
```

#### For iOS (macOS only)
```bash
flutter build ios
```

### Running Tests

```bash
flutter test
```

### Project Structure

```
galaxyai/
├── lib/
│   └── main.dart          # Main application entry point
├── test/
│   └── widget_test.dart   # Widget tests
├── android/               # Android-specific files
├── ios/                   # iOS-specific files
├── web/                   # Web-specific files
├── pubspec.yaml          # Project dependencies
└── analysis_options.yaml # Dart analyzer configuration
```

## Features

- Material Design UI
- Counter functionality
- Cross-platform support (Android, iOS, Web)
- Widget testing setup

## Learn More

To learn more about Flutter development, check out the [official documentation](https://flutter.dev/docs).
