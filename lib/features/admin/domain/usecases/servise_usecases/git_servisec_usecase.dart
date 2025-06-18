import 'package:dartz/dartz.dart';

import '../../../../../core/errors/faileur.dart';
import '../../entity/service/serviceEntity.dart';
import '../../repo/service_repo/serviceRepo.dart';

class GetAllServicesUseCase {
  final ServiceRepo serviceRepo;

  GetAllServicesUseCase(this.serviceRepo);

  Future<Either<Failure, List<ServiceEntity>>> call() async {
    return await serviceRepo.getServices();
  }
}
