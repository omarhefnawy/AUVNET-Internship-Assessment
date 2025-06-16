import 'package:auvent_intership/features/auth/data/data_Sourse/auth_data_source.dart';
import 'package:auvent_intership/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:auvent_intership/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:auvent_intership/features/auth/domain/usecases/login_useCase.dart';
import 'package:auvent_intership/features/auth/domain/usecases/regester_use_case.dart';
import 'package:auvent_intership/features/auth/domain/usecases/signout_usecase.dart';
import 'package:auvent_intership/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void serviceLocator(){
  sl.registerLazySingleton<AuthDataSource>(() => FirebaseAuthDataSource(),);
  //repo
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()),);
  //login register  logout
  sl.registerLazySingleton(() => LoginUseCase(sl()),);
  sl.registerLazySingleton(() => RegisterUseCase(sl()),);
  sl.registerLazySingleton(() => SignOutUseCase(sl()),);
  sl.registerLazySingleton(() => AuthBloc(sl(), sl(), sl()),);

  //////auth end

}