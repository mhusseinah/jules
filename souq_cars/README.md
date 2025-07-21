# Souq Cars

A Flutter-based mobile application that is a clone of the "Souq Cars" app.

## Features

- User login/signup
- Car listings (add, edit, delete)
- Search filters (brand, model, year, price, etc.)
- Chat between buyer and seller
- Favorite cars
- Location-based search
- Multilingual support (English and Arabic)

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Flutter SDK: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
- A code editor like Android Studio or Visual Studio Code with the Flutter plugin.

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/your_username_/souq_cars.git
   ```
2. Install packages
   ```sh
   flutter pub get
   ```
3. Run the app
   ```sh
   flutter run
   ```

## Backend

This project is configured to work with a Firebase backend. You will need to create a new Firebase project and configure the app to use it.

1. Go to the [Firebase console](https://console.firebase.google.com/) and create a new project.
2. Add an Android and/or iOS app to your Firebase project.
3. Follow the instructions to download the `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) files.
4. Place the `google-services.json` file in the `android/app` directory.
5. Place the `GoogleService-Info.plist` file in the `ios/Runner` directory.
6. Enable Firebase Authentication and Firestore in the Firebase console.
7. Enable Firebase Cloud Messaging and add the server key to your backend.
