import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/add_post_screen.dart';
import 'package:instagram_flutter/screens/feed_screen.dart';
import 'package:instagram_flutter/screens/search_screen.dart';
import 'package:instagram_flutter/screens/userprofile_screen.dart';

const webScreenSize = 600;

List<Widget> homeSceenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Text('notify'),
  UserProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid),
];
