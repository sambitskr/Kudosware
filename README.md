
# Submission for Kudosware's Internship Task

This Flutter application integrates with Firebase to provide user authentication and Cloud Firestore for data storage. The app includes a Teacher account feature, where teachers can store and manage students' data. The application supports email-based user signup, login, and verification. It also includes a user-friendly interface with light and dark mode options, and it ensures real-time updates of the students' data.

## Features

### Authentication
- Signup: Users can sign up using their email ID and password.
- Email Verification: After signing up, users receive a verification link to their email ID for verification.
- Login: Verified users can log in using their email ID and password.
- Sign Out: Users can sign out of the application.
### Teacher Account
- Data Storage: Teachers can store multiple students' data in Cloud Firestore. The data includes:
    - Name of the student
    - Date of Birth (selected from a calendar)
    - Gender (chosen from a dropdown menu)
- Real-time Updates: The student data updates in real-time in the UI.
### User Interface
- Navigation: The app has a bottom navigation bar to switch between two pages:
    - Page 1: A form to input and store student data into Firestore.
    - Page 2: A list to display all the students' data stored in Firestore.
- Dark Mode/Light Mode: The app supports both dark and light modes.

## Getting Started
### Prerequisites
- Flutter installed on your machine
- A Firebase project set up with Firestore and Authentication enabled
### Installation
1. Clone the repository:

   ```bash
   git clone https://github.com/sambitskr/Kudosware.git
   cd flutter-firebase-app
2. Set up Firebase
- Create a new Firebase project in the Firebase Console.
- Add an Android/iOS app to your Firebase project and follow the instructions to download the google-services.json (for Android) or GoogleService-Info.plist (for iOS).
- Place the google-services.json file in the android/app directory.
- Place the GoogleService-Info.plist file in the ios/Runner directory.
3. Configure Firebase in Flutter
- Ensure that your android/build.gradle and android/app/build.gradle files are set up according to the Firebase setup instructions.
- Ensure that your ios/Runner/Info.plist is configured according to the Firebase setup instructions.
## Project Structure
```bash 
lib/
│
├── main.dart                # Entry point of the application
├── authentication/          # Contains all authentication-related files
│   ├── login.dart           # Login page
│   ├── signup.dart          # Signup page
│   └── verify_email.dart    # Email verification page
│
├── teacher/                 # Contains teacher-specific features
│   ├── student_form.dart    # Page 1: Form to input student data
│   └── student_list.dart    # Page 2: List of student data
│
├── models/                  # Contains data models
│   └── student.dart         # Student model
│
├── services/                # Contains services for Firebase interaction
│   ├── auth_service.dart    # Authentication service
│   └── firestore_service.dart # Firestore service
│
└── utils/                   # Utility files and helpers
    ├── theme.dart           # Dark mode/Light mode theme
    └── constants.dart       # Constants used across the app
```


## Additional Information
### Dark Mode/Light Mode
The app includes a toggle for switching between dark and light modes, providing a better user experience.

### Real-time Updates
The student data displayed in the app updates in real-time using Firestore's snapshot listeners.
## Contact
For any queries or further assistance, please contact skrsambit@gmail.com
