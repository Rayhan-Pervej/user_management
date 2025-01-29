## user_management

# Setup instruction
- Install Flutter (latest version)
- Install Dart SDK ( Java 21, Gradle 8.5) 
- Set up an Android Emulator or connect a physical device
- Clone the Repository
  ```
  git clone <repository-url>
  cd user-management-app
  ```
- Install Dependencies
  ```
  flutter pub get
  ```
- Run the App
  ```
  flutter run
  ```

# Dependencies list
 ```
  # http
  http: ^1.3.0
  
  #state management
  get: ^4.6.6
  get_storage: ^2.1.1

  # font
  google_fonts: ^6.2.1

  # icon
  iconsax: ^0.0.8

  # utils
  flutter_svg: ^2.0.6
 ```
# Features implemented
- scrollable list of users
- pull-to-refresh functionality
- loading and error states
- search functionality by name

# Screen Record of the Application

<video width="600" height="auto" controls>
  <source src="assets/screen_record/screen_record.mp4" type="video/mp4">
</video>
