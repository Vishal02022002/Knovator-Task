# Knovator-Task

# Flutter Posts List App

## Architectural Choices

- **Separation of Concerns:**  
  Code is split into `models` (data types), `services` (API/network logic), and `screens` (UI components), helping keep the app maintainable and scaleable.
- **Async Programming:**  
  Uses Dart's `FutureBuilder` widget to fetch and display remote data asynchronously, providing smooth and responsive UI updates.
- **UI/State Management:**  
  Core screens use `StatefulWidget` for dynamic content. Navigation and UI updates are coordinated via direct Flutter navigation without additional packages.

## Third-Party Libraries

- [`http`](https://pub.dev/packages/http):  
  Used to make REST API requests.

## How to Run the Application

1. **Clone the Repository**
    ```
    git clone <your-repo-url>
    cd <project-directory>
    ```

2. **Get Dependencies**
    ```
    flutter pub get
    ```

3. **Run the App**
    ```
    flutter run
    ```
    - To run on the web:
      ```
      flutter run -d chrome
      ```
    - For Android/iOS, make sure a device or emulator is active.

4. **Android Device Specific**
    If running on Android, confirm you have this line in `android/app/src/main/AndroidManifest.xml`:
    ```
    <uses-permission android:name="android.permission.INTERNET"/>
    ```

## Extras

- Demo API: `https://jsonplaceholder.typicode.com/posts`
- The app will fetch, display, and navigate to detailed post screens.


