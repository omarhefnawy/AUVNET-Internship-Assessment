import 'package:dartz/dartz.dart';

import '../../../../../core/errors/faileur.dart';
import '../../entity/service/serviceEntity.dart';
import '../../repo/service_repo/serviceRepo.dart';
class GetGroceriesServicesUseCase {
  final ServiceRepo serviceRepo;

  GetGroceriesServicesUseCase(this.serviceRepo);

  Future<Either<Failure, List<ServiceEntity>>> call() async {
    return await serviceRepo.getGroceriesServices();
  }
}
