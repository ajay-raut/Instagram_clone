import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/responsive/mobile_screen_layout.dart';
import 'package:instagram_flutter/responsive/responsive_layout_screen.dart';
import 'package:instagram_flutter/responsive/web_screen_layout.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;

  @override
  void initState() {
    user = _auth.currentUser!;
    user.sendEmailVerification();

    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: Container(),
            flex: 1,
          ),
          const Center(
            child: Icon(
              Icons.email_outlined,
              size: 70,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: Text('An email has been sent to ${user.email}'),
          ),
          const Center(
            child: Text('please verify.'),
          ),
          const SizedBox(
            height: 25,
          ),
          const Center(
            child: CircularProgressIndicator(),
          ),
          Flexible(
            child: Container(),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = _auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => const RseponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                )),
      );
    }
  }
}
