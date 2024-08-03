import 'package:shared_preferences/shared_preferences.dart';

// this class has no use now because i hava terminated this in main screen code and i am not enabeling it as it is not working perfectly and i don't hava the knowledge of shared prefrences.
class SaveMyData {
  static String memeKey = "MEMEKEY";

  static Future<bool> saveData(int val) async {
    final inst = await SharedPreferences.getInstance();
    return await inst.setInt(memeKey, val);
  }

  static Future<int?> fetchData() async {
    SharedPreferences.setMockInitialValues({});
    final inst = await SharedPreferences.getInstance();
    return await inst.getInt(memeKey);
  }
}
