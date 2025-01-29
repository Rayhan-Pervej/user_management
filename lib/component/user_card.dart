import 'package:flutter/material.dart';
import '../theme/color.dart';
import '../theme/text.dart';
import 'user_avatar.dart';

class UserCard extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String email;
  final VoidCallback onTap;
  const UserCard({
    super.key,
    required this.avatarUrl,
    required this.name,
    required this.email,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  color: MyColor.background,
                  child: ListTile(
                    leading: UserAvatar(
                        avatarUrl: avatarUrl),
                    title: Text(
                      name,
                      style: TextDesign()
                          .bodyText
                          .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      email,
                      style: TextDesign().bodyText,
                    ),
                    onTap: onTap,
                  ),
                );
  }
}
