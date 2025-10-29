import "package:flutter/foundation.dart";
import "package:mvvm_architecture_with_provider_with_rest_api/repository/getRepo.dart";



class GetViewModel  with ChangeNotifier{



final Getrepo repoService= Getrepo();



Future<void> getItems ()async{
  try{
final items= repoService.getITem("this is the URL");


  }catch(e){
    debugPrint(e.toString());
  }
}

}