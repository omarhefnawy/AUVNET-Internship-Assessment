import 'package:equatable/equatable.dart';
import '../../../domain/entity/service/serviceEntity.dart';

abstract class ServiceState extends Equatable {
  @override
  List<Object?> get props => [];
}
class ServiceInitial extends ServiceState {}
class ServiceLoading extends ServiceState {}
class ServiceLoaded extends ServiceState {
  final List<ServiceEntity> services;

  ServiceLoaded(this.services);

  @override
  List<Object?> get props => [services];
}

class ServiceAddedSuccessfully extends ServiceState {}

class ServiceError extends ServiceState {
  final String message;

  ServiceError(this.message);

  @override
  List<Object?> get props => [message];
}
