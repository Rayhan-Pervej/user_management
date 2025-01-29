import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_management/theme/color.dart';

class Snackbar {
  static successSnackbar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: MyColor.background,
      backgroundColor: MyColor.secondary,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
    );
  }

  // static warningSnackbar({required title, message = ''}) {
  //   Get.snackbar(title, message,
  //       isDismissible: true,
  //       shouldIconPulse: true,
  //       colorText: MyColor.white,
  //       backgroundColor: MyColor.red,
  //       snackPosition: SnackPosition.TOP,
  //       duration: const Duration(seconds: 3),
  //       margin: const EdgeInsets.all(15),
  //      );
  // }

  static errorSnackbar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: MyColor.background,
      backgroundColor: MyColor.error,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(15),
    );
  }
}
