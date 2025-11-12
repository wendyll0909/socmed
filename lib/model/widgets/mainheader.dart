import 'package:flutter/material.dart';
import '../userdata.dart';

class MainHeader extends StatelessWidget {
  final UserData userData;
  const MainHeader({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(userData.myUserAccount.img),
          radius: 40,
        ),
        Text(
          userData.myUserAccount.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        Text(userData.myUserAccount.email),
        const SizedBox(height: 20),
      ],
    );
  }
}