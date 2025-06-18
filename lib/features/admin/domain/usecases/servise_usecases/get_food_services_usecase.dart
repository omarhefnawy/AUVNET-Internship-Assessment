import 'package:dartz/dartz.dart';

import '../../../../../core/errors/faileur.dart';
import '../../entity/service/serviceEntity.dart';
import '../../repo/service_repo/serviceRepo.dart';
class GetFoodServicesUseCase {
  final ServiceRepo serviceRepo;

  GetFoodServicesUseCase(this.serviceRepo);

  Future<Either<Failure, List<ServiceEntity>>> call() async {
    return await serviceRepo.getFoodServices();
  }
}
