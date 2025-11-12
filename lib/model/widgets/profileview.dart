import 'package:flutter/material.dart';
import '../userdata.dart';
import '../userpost.dart';
import '../usercomment.dart';

class ProfileView extends StatefulWidget {
  final Userpost userPost;
  const ProfileView({super.key, required this.userPost});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final UserData userData = UserData();

  final _nameStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final _boldStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  Widget _userLine() => Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(radius: 20, backgroundImage: AssetImage(widget.userPost.userImg)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.userPost.username, style: _nameStyle),
              const SizedBox(height: 5),
              Row(children: [
                Text(widget.userPost.time),
                const Text(' • '),
                const Icon(Icons.group, size: 15, color: Colors.grey),
              ]),
            ],
          ),
        ],
      );

  Widget _postImage() => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.userPost.postcontent),
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(widget.userPost.posting, width: double.infinity, fit: BoxFit.cover),
            ),
          ],
        ),
      );

  Widget _buttons() => Column(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                      foregroundColor: widget.userPost.isLiked ? Colors.blue : Colors.grey),
                  onPressed: () => setState(() => widget.userPost.isLiked = !widget.userPost.isLiked),
                  icon: Icon(widget.userPost.isLiked ? Icons.favorite : Icons.favorite_border),
                  label: Text(widget.userPost.numcomments),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                  onPressed: () {},
                  icon: const Icon(Icons.chat_bubble, size: 20),
                  label: const Text('Comment'),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                  onPressed: () {},
                  icon: const Icon(Icons.share, size: 20),
                  label: const Text('Share'),
                ),
              ],
            ),
          ),
        ],
      );

  Widget _commenters() => Column(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(children: [Text('${widget.userPost.numshare} shares', style: _boldStyle)]),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text('All comments', style: _boldStyle),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ],
      );

  Widget _commentSpace(UserComment c) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(158, 158, 158, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(c.commenterName, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(c.commenterContent),
          ],
        ),
      );

  Widget _commentBtn(UserComment c) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(c.commenterTime),
            const SizedBox(width: 15),
            const Text('Like'),
            const SizedBox(width: 15),
            const Text('Reply'),
          ],
        ),
      );

  Widget _commentLine(UserComment c) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 20, backgroundImage: AssetImage(c.commenterImg)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_commentSpace(c), _commentBtn(c)],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _userLine(),
          _postImage(),
          _buttons(),
          _commenters(),
          ...userData.commentList.map(_commentLine),
        ],
      ),
    );
  }
}