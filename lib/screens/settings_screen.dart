//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/resources/auth_methods.dart';
import 'package:instagram_flutter/screens/change_email_screen.dart';
import 'package:instagram_flutter/screens/login_screen.dart';
import 'package:instagram_flutter/screens/signup_screen.dart';
import 'package:instagram_flutter/screens/user_password_reset_screen.dart';
//import 'package:instagram_flutter/screens/userprofile_screen.dart';
import 'package:instagram_flutter/utills/colors.dart';
import 'package:instagram_flutter/utills/global_variables.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void navigateToSignup() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: MediaQuery.of(context).size.width > webScreenSize
              ? EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 3)
              : const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(
                title: const Text('Settings'),
                backgroundColor: mobileBackgroundColor,
              ),
              const Divider(
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.account_circle_outlined),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.lock),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const UserResetPasswordScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Change Password',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.email_outlined),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const ChangeEmailScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Change Email',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.delete_outlined),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Delete posts',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.help_center_outlined),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Help',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.assignment_late_outlined),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'About',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.circle_notifications_outlined),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Notifications',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Container(),
              ),
              const Divider(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.all_inclusive_outlined,
                        size: 30,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Avinya',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Accounts Center',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '''Control settings for connected experiences across 
instagram, the Facebook app and Messanger,
including story and post sharing and logging in.''',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Logins',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          showCupertinoDialog(
                            context: context,
                            builder: createNewLoginDialog,
                          );
                        },
                        child: const Text(
                          'Add account',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          showCupertinoDialog(
                            context: context,
                            builder: createLogOutDialog,
                          );
                        },
                        child: const Text(
                          'Log out',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createLogOutDialog(BuildContext context) => CupertinoAlertDialog(
        title: const Text(
          '''Log out of 
Instagram?''',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text(
              'Log out',
            ),
            onPressed: () async {
              await AuthMethods().signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
          CupertinoDialogAction(
            child: const Text(
              'cancle',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );

  Widget createNewLoginDialog(BuildContext context) => CupertinoAlertDialog(
        title: const Text(
          'Create new account',
          style: TextStyle(fontSize: 16),
        ),
        content: const Text('''Add another account with existing one
(existing account will log out)'''),
        actions: [
          CupertinoDialogAction(
            child: const Text(
              'Add account',
            ),
            onPressed: () async {
              await AuthMethods().signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const SignupScreen(),
                ),
              );
            },
          ),
          CupertinoDialogAction(
            child: const Text(
              'cancle',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
}
