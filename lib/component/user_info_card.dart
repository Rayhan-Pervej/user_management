import 'package:flutter/material.dart';
import 'package:user_management/theme/color.dart';
import 'package:user_management/theme/text.dart';

class UserInfoCard extends StatelessWidget {
  final String title;
  final String value;

  const UserInfoCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColor.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(title,
            style: TextDesign()
                .bodyText
                .copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle:
            Text(value, style: TextDesign().bodyText.copyWith(fontSize: 14)),
      ),
    );
  }
}
