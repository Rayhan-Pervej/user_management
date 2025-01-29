import 'package:get/get.dart';
import 'package:user_management/userData/user.dart';
import '../component/snackbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserDetails extends GetxController {
  var isLoading = true.obs;
  var userDetails = Rxn<User>();

  Future<void> fetchUserDetails(int userId) async {
    try {
      isLoading(true);
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users/$userId'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var userData = User.fromJson(jsonData);
        userData.avatarUrl =
            'https://api.dicebear.com/7.x/avataaars/svg?seed=${userData.id}';

        userDetails.value = userData;

        Snackbar.successSnackbar(
            title: 'Personal Info', message: userDetails.value!.name);
      } else {
        Snackbar.errorSnackbar(title: 'Error!', message: 'Failed to load data');
      }
    } catch (e) {
      Snackbar.errorSnackbar(title: 'Error!', message: 'Something went wrong');
    } finally {
      isLoading(false);
    }
  }
}
