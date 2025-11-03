 abstract class  BaseApiServices {
    Future<dynamic> getAllFunction(String url, String? token);
    Future<dynamic> postAllFunction(String url, {String token,dynamic body});
    Future<dynamic> putAllFunction(String url, {String? token, dynamic body});
    Future<dynamic> patchAllFunction(String url, {String? token, dynamic body});
    Future<dynamic> deleteAllFunction(String url, {String? token, dynamic body}); 
}