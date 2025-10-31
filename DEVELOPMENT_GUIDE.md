# Development Guide

## Project Setup

### Prerequisites
```bash
# Check Flutter installation
flutter --version

# Should be >= 3.0.0
```

### Initial Setup
```bash
# Clone repository
git clone https://github.com/swatantra1singh/galaxyai.git
cd galaxyai

# Install dependencies
flutter pub get

# Run code generation (if needed)
flutter pub run build_runner build --delete-conflicting-outputs
```

## Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   └── app_constants.dart         # App-wide constants
│   ├── network/
│   │   ├── dio_client.dart            # HTTP client setup
│   │   └── auth_interceptor.dart      # Auth token injection
│   ├── theme/
│   │   └── app_theme.dart             # Dark theme config
│   ├── di/                            # Dependency injection (future)
│   └── utils/                         # Utility functions (future)
├── features/
│   ├── home/
│   │   ├── data/
│   │   │   ├── models/                # JSON models
│   │   │   ├── repositories/          # Repository implementations
│   │   │   └── datasources/           # API & local data sources
│   │   ├── domain/
│   │   │   ├── entities/              # Business objects
│   │   │   ├── repositories/          # Repository interfaces
│   │   │   └── usecases/              # Business logic
│   │   └── presentation/
│   │       ├── pages/                 # Screen widgets
│   │       ├── widgets/               # Reusable widgets
│   │       └── bloc/                  # State management
│   ├── tools/                         # Same structure as home
│   └── settings/                      # Same structure as home
└── main.dart                          # App entry point
```

## Clean Architecture Principles

### 1. Domain Layer (Business Logic)
- Contains pure Dart code (no Flutter dependencies)
- Defines entities and use cases
- Repository interfaces (contracts)

Example:
```dart
// Entity
class Tool extends Equatable {
  final String id;
  final String name;
  // ...
}

// Repository Interface
abstract class ToolRepository {
  Future<List<Tool>> getPopularTools();
}
```

### 2. Data Layer (Data Access)
- Implements repository interfaces
- Contains models (with JSON serialization)
- Data sources (API, local storage)

Example:
```dart
// Model
@JsonSerializable()
class ToolModel {
  final String id;
  final String name;
  
  Tool toEntity() => Tool(id: id, name: name);
}

// Repository Implementation
class ToolRepositoryImpl implements ToolRepository {
  @override
  Future<List<Tool>> getPopularTools() async {
    final response = await dioClient.get('/tools/popular');
    // Convert and return
  }
}
```

### 3. Presentation Layer (UI)
- Flutter widgets and screens
- BLoC for state management
- Depends on domain layer only

Example:
```dart
// BLoC
class ToolBloc extends Bloc<ToolEvent, ToolState> {
  final GetPopularToolsUseCase getPopularTools;
  
  @override
  Stream<ToolState> mapEventToState(ToolEvent event) async* {
    // Handle events and emit states
  }
}

// Widget
class ToolsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToolBloc, ToolState>(
      builder: (context, state) {
        // Build UI based on state
      },
    );
  }
}
```

## Adding a New Feature

### Step 1: Create Feature Structure
```bash
mkdir -p lib/features/new_feature/{data/{models,repositories,datasources},domain/{entities,repositories,usecases},presentation/{pages,widgets,bloc}}
```

### Step 2: Define Domain Layer
```dart
// 1. Create entity
class NewEntity extends Equatable {
  // Define properties
}

// 2. Create repository interface
abstract class NewRepository {
  Future<NewEntity> getData();
}

// 3. Create use case
class GetDataUseCase {
  final NewRepository repository;
  
  Future<NewEntity> call() => repository.getData();
}
```

### Step 3: Implement Data Layer
```dart
// 1. Create model
@JsonSerializable()
class NewModel {
  // Define JSON fields
  
  NewEntity toEntity() {
    // Convert to entity
  }
}

// 2. Implement repository
class NewRepositoryImpl implements NewRepository {
  final DioClient dioClient;
  
  @override
  Future<NewEntity> getData() async {
    final response = await dioClient.get('/endpoint');
    final model = NewModel.fromJson(response.data);
    return model.toEntity();
  }
}
```

### Step 4: Create Presentation Layer
```dart
// 1. Define events
abstract class NewEvent extends Equatable {}
class LoadData extends NewEvent {}

// 2. Define states
abstract class NewState extends Equatable {}
class DataLoaded extends NewState {
  final NewEntity data;
}

// 3. Create BLoC
class NewBloc extends Bloc<NewEvent, NewState> {
  final GetDataUseCase useCase;
  
  @override
  Stream<NewState> mapEventToState(NewEvent event) async* {
    if (event is LoadData) {
      final data = await useCase();
      yield DataLoaded(data);
    }
  }
}

// 4. Create page
class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewBloc(useCase: getIt())..add(LoadData()),
      child: NewPageView(),
    );
  }
}
```

## API Integration

### Configure Base URL
Edit `lib/core/constants/app_constants.dart`:
```dart
class ApiConstants {
  static const String baseUrl = 'https://your-api.com/v1';
}
```

### Add New Endpoint
```dart
// In ApiConstants class
static const String newEndpoint = '/new-endpoint';
```

### Make API Call
```dart
// In repository
Future<Response> getData() async {
  return await dioClient.get(
    ApiConstants.newEndpoint,
    queryParameters: {'key': 'value'},
  );
}
```

### Handle Authentication
Token is automatically injected by `AuthInterceptor`:
```dart
// Save token
final prefs = await SharedPreferences.getInstance();
await prefs.setString(AppConstants.tokenKey, 'your-token');

// Token will be automatically added to all requests
```

## State Management with BLoC

### Current Implementation
The app structure is ready for BLoC but uses StatefulWidget for simple state.

### Migrating to BLoC

1. **Create events**:
```dart
abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadPopularTools extends HomeEvent {}
class LoadLibraries extends HomeEvent {}
```

2. **Create states**:
```dart
abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final List<Tool> tools;
  final List<LibraryItem> libraries;
  
  @override
  List<Object> get props => [tools, libraries];
}
```

3. **Create BLoC**:
```dart
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadPopularTools>(_onLoadPopularTools);
  }
  
  Future<void> _onLoadPopularTools(
    LoadPopularTools event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      final tools = await getPopularToolsUseCase();
      emit(HomeLoaded(tools: tools, libraries: []));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
```

4. **Use in Widget**:
```dart
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(LoadPopularTools()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return CircularProgressIndicator();
          }
          if (state is HomeLoaded) {
            return _buildContent(state.tools);
          }
          return Container();
        },
      ),
    );
  }
}
```

## Testing

### Unit Tests
```dart
// test/domain/usecases/get_popular_tools_test.dart
void main() {
  late GetPopularToolsUseCase useCase;
  late MockToolRepository mockRepository;
  
  setUp(() {
    mockRepository = MockToolRepository();
    useCase = GetPopularToolsUseCase(mockRepository);
  });
  
  test('should return list of tools', () async {
    // Arrange
    final tools = [Tool(id: '1', name: 'Test')];
    when(() => mockRepository.getPopularTools())
        .thenAnswer((_) async => tools);
    
    // Act
    final result = await useCase();
    
    // Assert
    expect(result, tools);
  });
}
```

### Widget Tests
```dart
// test/presentation/pages/home_page_test.dart
void main() {
  testWidgets('should display welcome card', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: HomePage()),
    );
    
    expect(find.text('Welcome To Galaxy.ai'), findsOneWidget);
  });
}
```

## Running the App

### Development
```bash
# Run on device/emulator
flutter run

# Run with hot reload
flutter run --hot

# Run on specific device
flutter devices
flutter run -d <device-id>
```

### Building

#### Android
```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# App Bundle for Play Store
flutter build appbundle --release
```

#### iOS
```bash
# Debug
flutter build ios --debug

# Release
flutter build ios --release
```

### Debugging
```bash
# Run with logs
flutter run --verbose

# Flutter inspector
flutter run --observatory-port=8888

# Analyze code
flutter analyze

# Run tests
flutter test
```

## Code Generation

### JSON Serialization
After adding/modifying `@JsonSerializable` models:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Dependency Injection (when using Injectable)
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Common Issues & Solutions

### Issue: Gradle build fails
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run
```

### Issue: CocoaPods errors (iOS)
```bash
cd ios
pod deintegrate
pod cache clean --all
pod install
cd ..
flutter run
```

### Issue: Hot reload not working
```bash
flutter clean
flutter pub get
flutter run
```

## Best Practices

1. **Always use const constructors** when possible
2. **Extract widgets** when they get too large
3. **Use meaningful names** for variables and functions
4. **Add documentation** to public APIs
5. **Write tests** for critical business logic
6. **Use BLoC** for complex state management
7. **Keep presentation logic** separate from business logic
8. **Handle errors** gracefully with try-catch
9. **Use Equatable** for value equality in entities and events
10. **Follow Flutter linting rules** defined in analysis_options.yaml

## Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [BLoC Library](https://bloclibrary.dev)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Dio Documentation](https://pub.dev/packages/dio)
- [Get It Documentation](https://pub.dev/packages/get_it)
