import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:mvvm_architecture_with_provider_with_rest_api/repository/postRepo/auth_repository.dart";

class GetViewModel  with ChangeNotifier{
final authRepository = AuthRepository();
Future<void> getItems ()async{
  try{
  }catch(e){
    debugPrint(e.toString());
  }
}

////---------------Login function----------------/////
Future<dynamic>loginViewModel(dynamic data,BuildContext context)async{
try{
final reponse= authRepository.lginFunction(data);
notifyListeners();
}catch(e){
  
}
}
}