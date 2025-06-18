import 'package:auvent_intership/features/admin/data/data_source/local/service/servicse_local_datasource.dart';
import 'package:auvent_intership/features/admin/data/data_source/remote_dataSource/service/service_remote.dart';
import 'package:auvent_intership/features/admin/data/repo_impl/services/service_repo_impl.dart';
import 'package:auvent_intership/features/admin/domain/repo/service_repo/serviceRepo.dart';
import 'package:auvent_intership/features/admin/domain/usecases/servise_usecases/add_servise_usecase.dart';
import 'package:auvent_intership/features/admin/domain/usecases/servise_usecases/get_food_services_usecase.dart';
import 'package:auvent_intership/features/admin/domain/usecases/servise_usecases/get_grocary_service_usecase.dart';
import 'package:auvent_intership/features/admin/domain/usecases/servise_usecases/git_health_servisec_usecase.dart';
import 'package:auvent_intership/features/admin/domain/usecases/servise_usecases/git_servisec_usecase.dart';
import 'package:auvent_intership/features/admin/prsentation/bloc/service_bloc/service_bloc.dart';
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
  //////////////////////////////////////auth
  sl.registerLazySingleton<AuthDataSource>(() => FirebaseAuthDataSource(),);
  //repo
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()),);
  //login register  logout
  sl.registerLazySingleton(() => LoginUseCase(sl()),);
  sl.registerLazySingleton(() => RegisterUseCase(sl()),);
  sl.registerLazySingleton(() => SignOutUseCase(sl()),);
  sl.registerLazySingleton(() => AuthBloc(sl(), sl(), sl()),);

  /////////////////////////////////////////////service
  sl.registerLazySingleton<ServiceRemoteSource>(() => FireBaseServiceRemoteDataSource(),);
  sl.registerLazySingleton<ServiceLocalSource>(() => HiveServiceLocalSource(),);
  sl.registerLazySingleton<ServiceRepo>(() => ServiceRepoImpl(sl<ServiceRemoteSource>(), sl<ServiceLocalSource>()));
  //use cases
  sl.registerLazySingleton(() => AddServiceUseCase(sl()),);
  sl.registerLazySingleton(() => GetAllServicesUseCase(sl()),);
  sl.registerLazySingleton(() => GetFoodServicesUseCase(sl()),);
  sl.registerLazySingleton(() => GetGroceriesServicesUseCase(sl()),);
  sl.registerLazySingleton(() => GetHealthServicesUseCase(sl()),);
  sl.registerLazySingleton(() => ServiceBloc(addServiceUseCase: sl(), getAllServicesUseCase: sl(), getFoodServicesUseCase: sl(), getHealthServicesUseCase: sl(), getGroceryServicesUseCase: sl()),);

}