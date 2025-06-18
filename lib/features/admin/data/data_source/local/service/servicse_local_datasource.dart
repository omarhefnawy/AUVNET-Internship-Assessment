import 'package:auvent_intership/features/admin/domain/entity/service/serviceEntity.dart';
import 'package:hive/hive.dart';

abstract class ServiceLocalSource {
  Future<void> cacheServices(List<ServiceEntity> services, String category);
  Future<List<ServiceEntity>> getCachedServices(String category);
}

class HiveServiceLocalSource implements ServiceLocalSource {
  // اسم الـ box حسب الكاتيجوري (food, health, grocery, all)
  String _getName(String category) => "services_$category";

  @override
  Future<void> cacheServices(List<ServiceEntity> services, String category) async {
    final box = await Hive.openBox<ServiceEntity>(_getName(category));
    for (var service in services) {
      await box.put(service.id, service);
    }
  }

  @override
  Future<List<ServiceEntity>> getCachedServices(String category) async {
    final box = await Hive.openBox<ServiceEntity>(_getName(category));
    final List<ServiceEntity> services = box.values.toList().reversed.toList(); // الأحدث أولاً
    return services;
  }
}
