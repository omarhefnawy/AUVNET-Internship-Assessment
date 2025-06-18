
import 'package:auvent_intership/features/admin/domain/usecases/servise_usecases/get_grocary_service_usecase.dart';
import 'package:auvent_intership/features/admin/prsentation/bloc/service_bloc/serviceEvent.dart';
import 'package:auvent_intership/features/admin/prsentation/bloc/service_bloc/service_states.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/faileur.dart';
import '../../../domain/entity/service/serviceEntity.dart';
import '../../../domain/usecases/servise_usecases/add_servise_usecase.dart';
import '../../../domain/usecases/servise_usecases/get_food_services_usecase.dart';
import '../../../domain/usecases/servise_usecases/git_health_servisec_usecase.dart';
import '../../../domain/usecases/servise_usecases/git_servisec_usecase.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final AddServiceUseCase addServiceUseCase;
  final GetAllServicesUseCase getAllServicesUseCase;
  final GetFoodServicesUseCase getFoodServicesUseCase;
  final GetHealthServicesUseCase getHealthServicesUseCase;
  final GetGroceriesServicesUseCase getGroceryServicesUseCase;

  ServiceBloc({
    required this.addServiceUseCase,
    required this.getAllServicesUseCase,
    required this.getFoodServicesUseCase,
    required this.getHealthServicesUseCase,
    required this.getGroceryServicesUseCase,
  }) : super(ServiceInitial()) {
    on<AddServiceEvent>((event, emit) async {
      emit(ServiceLoading());
      final result = await addServiceUseCase(event.service);
      result.fold(
            (failure) => emit(ServiceError(failure.message)),
            (_) => emit(ServiceAddedSuccessfully()),
      );
    });
    on<GetAllServicesEvent>((event, emit) async {
      emit(ServiceLoading());
      final result = await getAllServicesUseCase();
      _handleResult(result, emit);
    });
    on<GetFoodServicesEvent>((event, emit) async {
      emit(ServiceLoading());
      final result = await getFoodServicesUseCase();
      _handleResult(result, emit);
    });
    on<GetHealthServicesEvent>((event, emit) async {
      emit(ServiceLoading());
      final result = await getHealthServicesUseCase();
      _handleResult(result, emit);
    });

    on<GetGroceryServicesEvent>((event, emit) async {
      emit(ServiceLoading());
      final result = await getGroceryServicesUseCase();
      _handleResult(result, emit);
    });
  }

  void _handleResult(
      Either<Failure, List<ServiceEntity>> result,
      Emitter<ServiceState> emit,
      ) {
    result.fold(
          (failure) => emit(ServiceError(failure.message)),
          (services) => emit(ServiceLoaded(services)),
    );
  }
}

