import 'package:quickprism/domain/user/user_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String userIdKey = 'userIdKey'; // Define your key names
  static const String userTypeKey = 'userTypeKey'; // Define your key names

  Future<void> saveUserId(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(userIdKey, userId);
    UserConstants.userId = userId;
  }

  Future<void> saveUserType(String userType) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userTypeKey, userType);
    UserConstants.userType = userType;
  }

  Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();

    UserConstants.userId = prefs.getInt(userIdKey);
    return UserConstants.userId;
  }

  Future<String?> getUserType() async {
    final prefs = await SharedPreferences.getInstance();
    UserConstants.userType = prefs.getString(userTypeKey);
    return UserConstants.userType;
  }

// removed in same function
  Future<void> clearUserId() async {
    final prefs = await SharedPreferences.getInstance();
    UserConstants.userId = null;
    UserConstants.userType = null;
    await prefs.remove(userTypeKey);
    await prefs.remove(userIdKey);
  }
}
