# Thursday Thrift App

A Flutter app that recreates the Thursday onboarding → style quiz → swipe feed flow with basic mock data.

## Features

### User Journey 1: Walkthrough → Signup
- **3-screen walkthrough** explaining the app:
  - Welcome to Thursday
  - Weekly drops at 12pm
  - Create profile and start swiping
- **Signup form** with name and email validation
- Smooth transitions between screens

### User Journey 2: TIA (Style Quiz)
- **Chatbot-style UI** with TIA (Thrift Intelligence Assistant)
- **Style selection** from 6 options:
  - Y2K, Streetwear, Prep, Grunge, Clean Minimal, Vintage Sport
- Users can select 1-3 style preferences
- Completion screen with confirmation

### User Journey 3: Swipe Feed
- **Tinder-style swipeable card stack** with 10 mocked items
- Each card displays:
  - Item image (with loading states)
  - Brand, title, price, and tags
- **Swipe right** to save items
- **Swipe left** to skip
- **Saved items view** with management
- **Profile view** with user info and reset option

## Technical Stack

- **Framework**: Flutter + Dart
- **State Management**: Provider
- **Local Storage**: SharedPreferences
- **Card Swiping**: flutter_card_swiper
- **Image Loading**: cached_network_image
- **Mock Data**: Local JSON-like structures

## Project Structure

```
lib/
├── main.dart                 # App entry point and routing
├── models/
│   ├── user.dart            # User data model
│   └── thrift_item.dart     # Thrift item model
├── providers/
│   └── app_state.dart       # Main app state management
├── screens/
│   ├── onboarding_screen.dart    # 3-screen walkthrough
│   ├── signup_screen.dart        # User registration
│   ├── style_quiz_screen.dart    # TIA style quiz
│   └── swipe_feed_screen.dart    # Main swipe interface
├── widgets/
│   └── thrift_card.dart     # Individual item card
└── utils/
    └── mock_data.dart       # Mock data and style options
```

## Setup Instructions

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone or download the project files**

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

### Dependencies

The app uses the following key dependencies:

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1          # State management
  shared_preferences: ^2.2.2 # Local storage
  flutter_card_swiper: ^6.0.0 # Card swiping
  cached_network_image: ^3.3.0 # Image caching
```

## App Flow

1. **First Launch**: Onboarding screens → Signup → Style Quiz → Swipe Feed
2. **Subsequent Launches**: Direct to Swipe Feed (if all steps completed)
3. **Data Persistence**: User data, style preferences, and saved items are stored locally
4. **Reset Option**: Profile dialog includes app reset functionality

## Key Features

### State Management
- Centralized app state using Provider
- Persistent data storage with SharedPreferences
- Automatic navigation based on completion status

### UI/UX
- Modern, clean design with consistent styling
- Smooth animations and transitions
- Responsive layout for different screen sizes
- Loading states and error handling

### Mock Data
- 10 realistic thrift items with images from Unsplash
- 6 style categories for the quiz
- Comprehensive item details (brand, price, tags, description)

### Swipe Functionality
- Tinder-style card swiping
- Visual feedback for swipe actions
- Save/unsave item management
- Empty state handling

## Customization

### Adding New Items
Edit `lib/utils/mock_data.dart` to add more thrift items to the mock data.

### Modifying Style Options
Update the `styleOptions` list in `lib/utils/mock_data.dart`.

### Styling Changes
Modify the theme in `lib/main.dart` or individual screen styling.

## Troubleshooting

### Common Issues

1. **Flutter not found**: Ensure Flutter is installed and in your PATH
2. **Dependencies issues**: Run `flutter clean` then `flutter pub get`
3. **Image loading**: Check internet connection for Unsplash images
4. **Build errors**: Ensure you're using Flutter 3.0.0+ and Dart 2.17.0+

### Platform Support
- **iOS**: iOS 11.0 or higher
- **Android**: API level 21 or higher
- **Web**: Supported (with some limitations for swipe gestures)

## Future Enhancements

- Backend integration for real data
- User authentication
- Push notifications for Thursday drops
- Social features (sharing, following)
- Advanced filtering and search
- Payment integration
- AR try-on features

## License

This project is for educational/demonstration purposes. 