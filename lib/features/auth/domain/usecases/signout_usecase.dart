import 'package:auvent_intership/core/errors/faileur.dart';
import 'package:auvent_intership/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:auvent_intership/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

class SignOutUseCase{
  final AuthRepo authRepo;

  SignOutUseCase(this.authRepo);
  Future<Either<Failure,void>> call(){

    return authRepo.logout();
  }

}