import 'package:auvent_intership/core/errors/faileur.dart';
import 'package:auvent_intership/features/admin/domain/entity/service/serviceEntity.dart';
import 'package:dartz/dartz.dart';

abstract class ServiceRepo{
  Future<Either<Failure ,void>> setService (ServiceEntity entity);
  Future<Either<Failure ,List<ServiceEntity>>> getServices ();
  Future<Either<Failure ,List<ServiceEntity>>> getFoodServices ();
  Future<Either<Failure ,List<ServiceEntity>>> getHealthServices ();
  Future<Either<Failure ,List<ServiceEntity>>> getGroceriesServices ();
}