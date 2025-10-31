# Galaxy AI Platform - Application Overview

## Application Screenshots & Features

### 1. Home Screen (Hub)

The home screen features:

#### Top Section
- **App Bar**: Galaxy.ai branding with logo and notifications icon
- **Welcome Card**: Purple gradient card with:
  - Title: "Welcome To Galaxy.ai"
  - Description: "Discover 2113 powerful AI tools to enhance your productivity"
  - "Explore Tools" button

#### Popular Tools Section
- Horizontal scrollable list of popular AI tools
- Circular icons with gradient backgrounds:
  - AI Image Generator (Blue gradient)
  - AI Video Generator (Orange gradient)
  - AI Music Generator (Pink gradient)
  - AI Voice Cloner (Purple gradient)
  - AI Icon Generator (Amber gradient)

#### Libraries Section
- Three gradient cards displayed horizontally:
  - **Image Library** (Purple gradient)
  - **Video Library** (Red-Orange gradient)
  - **Audio Library** (Teal-Blue gradient)
- Each card has an icon and arrow indicating navigation

#### Recent/Favorites Tabs
- Two tabs: "Recent" and "Favourites"
- List view of recently used tools with:
  - Tool icon with gradient background
  - Tool name and description
  - Arrow for navigation

#### Bottom Navigation
- Fixed bottom bar with three tabs:
  - Home (Active with purple indicator)
  - Tools
  - Settings

#### Floating Action Button
- Purple gradient FAB with "Message" label at bottom

---

### 2. Tools Screen

The tools screen features:

#### Top Section
- **App Bar**: Galaxy.ai branding with search icon
- **Category Filters**: Horizontal scrollable chips
  - All (selected, purple)
  - Image (with image icon)
  - Video (with video icon)
  - Text (with text icon)

#### Tools Grid
- 2-column grid layout of tool cards
- Each card contains:
  - **Gradient header** with tool icon
  - **Trending badge** (purple badge with trending icon)
  - **Star icon** for favorites (top-right)
  - **Tool name** at bottom

#### Tools Displayed
1. AI Video Generator (Trending, Favorited)
2. AI Image Generator (Trending, Favorited)
3. Text to Speech (Trending)
4. AI Voice Changer (Trending)
5. AI Voice Cloner (Trending)
6. AI Clothes Changer (Trending)

---

### 3. Settings Screen

The settings screen features:

#### Account Section
- Profile
- Subscription

#### Preferences Section
- Notifications
- Language
- Dark Mode (toggle switch - ON)

#### Support Section
- Help & Support
- Privacy Policy
- Terms of Service

#### Logout
- Red text logout option at bottom

---

## Color Scheme

### Primary Colors
- **Primary Purple**: #7C4DFF
- **Accent Purple**: #9D4EDD
- **Dark Background**: #1A1A2E
- **Card Background**: #16213E

### Text Colors
- **Primary Text**: #FFFFFF (White)
- **Secondary Text**: #B0B0B0 (Gray)

### Gradient Colors
Used throughout the app for cards, buttons, and highlights:
- Purple gradient: #7C4DFF → #9D4EDD
- Red-Orange gradient: #FF6B6B → #FF8E53
- Teal-Blue gradient: #06D6A0 → #118AB2

---

## Navigation Flow

```
Main App
├── Home Tab
│   ├── Explore Tools → Tools Screen
│   ├── Popular Tools → Tool Detail (future)
│   ├── Libraries → Library View (future)
│   └── Recent/Favorites → Tool Detail (future)
├── Tools Tab
│   ├── Category Filter
│   └── Tool Cards → Tool Detail (future)
└── Settings Tab
    ├── Account Settings
    ├── Preferences
    └── Support

```

---

## Architecture Details

### Clean Architecture Layers

#### 1. Presentation Layer
- **Pages**: Main screen widgets
  - `home_page.dart`
  - `tools_page.dart`
  - `settings_page.dart`
  
- **Widgets**: Reusable components
  - `welcome_card.dart`
  - `popular_tools_section.dart`
  - `libraries_section.dart`
  - `recent_tools_section.dart`
  - `tool_card.dart`

#### 2. Domain Layer
- **Entities**: Business objects
  - `tool.dart`
  - `library_item.dart`

#### 3. Data Layer
- **Models**: JSON serializable objects
  - `tool_model.dart`
  - `tool_model.g.dart` (generated)

#### 4. Core Layer
- **Theme**: `app_theme.dart`
- **Constants**: `app_constants.dart`
- **Network**: 
  - `dio_client.dart` (HTTP client)
  - `auth_interceptor.dart` (Authorization)

---

## API Integration Ready

The app includes complete API setup:

### Dio HTTP Client
- Base URL configuration
- Connect timeout: 30s
- Receive timeout: 30s
- JSON headers

### Auth Interceptor
- Automatic token injection from SharedPreferences
- 401 error handling
- Token refresh capability (placeholder)

### Endpoint Constants
Pre-defined endpoints:
- `/tools` - Get all tools
- `/tools/popular` - Get popular tools
- `/tools/trending` - Get trending tools
- `/tools/category` - Get tools by category
- `/user/recent` - Get recent tools
- `/user/favorites` - Get favorite tools

---

## Features Implemented

✅ Dark theme with purple accents
✅ Bottom navigation bar
✅ Home screen with welcome card
✅ Popular tools section
✅ Libraries section with gradients
✅ Recent/Favorites tabs
✅ Tools screen with category filters
✅ Tool cards with trending badges
✅ Favorite/star functionality
✅ Settings screen
✅ Clean architecture structure
✅ Dio HTTP client with interceptors
✅ Authorization handling
✅ Material Design 3

---

## Future Enhancements

### High Priority
- [ ] Tool detail screens for each AI tool
- [ ] Actual API integration with backend
- [ ] User authentication flow
- [ ] BLoC state management implementation
- [ ] Search functionality on Tools screen

### Medium Priority
- [ ] Image generation screen (with prompt input, model selection, aspect ratio)
- [ ] Video generation screen (text to video, image to video)
- [ ] Library screens (Image, Video, Audio)
- [ ] User profile screen
- [ ] Favorites persistence

### Low Priority
- [ ] Splash screen animation
- [ ] Onboarding screens
- [ ] Push notifications
- [ ] In-app purchases for premium features
- [ ] Share functionality
- [ ] Download history

---

## Development Notes

### Dependencies Used
- `flutter_bloc`: ^8.1.3 - State management
- `dio`: ^5.3.3 - HTTP client
- `get_it`: ^7.6.4 - Dependency injection
- `equatable`: ^2.0.5 - Value equality
- `json_annotation`: ^4.8.1 - JSON serialization
- `shared_preferences`: ^2.2.2 - Local storage
- `cached_network_image`: ^3.3.0 - Image caching
- `shimmer`: ^3.0.0 - Loading shimmer effect

### Project Requirements Met

✅ Clean architecture with proper layer separation
✅ Dark theme with purple accents (#7C4DFF, #9D4EDD)
✅ Bottom navigation bar with Home, Tools, Settings
✅ Dio HTTP client with interceptors
✅ Authorization header injection
✅ Endpoints structure defined
✅ Hub/Home screen matching the design
✅ Tools screen matching the design
✅ Material Design 3 components

---

## How to Run

1. Ensure Flutter SDK is installed (>=3.0.0)
2. Clone the repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app
5. For Android: `flutter build apk`
6. For iOS: `flutter build ios`

The app is ready for backend integration. Simply implement the API service layer and connect the BLoC/Cubit state management to make API calls using the pre-configured Dio client.
