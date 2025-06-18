import 'package:auvent_intership/features/admin/data/data_source/remote_dataSource/service/service_remote.dart';
import 'package:auvent_intership/features/admin/domain/repo/service_repo/serviceRepo.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/faileur.dart';
import '../../../domain/entity/service/serviceEntity.dart';
import '../../data_source/local/service/servicse_local_datasource.dart';

class ServiceRepoImpl implements ServiceRepo {
  final ServiceRemoteSource serviceRemoteSource;
  final ServiceLocalSource serviceLocalSource;

  ServiceRepoImpl(this.serviceRemoteSource, this.serviceLocalSource);

  @override
  Future<Either<Failure, void>> setService(ServiceEntity entity) async {
    try {
      await serviceRemoteSource.setService(entity);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ServiceEntity>>> getServices() async {
    return await _handleServiceFetch(
      fetchFromRemote: serviceRemoteSource.getAllServices,
      category: 'all',
    );
  }

  @override
  Future<Either<Failure, List<ServiceEntity>>> getFoodServices() async {
    return await _handleServiceFetch(
      fetchFromRemote: serviceRemoteSource.getFoodService,
      category: 'food',
    );
  }

  @override
  Future<Either<Failure, List<ServiceEntity>>> getHealthServices() async {
    return await _handleServiceFetch(
      fetchFromRemote: serviceRemoteSource.getHealthService,
      category: 'health',
    );
  }

  @override
  Future<Either<Failure, List<ServiceEntity>>> getGroceriesServices() async {
    return await _handleServiceFetch(
      fetchFromRemote: serviceRemoteSource.getGroceryService,
      category: 'grocery',
    );
  }

  /// 🔁 Handle service fetching with local fallback
  Future<Either<Failure, List<ServiceEntity>>> _handleServiceFetch({
    required Future<List<ServiceEntity>> Function() fetchFromRemote,
    required String category,
  }) async {
    try {
      final services = await fetchFromRemote();
      await serviceLocalSource.cacheServices(services, category);
      return right(services);
    } catch (e) {
      try {
        final cached = await serviceLocalSource.getCachedServices(category);
        return right(cached);
      } catch (_) {
        return left(ServerFailure("No internet and no cached data"));
      }
    }
  }
}
