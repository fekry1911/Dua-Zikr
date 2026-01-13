# 🌙 Dua & Zikr (Moqaf)

An all-in-one Islamic application designed to help Muslims in their daily lives. Features include Prayer Times, Athkar (Dua), Azan notifications, and more, built with Flutter.

![App Log](assets/images/logo.png) <!-- Replace with actual logo path if available -->

## ✨ Features

- **📍 Accurate Prayer Times**: Calculates prayer times based on your current location using `geolocator`.
- **🔔 Smart Notifications**: 
  - Get notified for every prayer with Azan sound.
  - "Pray on the Prophet" reminders every minute (configurable).
  - Background service support using `workmanager`.
- **📖 Athkar & Dua**: A rich collection of daily Athkar and Dua from the Sunnah.
- **❤️ Favorites**: Save your favorite Duas for quick access (using Hive/SharedPrefs).
- **🎨 Modern UI**: Beautiful and responsive design:
  - Supports Arabic locale (RTL).
  - Responsive layout with `flutter_screenutil`.
  - Smooth animations with `flutter_animate` and `lottie`.
- **🛠️ Offline Support**: Caching supported via `dio_cache_interceptor` and `hive`.

## 🛠️ Tech Stack

- **Framework**: Flutter
- **State Management**: `flutter_bloc` (Cubits)
- **Dependency Injection**: `get_it`
- **Networking**: `dio`
- **Local Storage**: `hive`, `shared_preferences`
- **Notifications**: `flutter_local_notifications`
- **Background Tasks**: `workmanager`
- **Location**: `geolocator`
- **Design**: `google_fonts`, `flutter_svg`, `skeletonizer`

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.8.1 or higher)
- Android Studio / VS Code
- Android Device/Emulator (iOS support included but check permissions)

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/dua_zekr.git
    cd dua_zekr
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the app:**
    ```bash
    flutter run
    ```

## ⚙️ Configuration

### Android Permissions
The app requires the following permissions (already added in `AndroidManifest.xml`):
- `ACCESS_FINE_LOCATION` / `ACCESS_COARSE_LOCATION` (For Prayer Times)
- `POST_NOTIFICATIONS` (For Azan & Reminders)
- `SCHEDULE_EXACT_ALARM` (For precise prayer timing)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1.  Fork the project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
