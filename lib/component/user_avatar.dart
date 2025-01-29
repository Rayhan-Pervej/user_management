import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_management/theme/color.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.avatarUrl, this.radius = 30});
  final String avatarUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: MyColor.primary,
      child: ClipOval(
        child: SvgPicture.network(
          avatarUrl,
          placeholderBuilder: (context) {
            return const CircularProgressIndicator();
          },
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
