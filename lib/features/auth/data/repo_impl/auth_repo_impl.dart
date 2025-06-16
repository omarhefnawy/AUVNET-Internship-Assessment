import 'package:auvent_intership/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:auvent_intership/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/faileur.dart';
import '../data_Sourse/auth_data_source.dart';



class AuthRepoImpl implements AuthRepo{
  final AuthDataSource dataSource;

  AuthRepoImpl(this.dataSource);
  @override
  Future<Either<Failure, UserEntity>> login({required String email, required String pass})async {
    // TODO: implement login
   try{
     final result= await dataSource.login(email, pass);
     if (!result.emailVerified) {
       return Left(ServerFailure("Please verify your email first."));
     }
     return Right(UserEntity(uid:result.uid! , email: result.email! ));
   }
   catch(e)
    {
      return Left(ServerFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, UserEntity>> signUp({required String email, required String pass}) async{
    // TODO: implement signUp
    try{
   final result= await dataSource.register(email, pass);

   // نبعته إيميل تأكيد
   if (!result.emailVerified) {
     await result.sendEmailVerification();
   }

   return Right(UserEntity(uid: result.uid,email: result.email!));
    }
    catch(e)
    {
      return Left(ServerFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, void>> logout() async{
    try{
    await dataSource.signOut();
    return Right(null);
    }
    catch(e)
    {
    return Left(ServerFailure(e.toString()));
    }
  }
  
}