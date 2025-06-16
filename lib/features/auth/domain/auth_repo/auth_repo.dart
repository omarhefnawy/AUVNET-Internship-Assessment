import 'package:auvent_intership/core/errors/faileur.dart';
import 'package:auvent_intership/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

 abstract class AuthRepo{
  Future<Either<Failure,UserEntity>> login({required String email,required String pass});
  Future<Either<Failure,UserEntity>> signUp({required String email,required String pass});
  Future<Either<Failure,void>> logout();
}