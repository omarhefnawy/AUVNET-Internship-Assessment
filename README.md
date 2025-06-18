## AUVNET Flutter Task
This Flutter app was developed by Omar Hefnawy as part of the AUVNET internship task.
It includes authentication, service management, local caching, and follows Clean Architecture principles.

## Authentication
Register, login, and sign out using Firebase Authentication

State management with Bloc

Use Cases:

LoginUseCase

RegisterUseCase

SignOutUseCase

## Services Management
Admin can upload services categorized into:

Food

Health & Wellness

Groceries

Users can view and navigate services by category

Data is stored in Firebase Firestore and cached locally using Hive

## Extra Features
Admin button on the login screen:
No login or credentials needed. Tapping it goes directly to the upload page.

Users can tap any service category to view the uploaded content.

## Architecture
The app follows Clean Architecture:

Data Layer: Firebase and Hive data sources, repositories

Domain Layer: Entities and use cases

Presentation Layer: Bloc and UI

Features Implemented
Firebase Authentication

Bloc for Auth and Services

Upload and view services by category

Local caching with Hive

Responsive UI

Clean Architecture structure

## Developer
Omar Hefnawy
