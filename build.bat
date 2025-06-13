@echo off

REM Navigate to the Flutter project directory
cd "thursday thrift project"

REM Clean any previous builds
flutter clean

REM Get dependencies
flutter pub get

REM Build for web
flutter build web --release

echo Build completed successfully!
pause 