import 'package:flutter/material.dart';
import 'model/userdata.dart';
import 'model/widgets/mainheader.dart';
import 'model/widgets/infoheader.dart';
import 'model/widgets/friendlist.dart';
import 'model/widgets/postlist.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  final UserData userdata = UserData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Task6_Erosido", 
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: ListView(
        children: [
          MainHeader(userData: userdata),
          InfoHeader(userData: userdata),
          FriendList(userData: userdata),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, top: 20),
            child: Text('Posts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 20),
          PostList(userdata: userdata),
        ],
      ),
    );
  }
}