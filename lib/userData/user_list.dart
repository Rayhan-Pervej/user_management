import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_management/userData/user.dart';
import 'package:http/http.dart' as http;
import '../component/snackbar.dart';

class UserList extends GetxController {
  var userList = <User>[].obs;
  var isLoading = true.obs;
  var searchQuery = ''.obs;
  Timer? debounce;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  Future<void> refreshUsers() async {
    await fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading(true);

      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        userList.value = jsonData.map((user) {
          var userList = User.fromJson(user);
          userList.avatarUrl =
              'https://api.dicebear.com/7.x/avataaars/svg?seed=${userList.id}'; // Adding avater manaually
          return userList;
        }).toList();
        Snackbar.successSnackbar(
            title: 'Success!', message: 'Data Loaded Successfully');
      } else {
        Snackbar.errorSnackbar(title: 'Error!', message: 'Failed to load data');
      }
    } catch (e) {
      Snackbar.errorSnackbar(title: 'Error!', message: 'Something went wrong');
    } finally {
      isLoading(false);
    }
  }

  List<User> get filteredUserList {
    if (searchQuery.isEmpty) {
      return userList;
    } else {
      return userList
          .where((user) =>
              user.name.toLowerCase().contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }

  void searchUsers() {
    if (debounce?.isActive ?? false) debounce!.cancel();
    debounce = Timer(const Duration(milliseconds: 100), () {
      searchQuery.value = searchController.text.trim();
    });
  }
}
