![Screenshot 2023-06-24 181530](https://github.com/TahaMohamed1993/ChallengeBayanatz/assets/91631512/5229dbae-3601-4bc6-8782-54286f6f399f)
![Uploading Screenshot 2023-06-24 152130.png…]()
![Uploading Screenshot 2023-06-24 141542.png…]()
![Uploading Screenshot 2023-06-24 141059.png…]()
![Screenshot 2023-06-24 135158](https://github.com/TahaMohamed1993/ChallengeBayanatz/assets/91631512/5af42786-d86a-4a41-99c5-82ea2b68d5de)
![Uploading Screenshot 2023-06-24 134925.png…]()
![Uploading Screenshot 2023-06-24 134249.png…]()
# Challenge Bayanatz App

Challenge Bayanatz App is a Flutter application that demonstrates the implementation of Firebase authentication and Cloud Messaging for sending push notifications. The app includes features such as user login, new user registration, and a main page with a clothing gallery displayed in a grid view.

## Features

- User login: Users can log in using their Firebase credentials.
- New user registration: New users can create an account by providing their email and password.
- Logout: Users can log out from their account.
- Clothing gallery: The main page displays a grid view of clothing items.
- Push notifications: Users receive notifications for promotions, discounts, and reminders.

## Screenshots
![Uploading Screenshot 2023-06-24 133823.png…]()
![Uploading Screenshot 2023-06-24 181713.png…]()


## Getting Started

To get started with this project, follow these steps:

1. Clone the repository: `git clone <repository_url>`
2. Install the dependencies: `flutter pub get`
3. Configure Firebase:
   - Create a new Firebase project
   - Enable Firebase Authentication and set up the necessary providers (e.g., email/password)
   - Enable Firebase Cloud Messaging
4. Update Firebase configuration:
   - Android: Update the `google-services.json` file in the `android/app` directory with your Firebase project credentials
   - iOS: Update the `GoogleService-Info.plist` file in the `ios/Runner` directory with your Firebase project credentials
5. Run the app: `flutter run`

## Dependencies

Include a list of the main dependencies used in the project. For example:

- firebase_core: ^2.9.0
- firebase_auth: ^4.2.2
  firebase_messaging: ^14.6.3
- provider: ^6.0.0
-   flutter_launcher_icons: ^0.13.1


## Directory Structure

Explain the structure of your project's directories and files. You can use the following example:

- `lib/`: Contains the main application code
  - `screens/`: Contains the screen widgets for login, registration, and main page
  - `models/`: Contains the data models used in the application
  - `services/`: Contains the Firebase authentication and messaging services
  - `utils/`: Utility functions and classes
  - `main.dart`: The entry point of the application

## Contributing

If you would like to contribute to this project, feel free to submit a pull request. Contributions are always welcome!

