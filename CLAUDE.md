# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal study repository for learning mobile development with Dart and Flutter. The repository contains learning materials, practice projects, and personal projects organized by topic and complexity.

## Repository Structure

```
study/
├── mobile/
│   ├── dart/           # Dart language fundamentals
│   │   ├── 00_intro/
│   │   ├── 01_variable/
│   │   ├── 02_data_types/
│   │   ├── 03_function/
│   │   ├── 04_class/
│   │   └── archive/
│   │
│   └── flutter/        # Flutter development
│       ├── 00_intro/   # Initial Flutter introduction
│       ├── a00_intro/  # Basic app intro
│       ├── a01_click_game/
│       ├── apple_coding/    # Tutorials from Apple Coding
│       ├── normard/         # Tutorials from Nomad Coders
│       ├── practice/        # Practice exercises
│       └── project/         # Personal projects
│           ├── stop_watch/
│           └── freedom_timer/  # Main active project
```

## Development Commands

### Flutter Projects

Navigate to the specific Flutter project directory first, then:

```bash
# Install dependencies
flutter pub get

# Run the app (debug mode)
flutter run

# Run on specific device
flutter run -d <device_id>
flutter run -d windows     # For Windows desktop
flutter run -d chrome      # For web

# Build for specific platforms
flutter build apk          # Android APK
flutter build ios          # iOS
flutter build windows      # Windows desktop

# Generate launcher icons (after modifying icon in pubspec.yaml)
dart run flutter_launcher_icons

# Clean build artifacts
flutter clean

# Analyze code
flutter analyze

# Run tests
flutter test
```

### Dart Scripts

```bash
# Run a Dart file directly
dart run <file_path.dart>

# Example:
dart run mobile/dart/01_variable/a01_variable.dart
```

## Architecture & Patterns

### Flutter Project Structure (freedom_timer example)

The main project `freedom_timer` follows a feature-based architecture:

```
lib/
├── main.dart                 # App entry point
├── routes/                   # Navigation configuration
│   ├── app_router.dart      # GoRouter setup with ShellRoute
│   └── app_routes.dart      # Route constants
├── screens/                  # Full-page screens
├── widgets/                  # Reusable UI components
├── theme/                    # Centralized theming
│   ├── app_theme.dart       # ThemeData configuration
│   ├── app_colors.dart      # Color constants
│   ├── app_text_styles.dart # Typography
│   └── app_constants.dart   # Other constants
├── services/                 # Business logic & external services
│   ├── storage_service.dart # SharedPreferences wrapper
│   └── api/                 # API integration
│       ├── base_api_service.dart
│       ├── auth_api_service.dart
│       └── kakao_auth_service.dart
├── core/                     # Core business models
│   ├── work_config.dart     # Singleton pattern for app config
│   └── work_status.dart     # Enums and core types
├── models/                   # Data models
├── utils/                    # Utility functions
└── common/                   # Shared components
    └── footer_navigation.dart
```

### Key Architectural Patterns

1. **Routing**: Uses `go_router` package with `ShellRoute` for persistent bottom navigation
   - Routes defined in `routes/app_routes.dart` as constants
   - Router configuration in `routes/app_router.dart`

2. **State Management**: Currently uses StatefulWidget with setState
   - Singleton pattern for global config (`WorkConfig.instance`)
   - SharedPreferences for persistent storage

3. **Theming**: Centralized theme system
   - Global theme applied in MaterialApp
   - Custom colors, text styles, and constants separated into dedicated files
   - Uses custom font family "Jua"

4. **Services Layer**:
   - `StorageService`: Generic wrapper around SharedPreferences
   - API services extend `BaseApiService` for consistent HTTP handling
   - Uses `dio` package for HTTP requests

5. **Singleton Pattern**: Used for app-wide configuration
   ```dart
   static final WorkConfig instance = WorkConfig();
   ```

### Common Dependencies

- `go_router`: Declarative routing
- `shared_preferences`: Local storage
- `dio`: HTTP client
- `lottie`: Animations
- `kakao_flutter_sdk`: Kakao login integration
- `webview_flutter`: WebView support

## Project Naming Conventions

- Projects prefixed with `a00_`, `a01_`, etc. are sequential learning exercises
- `normard/` folder contains projects following Nomad Coders tutorials
- `apple_coding/` folder contains projects following Apple Coding tutorials
- `practice/` folder contains self-directed practice
- `project/` folder contains personal projects

## Important Notes

1. **Git Commits**: Commit messages follow the Conventional Commit format below.

### Commit Message Format

```
[ type emoji ] project-name : 커밋 내용
```

**Type & Emoji table:**

| Type | Emoji | 설명 |
|------|-------|------|
| feat | ✨ | 새로운 기능 구현 |
| fix | 🐛 | 버그 수정 |
| docs | 📝 | 문서 업데이트 |
| style | 💄 | 스타일 수정 (UI, CSS 등) |
| refactor | ♻️ | 코드 리팩토링 |
| test | ✅ | 테스트 추가 |
| chore | 🔧 | 패키지 업데이트, 설정 등 |
| perf | ⚡️ | 성능 최적화 |
| revert | ⏪ | 이전 커밋 되돌리기 |
| build | 🏗️ | 빌드 설정 변경 |
| ci | 👷 | CI/CD 설정 추가 |

**예시:**
```
[ feat ✨ ] first-react : 투두 리스트 구현
[ fix 🐛 ] freedom_timer : 타이머 초기화 오류 수정
[ chore 🔧 ] first-react : react-icons 패키지 추가
[ style 💄 ] first-react : 전역 스타일 수정
[ docs 📝 ] first-react : 커밋 로그 파일 추가
```

여러 파일 변경 시 타입별로 커밋을 분리한다.

2. **Config Files**:
   - `secrets.dart` files contain API keys (gitignored)
   - Always check for config/secrets when working with projects that need API keys

3. **Assets**: Flutter projects use assets for:
   - Lottie animations (`assets/animations/`)
   - Images (`assets/images/`)
   - Custom fonts (`assets/fonts/`)

4. **Korean Language**: Comments and some UI text are in Korean

5. **Active Development**: The `freedom_timer` project is the main active project with authentication, routing, theming, and API integration

## When Adding New Features

1. Follow the existing feature-based folder structure
2. Add new screens to `screens/`
3. Extract reusable components to `widgets/`
4. Add routes to `routes/app_routes.dart` and configure in `app_router.dart`
5. Use the centralized theme system for styling
6. Wrap external services in service classes under `services/`
