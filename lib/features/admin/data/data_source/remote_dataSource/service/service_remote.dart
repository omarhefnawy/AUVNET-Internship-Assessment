import 'package:auvent_intership/features/admin/domain/entity/service/serviceEntity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
abstract class ServiceRemoteSource{
  Future<void> setService(ServiceEntity service);
  Future<List<ServiceEntity>> getAllServices();
  Future<List<ServiceEntity>> getFoodService();
  Future<List<ServiceEntity>> getHealthService();
  Future<List<ServiceEntity>> getGroceryService();
//food , health grocery
}
class FireBaseServiceRemoteDataSource implements ServiceRemoteSource{
  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  @override
  Future<void> setService(ServiceEntity service)async {
    // TODO: implement setService
    await firebaseFirestore.collection("services").doc(service.id).set(service.toJson());

  }
  //get all
@override
  Future<List<ServiceEntity>> getAllServices() async{
    // TODO: implement getServices
   final result= await firebaseFirestore.collection("services").get();
   return result.docs.map((element){
     return ServiceEntity.fromJson(element.data());
   }).toList();
   
  }
  //food
@override
  Future<List<ServiceEntity>> getFoodService() async{
    // TODO: implement getFoodService
  final result= await firebaseFirestore.collection("services").where("category",isEqualTo:"food" ).get();
  return result.docs.map((element){
    return ServiceEntity.fromJson(element.data());
  }).toList();
  }
  //health
@override
  Future<List<ServiceEntity>> getHealthService() async{
    // TODO: implement getHealthService
  final result= await firebaseFirestore.collection("services").where("category",isEqualTo:"health" ).get();
  return result.docs.map((element){
    return ServiceEntity.fromJson(element.data());
  }).toList();
  }
  //grocary
@override
  Future<List<ServiceEntity>> getGroceryService() async{
    // TODO: implement getGroceryService
  final result= await firebaseFirestore.collection("services").where("category",isEqualTo:"grocery" ).get();
  return result.docs.map((element){
    return ServiceEntity.fromJson(element.data());
  }).toList();
  }
 

}