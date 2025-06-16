import 'package:auvent_intership/features/auth/domain/usecases/login_useCase.dart';
import 'package:auvent_intership/features/auth/domain/usecases/regester_use_case.dart';
import 'package:auvent_intership/features/auth/domain/usecases/signout_usecase.dart';
import 'package:auvent_intership/features/auth/presentation/auth_bloc/auth_states.dart';
import 'package:auvent_intership/features/auth/presentation/auth_bloc/blocEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final SignOutUseCase signOutUseCase;

  AuthBloc(this.loginUseCase, this.registerUseCase, this.signOutUseCase)
      : super(AuthInitial()) {
    // Login
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await loginUseCase.call(event.email, event.password);
      result.fold(
            (l) => emit(AuthFailure(l.message)),
            (r) => emit(LoginSuccess(r)), // ده الصح هنا
      );
    });

    // Register
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await registerUseCase.call(event.email, event.password);
      result.fold(
            (l) => emit(AuthFailure(l.message)),
            (_) => emit(SignUpSuccess()), // هنا مش لازم نرجع user
      );
    });

    // Logout
    on<LogOutEvent>((event, emit) async {
      emit(AuthLoading());
      final result = await signOutUseCase.call();
      result.fold(
            (l) => emit(AuthFailure(l.message)),
            (_) => emit(LogoutSuccess()),
      );
    });
  }
}
