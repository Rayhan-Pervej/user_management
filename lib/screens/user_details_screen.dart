import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:user_management/component/user_avatar.dart';
import 'package:user_management/theme/color.dart';
import 'package:user_management/userData/user_details.dart';

import '../component/user_info_card.dart';
import '../theme/text.dart';

class UserDetailsScreen extends StatelessWidget {
  final int userId;

  UserDetailsScreen({super.key, required this.userId});

  final UserDetails controller = Get.put(UserDetails());

  @override
  Widget build(BuildContext context) {
    controller.fetchUserDetails(userId);

    return Scaffold(
      backgroundColor: MyColor.surface,
      appBar: AppBar(
        title: Text('User Details', style: TextDesign().headings),
        backgroundColor: MyColor.primary,
        leading: IconButton(
          icon: const Icon(
            Iconsax.arrow_left_2,
            color: MyColor.secondary,
            weight: 50,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final user = controller.userDetails.value;
        if (user == null) {
          return Center(
              child: Text("User not found", style: TextDesign().bodyText));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'avatar_${user.name}',
                child: UserAvatar(avatarUrl: user.avatarUrl, radius: 60),
              ),
              const SizedBox(height: 16),
              Text(user.name,
                  style: TextDesign()
                      .headings
                      .copyWith(fontSize: 22, color: MyColor.primary)),
              Text(user.email, style: TextDesign().bodyText),
              const SizedBox(height: 20),
              UserInfoCard(title: 'Phone', value: user.phone),
              UserInfoCard(title: 'Address', value: user.address),
              UserInfoCard(title: 'Company', value: user.company),
            ],
          ),
        );
      }),
    );
  }
}
