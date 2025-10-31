# Quick Reference Card

## 🚀 Getting Started

```bash
# 1. Install Flutter SDK
flutter doctor

# 2. Clone & Setup
git clone https://github.com/swatantra1singh/galaxyai.git
cd galaxyai
flutter pub get

# 3. Run
flutter run
```

## 📂 Key Files

| File | Purpose |
|------|---------|
| `lib/main.dart` | App entry point with navigation |
| `lib/core/theme/app_theme.dart` | Dark theme configuration |
| `lib/core/network/dio_client.dart` | HTTP client setup |
| `lib/core/constants/app_constants.dart` | API endpoints & strings |
| `lib/features/home/presentation/pages/home_page.dart` | Home screen |
| `lib/features/tools/presentation/pages/tools_page.dart` | Tools screen |
| `lib/features/settings/presentation/pages/settings_page.dart` | Settings |

## 🎨 Theme Colors

```dart
Primary Purple:    #7C4DFF
Accent Purple:     #9D4EDD
Dark Background:   #1A1A2E
Card Background:   #16213E
Text Primary:      #FFFFFF
Text Secondary:    #B0B0B0
```

## 🌐 API Endpoints

Base URL: `https://api.galaxyai.com/v1`

| Endpoint | Purpose |
|----------|---------|
| `/tools` | Get all tools |
| `/tools/popular` | Popular tools |
| `/tools/trending` | Trending tools |
| `/tools/category` | Tools by category |
| `/user/recent` | Recent tools |
| `/user/favorites` | Favorite tools |

## 🏗️ Architecture Layers

```
Presentation (UI)
    ↓
Domain (Business Logic)
    ↓
Data (API/Storage)
```

## 📱 Screens

1. **Home** - Welcome card, popular tools, libraries, recent/favorites
2. **Tools** - Grid of AI tools with category filters
3. **Settings** - Account, preferences, support

## 🔑 Key Features

- ✅ Dark theme with purple accents
- ✅ Bottom navigation
- ✅ Clean architecture
- ✅ Dio HTTP client with auth interceptor
- ✅ Category filtering
- ✅ Favorite toggle
- ✅ Trending badges
- ✅ Gradient backgrounds

## 🛠️ Common Commands

```bash
# Format code
dart format .

# Analyze code
flutter analyze

# Build for Android
flutter build apk --release

# Build for iOS
flutter build ios --release

# Clean build
flutter clean
flutter pub get
```

## 📚 Documentation

- `README.md` - Project overview
- `APP_OVERVIEW.md` - Feature details
- `DEVELOPMENT_GUIDE.md` - Architecture & setup
- `UI_MOCKUPS.md` - Design specifications
- `IMPLEMENTATION_SUMMARY.md` - Complete status

## 🔗 Important Links

- Repository: https://github.com/swatantra1singh/galaxyai
- Flutter Docs: https://flutter.dev/docs
- Dio Docs: https://pub.dev/packages/dio
- BLoC Library: https://bloclibrary.dev

## 💡 Next Steps

1. Connect to real API backend
2. Implement BLoC state management
3. Add tool detail screens
4. Implement image/video generation screens
5. Add user authentication
6. Enable push notifications

---

**Status**: ✅ Ready for Development
**Last Updated**: 2025-10-31
