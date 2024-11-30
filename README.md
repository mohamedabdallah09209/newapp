Flutter App Setup and Run Guide
This document provides instructions on setting up, running, and using my Flutter app (newapp).
 Follow the steps below to get started.

1. Prerequisites
Install Required Software
Flutter SDK:
Download and install the Flutter SDK: Flutter Installation Guide
IDE:
Use an IDE like Visual Studio Code or Android Studio.
Git:
Install Git: Git Download.
Android Emulator/Device:
Set up an emulator or connect a physical device for testing.
Check Flutter Installation
Run the following command to verify Flutter installation:

flutter doctor
Ensure all checks are passed.

2. Clone the Project
Clone the GitHub repository:
git clone https://github.com/mohamedabdallah09209/newapp
Navigate to the project directory:
cd repository
3. Project Setup
Install Dependencies
Run the following command to install all required dependencies:

flutter pub get
Setup Localization Files
Ensure the localization JSON files (en.json and ar.json) are located in the assets/lang folder.

Configure Firebase (Optional for Firebase Users)
Add google-services.json to the android/app folder.
Update the android/build.gradle and android/app/build.gradle files according to Firebase setup instructions.
4. Running the App
For Development
Run the app on a connected device or emulator:


