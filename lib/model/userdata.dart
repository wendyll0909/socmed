import 'userpost.dart';
import 'friend.dart';
import 'usercomment.dart';
import 'account.dart';

class UserData {
  final List<Userpost> userList = [
    Userpost(
      userImg: "assets/person1.jpg",
      username: "John Doe",
      time: "2 hrs ago",
      postcontent: "Had a great day at the beach!",
      posting: "assets/playjob.jpg",
      numcomments: "24",
      numshare: "5",
      isLiked: false,
    ),
    Userpost(
      userImg: "assets/person3.jpg",
      username: "Mike Johnson",
      time: "5 hrs ago",
      postcontent: "Just finished hiking in 5 mins",
      posting: "assets/palovab.jpg",
      numcomments: "30",
      numshare: "20",
      isLiked: true,
    ),
    Userpost(
      userImg: "assets/person4.jpg",
      username: "John Doe",
      time: "10 hrs ago",
      postcontent: "Had a great day at the beach!",
      posting: "assets/palovab.jpg",
      numcomments: "24",
      numshare: "5",
      isLiked: true,
    ),
  ];

  final List<Friend> friendList = [
    const Friend(img: "assets/person1.jpg", name: "Alice"),
    const Friend(img: "assets/person2.jpg", name: "Charlie"),
    const Friend(img: "assets/person3.jpg", name: "Diana"),
    const Friend(img: "assets/person5.jpg", name: "Ethan"),
    const Friend(img: "assets/person6.jpg", name: "Michael"),
  ];

  final List<UserComment> commentList = [
    const UserComment(
      commenterImg: "assets/person2.jpg",
      commenterName: "Jane Smith",
      commenterTime: "6 hrs",
      commenterContent: "Wow Beautiful!",
    ),
    const UserComment(
      commenterImg: "assets/person3.jpg",
      commenterName: "Kenneth Vladimir",
      commenterTime: "2 hrs",
      commenterContent: "Wow Beautiful!",
    ),
    const UserComment(
      commenterImg: "assets/person4.jpg",
      commenterName: "Miko Rojo",
      commenterTime: "8 hrs",
      commenterContent: "Wow Beautiful!",
    ),
  ];

  final Account myUserAccount = Account(
    name: "Wendyll Erosido",
    email: "w.erosido.463496@gmail.com",
    img: "assets/person2.jpg",
    numFollowers: "15",
    numPosts: "350",
    numFollowing: "150",
    numFriends: "50",
  );
}