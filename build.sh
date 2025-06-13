#!/bin/bash

# Navigate to the Flutter project directory
cd "thursday thrift project"

# Clean any previous builds
flutter clean

# Get dependencies
flutter pub get

# Build for web
flutter build web --release

echo "Build completed successfully!" 