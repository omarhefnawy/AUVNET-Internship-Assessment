import 'package:equatable/equatable.dart';
class ServiceEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final String category; // 'food', 'health', 'groceries'
  final int discount; // up to 50%

  ServiceEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.discount,
  });

  // copyWith method
  ServiceEntity copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? category,
    int? discount,
  }) {
    return ServiceEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      discount: discount ?? this.discount,
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'discount': discount,
    };
  }

  // fromJson method
  factory ServiceEntity.fromJson(Map<String, dynamic> json) {
    return ServiceEntity(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      discount: json['discount'],
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [id, name, description, category, discount];
}
