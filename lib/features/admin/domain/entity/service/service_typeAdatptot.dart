import 'package:auvent_intership/features/admin/domain/entity/service/serviceEntity.dart';
import 'package:hive/hive.dart';

/*
final String id;
  final String name;
  final String description;
  final String category; // 'food', 'health', 'groceries'
  final int discount; // up to 50%

* */
class ServiceTypeAdaptor extends TypeAdapter<ServiceEntity> {
  @override
  // TODO: implement typeId
  int get typeId => 0;
  @override
  ServiceEntity read(BinaryReader reader) {
    // TODO: implement read
    return ServiceEntity(
      id: reader.readString(),
      name: reader.readString(),
      description: reader.readString(),
      category: reader.readString(),
      discount: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, ServiceEntity obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.description);
    writer.writeString(obj.category);
    writer.writeInt(obj.discount);
  }
}
