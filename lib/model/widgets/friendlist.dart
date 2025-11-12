import 'package:flutter/material.dart';
import '../friend.dart';
import '../userdata.dart';

class FriendList extends StatelessWidget {
  final UserData userData;
  const FriendList({super.key, required this.userData});

  Widget _friendCard(Friend f) => Card(
        child: Column(
          children: [
            Expanded(child: Image.asset(f.img, fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(f.name),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text('Friends', style: titleStyle),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('${userData.friendList.length} friends'),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 300,
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 180,
            ),
            itemCount: userData.friendList.length,
            itemBuilder: (_, i) => _friendCard(userData.friendList[i]),
          ),
        ),
        const SizedBox(height: 10, child: ColoredBox(color: Colors.grey)),
      ],
    );
  }
}