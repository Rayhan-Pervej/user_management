import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_management/component/user_card.dart';
import 'package:user_management/theme/color.dart';
import 'package:user_management/theme/text.dart';
import 'package:user_management/userData/user_list.dart';

import 'user_details_screen.dart';

class UserListScreen extends StatelessWidget {
  UserListScreen({super.key});

  final UserList userList = Get.put(UserList());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.surface,
      appBar: AppBar(
        title: Text('User List', style: TextDesign().headings),
        backgroundColor: MyColor.primary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: userList.searchController,
              onChanged: (value) => userList.searchUsers(),
              decoration: InputDecoration(
                hintText: 'Search users...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: MyColor.primary),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: userList.refreshUsers,
              child: Obx(() {
                if (userList.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (userList.filteredUserList.isEmpty) {
                  return Center(
                    child: Text(
                      "No users found",
                      style: TextDesign().bodyText,
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: userList.filteredUserList.length,
                    itemBuilder: (context, index) {
                      return UserCard(
                        avatarUrl: userList.filteredUserList[index].avatarUrl,
                        name: userList.filteredUserList[index].name,
                        email: userList.filteredUserList[index].email,
                        onTap: () {
                          Get.to(() => UserDetailsScreen(
                              userId: userList.filteredUserList[index].id));
                        },
                      );
                    },
                  );
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
