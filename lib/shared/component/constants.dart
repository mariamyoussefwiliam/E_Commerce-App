import '../network/local/cache_helper.dart';

String? userToken=CacheHelper.get(key: "token");
String? userName=CacheHelper.get(key: "name");
bool connected = true;