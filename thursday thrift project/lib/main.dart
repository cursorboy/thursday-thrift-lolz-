import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/app_state.dart';
import 'screens/onboarding_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/style_quiz_screen.dart';
import 'screens/swipe_feed_screen.dart';
import 'utils/dotted_background.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DottedBackground(
      dotColor: const Color(0xFFCCCCCC),
      dotSize: 1.2,
      spacing: 16.0,
      child: ChangeNotifierProvider(
        create: (context) => AppState(),
        child: MaterialApp(
          title: 'Thursday Thrift',
          theme: ThemeData(
            primarySwatch: Colors.grey,
            fontFamily: 'Arial',
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
            ),
            textTheme: TextTheme(
              displayLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
              displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
              displaySmall: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
              bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
              bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
            ),
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(
              secondary: Colors.red,
              primary: Colors.black,
              background: Colors.white,
            ),
          ),
          home: AppRouter(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

class AppRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        // Show onboarding if not completed
        if (!appState.hasCompletedOnboarding) {
          return OnboardingScreen();
        }
        
        // Show signup if onboarding completed but no user
        if (appState.user == null) {
          return SignupScreen();
        }
        
        // Show style quiz if user exists but quiz not completed
        if (!appState.hasCompletedStyleQuiz) {
          return StyleQuizScreen();
        }
        
        // Show swipe feed if everything is completed
        return SwipeFeedScreen();
      },
    );
  }
} 