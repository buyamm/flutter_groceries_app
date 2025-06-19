import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  /*
Vấn đề: async mà không trả Future

  `static void saveToken(String token) async {
    .... // code here
  
  }`


Điều gì thực sự xảy ra?
  Hàm vẫn là bất đồng bộ.

  Nhưng bạn không thể await nó từ bên ngoài vì nó trả về void.

  Và nếu trong hàm có lỗi, bạn không bắt được lỗi đó ở ngoài vì không có Future để bắt lỗi.
*/
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  static Future<void> removeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('access_token');
  }
}
