import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/login_screen.dart';
import 'package:instagram_flutter/screens/reset_password_screen.dart';
import 'package:instagram_flutter/screens/settings_screen.dart';
//import 'package:instagram_flutter/utills/colors.dart';
import 'package:instagram_flutter/utills/global_variables.dart';
import 'package:instagram_flutter/utills/utils.dart';
//import 'package:instagram_flutter/widgets/text_field_input.dart';

class UserResetPasswordScreen extends StatefulWidget {
  const UserResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<UserResetPasswordScreen> createState() =>
      _UserResetPasswordScreenState();
}

class _UserResetPasswordScreenState extends State<UserResetPasswordScreen> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newpasswordController = TextEditingController();
  final TextEditingController _checkpasswordController =
      TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isPasswordVerified = false;

  @override
  void dispose() {
    super.dispose();
    _oldPasswordController.dispose();
    _newpasswordController.dispose();
    _checkpasswordController.dispose();
  }

  void resetPassword() async {
    var authcred = EmailAuthProvider.credential(
        email: _auth.currentUser!.email.toString(),
        password: _oldPasswordController.text);

    String r = "some err occured";
    try {
      var authResult =
          await _auth.currentUser!.reauthenticateWithCredential(authcred);
      if (authResult.user!.email.toString() ==
          _auth.currentUser!.email.toString()) {
        isPasswordVerified = true;
      }
    } catch (e) {
      r = e.toString();
      showSnackBar(r, context);
    }
    if (isPasswordVerified) {
      RegExp passE = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
      String strpass = _newpasswordController.text.trim();

      if (passE.hasMatch(strpass)) {
        if (_newpasswordController.text == _checkpasswordController.text) {
          String res = "some error occured";
          try {
            _auth.currentUser!.updatePassword(_newpasswordController.text);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          } catch (err) {
            res = err.toString();
            showSnackBar(res, context);
          }
        } else {
          showSnackBar('Password do not match.', context);
        }
      } else {
        showSnackBar(
            'Password should contain Capital, small letter & Number & Special character',
            context);
      }
    }
  }

  void navigateToSettings() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
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
              : const EdgeInsets.symmetric(horizontal: 19),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: navigateToSettings,
                    icon: const Icon(
                      Icons.clear_rounded,
                      size: 35,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Flexible(child: Container()),
                  IconButton(
                    onPressed: resetPassword,
                    icon: const Icon(
                      Icons.check_rounded,
                      size: 35,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    ''' Your password must be at least 6 characters and  
 should include a combination of numbers, letters 
 and special characters (!@%). ''',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              //enter old password
              TextField(
                controller: _oldPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Current password',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //enter new password
              TextField(
                controller: _newpasswordController,
                decoration: const InputDecoration(
                  labelText: 'New password',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //check password with new password
              TextField(
                controller: _checkpasswordController,
                decoration: const InputDecoration(
                  labelText: 'New password, again',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ResetPasswordScreen(
                              screenName: 'Reset page'),
                        ),
                      );
                    },
                    child: const Text(
                      'Forgot your password',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
