import 'package:auvent_intership/core/errors/faileur.dart';
import 'package:auvent_intership/features/admin/domain/entity/service/serviceEntity.dart';
import 'package:dartz/dartz.dart';

import '../../repo/service_repo/serviceRepo.dart';

class AddServiceUseCase{
  final ServiceRepo serviceRepo;

  AddServiceUseCase(this.serviceRepo);

   Future<Either<Failure,void>> call (ServiceEntity service) async {
   return  serviceRepo.setService(service);
   }
}