import '../../domain/entities/user_entity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final UserEntity user;

  LoginSuccess(this.user);
}

class SignUpSuccess extends AuthState {}

class LogoutSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}
