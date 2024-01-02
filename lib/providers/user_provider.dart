import 'package:flutter/cupertino.dart';
import 'package:safeguard/model/user_model.dart';
import 'package:safeguard/services/user_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  String _invitationStatus = '';

  List<User> get users => _users;

  String get invitationStatus => _invitationStatus; // Add this getter

  Future<User> authenticateAdmin(String email, String password) async {
    // Call the authenticateAdmin method from the ApiService
    final User user = await UserApiService.authenticateAdmin(email, password);

    // Add the user to the _users list
    _users.add(user);

    // Notify listeners that the data has changed
    notifyListeners();
        return user;

    
  }

  Future<void> sendCredentialsByEmail(String adminEmail) async {
    try {
      // Update invitation status to indicate that it's in progress
      _invitationStatus = 'Sending credentials...';
      notifyListeners();

      // Call the UserApiService method to send credentials
      await UserApiService.sendCredentialsByEmail(adminEmail);

      // Update invitation status to indicate success
      _invitationStatus = 'Credentials sent successfully';
      notifyListeners();
    } catch (e) {
      // Update invitation status to indicate failure
      _invitationStatus = 'Failed to send credentials';
      notifyListeners();
    }
  }

 Future<void> saveUserDetailsLocally(User user) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('user_id', user.id ?? '');
  prefs.setString('user_name', user.userName ?? '');
  prefs.setString('user_email', user.email ?? '');
  prefs.setString('user_numero_tel', user.numeroTel ?? '');

  // Add debug prints to check if data is being saved
  print('User ID saved: ${prefs.getString('user_id')}');
  print('User Name saved: ${prefs.getString('user_name')}');
  print('User Email saved: ${prefs.getString('user_email')}');
  print('User Numero Tel saved: ${prefs.getString('user_numero_tel')}');
}


Future<User> getUserDetails() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return User(
    id: prefs.getString('user_id') ?? '',
    userName: prefs.getString('user_name') ?? '',
    email: prefs.getString('user_email') ?? '',
    numeroTel: prefs.getString('user_numero_tel') ?? '',
  );
}

}
