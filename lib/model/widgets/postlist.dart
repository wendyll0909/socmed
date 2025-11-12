import 'package:flutter/material.dart';
import '../userdata.dart';
import '../userpost.dart';
import 'profileview.dart';

class PostList extends StatefulWidget {
  final UserData userdata;
  const PostList({super.key, required this.userdata});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final _nameStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  void _gotoProfile(Userpost post) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ProfileView(userPost: post)),
    );
  }

  Widget _postHeader(Userpost p) => Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(radius: 20, backgroundImage: AssetImage(p.userImg)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(p.username, style: _nameStyle),
              Row(children: [Text(p.time), const Icon(Icons.people, size: 18)]),
            ],
          ),
        ],
      );

  Widget _postImage(Userpost p) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(p.posting), fit: BoxFit.cover),
          ),
        ),
      );

  Widget _postCount(Userpost p) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('${p.numcomments} Comments'),
          const SizedBox(width: 20),
          Text('${p.numshare} Shares'),
        ],
      );

  Widget _buttons(Userpost p) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(foregroundColor: p.isLiked ? Colors.blue : Colors.grey),
            onPressed: () => setState(() => p.isLiked = !p.isLiked),
            icon: Icon(p.isLiked ? Icons.favorite : Icons.favorite_border),
            label: const Text('Like'),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(foregroundColor: Colors.grey),
            onPressed: () {},
            icon: const Icon(Icons.message),
            label: const Text('Comment'),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(foregroundColor: Colors.grey),
            onPressed: () {},
            icon: const Icon(Icons.share),
            label: const Text('Share'),
          ),
        ],
      );

  Widget _showPost(Userpost p) => Column(
        children: [
          _postHeader(p),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(p.postcontent, style: _nameStyle),
          ),
          _postImage(p),
          _postCount(p),
          const Divider(),
          _buttons(p),
          const SizedBox(height: 15),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: widget.userdata.userList.map((post) {
        return InkWell(
          onTap: () => _gotoProfile(post),
          child: _showPost(post),
        );
      }).toList(),
    );
  }
}