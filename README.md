# Thursday Thrift App

A Thursday thrift app clone with onboarding, style quiz, and swipe feed built with Flutter.

## Vercel Deployment

This project is configured to deploy on Vercel. The following files have been set up:

- `vercel.json` - Vercel configuration for Flutter web deployment
- `build.sh` - Build script for Unix-based systems
- `build.bat` - Build script for Windows

## Local Development

To run the project locally:

1. Navigate to the Flutter project directory:
   ```bash
   cd "thursday thrift project"
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run -d chrome
   ```

## Building for Web

To build the web version:

1. Navigate to the Flutter project directory:
   ```bash
   cd "thursday thrift project"
   ```

2. Build for web:
   ```bash
   flutter build web --release
   ```

3. The built files will be in `build/web/`

## Vercel Deployment Steps

1. Push your code to GitHub
2. Connect your repository to Vercel
3. Vercel will automatically use the `vercel.json` configuration
4. The build command will be: `cd "thursday thrift project" && flutter build web --release`
5. The output directory will be: `thursday thrift project/build/web`

## Troubleshooting

If you encounter issues:

1. Make sure Flutter is installed and in your PATH
2. Check that all dependencies are properly listed in `pubspec.yaml`
3. Verify that the build command works locally before deploying
4. Check Vercel deployment logs for specific error messages

## Project Structure

```
├── vercel.json              # Vercel deployment configuration
├── build.sh                 # Unix build script
├── build.bat                # Windows build script
├── README.md                # This file
└── thursday thrift project/ # Flutter project directory
    ├── lib/                 # Dart source code
    ├── web/                 # Web-specific files
    ├── assets/              # App assets
    └── pubspec.yaml         # Flutter dependencies
``` 