import 'package:equatable/equatable.dart';
import '../../../domain/entity/service/serviceEntity.dart';

abstract class ServiceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddServiceEvent extends ServiceEvent {
  final ServiceEntity service;

  AddServiceEvent(this.service);

  @override
  List<Object?> get props => [service];
}
class GetAllServicesEvent extends ServiceEvent {}
class GetFoodServicesEvent extends ServiceEvent {}
class GetHealthServicesEvent extends ServiceEvent {}
class GetGroceryServicesEvent extends ServiceEvent {}
