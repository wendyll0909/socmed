import 'package:flutter/material.dart';
import '../userdata.dart';

class InfoHeader extends StatelessWidget {
  final UserData userData;
  const InfoHeader({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('Followers'),
            Text('Following'),
            Text('Post'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(userData.myUserAccount.numFollowers, style: style),
            Text(userData.myUserAccount.numFollowing, style: style),
            Text(userData.myUserAccount.numPosts, style: style),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(color: Colors.grey),
      ],
    );
  }
}