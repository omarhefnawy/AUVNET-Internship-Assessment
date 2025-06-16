import 'package:auvent_intership/core/errors/faileur.dart';
import 'package:auvent_intership/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:auvent_intership/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase{
  final AuthRepo authRepo;

  LoginUseCase(this.authRepo);
  Future<Either<Failure,UserEntity>> call(String email,String pass){

 return authRepo.login(email: email, pass: pass);
  }

}