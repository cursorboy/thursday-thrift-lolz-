#!/bin/bash

# Download and extract Flutter SDK
echo "Downloading Flutter SDK..."
curl -L https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.19.1-stable.tar.xz | tar -xJ

# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Run Flutter doctor to verify installation
flutter doctor -v

# Enable web support
flutter config --enable-web

# Get dependencies
flutter pub get

# Build web app
flutter build web --release

# Print build output directory contents
echo "Build completed. Contents of build/web:"
ls -la build/web 