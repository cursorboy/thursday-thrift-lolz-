#!/bin/bash

# Configure Git to trust the directory
git config --global --add safe.directory "*"

# Create flutter directory
export FLUTTER_HOME="/vercel/flutter"
mkdir -p $FLUTTER_HOME

# Download and extract Flutter SDK
echo "Downloading Flutter SDK..."
curl -L https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.19.1-stable.tar.xz | tar -xJ -C /vercel

# Add Flutter to PATH
export PATH="$PATH:$FLUTTER_HOME/bin"

# Set proper ownership and permissions
chown -R $(whoami) $FLUTTER_HOME
chmod -R u+w $FLUTTER_HOME

# Configure Flutter to run without superuser
export FLUTTER_ROOT=$FLUTTER_HOME
export PUB_CACHE="/vercel/.pub-cache"
mkdir -p $PUB_CACHE
export HOME="/vercel"

# Print current directory for debugging
pwd
ls -la

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