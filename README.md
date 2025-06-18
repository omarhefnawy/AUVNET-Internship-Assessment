#Flutter internship Task
This Flutter project was developed by Omar Hefnawy as part of the Auvent Internship. It includes a full implementation of user authentication and a dynamic services module with Firebase integration using Clean Architecture.

Authentication
Register, Login, and Sign out functionalities using Firebase Authentication.

State management using Bloc.

Use Cases: LoginUseCase, RegisterUseCase, SignOutUseCase.

Services Management
Admin can upload services categorized into Food, Health, and Grocery.

Users can view and navigate services by category.

Data is stored in Firebase Firestore and cached locally using Hive.

Extra Features
On the login page, there's an Admin button.
No login or credentials needed — tapping it takes you directly to the upload screen.

Users can tap any service category to see the uploaded content inside.

Architecture
The project follows Clean Architecture principles:

Data Layer: Data sources (remote with Firebase, local with Hive), repositories.

Domain Layer: Use cases and entities.

Presentation Layer: Bloc and UI screens.

Features Implemented
Authentication with Firebase

Bloc structure for both Auth and Services

Upload and fetch categorized services

Local caching using Hive

Category-based dynamic navigation

Fully responsive UI

#Developer
Omar Hefnawy
