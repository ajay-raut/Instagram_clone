import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/login_screen.dart';
import 'package:instagram_flutter/screens/user_password_reset_screen.dart';
import 'package:instagram_flutter/utills/colors.dart';
import 'package:instagram_flutter/utills/global_variables.dart';
import 'package:instagram_flutter/utills/utils.dart';
import 'package:instagram_flutter/widgets/text_field_input.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String screenName;
  const ResetPasswordScreen({Key? key, required this.screenName})
      : super(key: key);

  @override
  State<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState(screenName);
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  String screenName;
  _ResetPasswordScreenState(this.screenName);

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  void resetPassword() async {
    setState(() {
      _isLoading = true;
    });

    if (_emailController.text.isNotEmpty) {
      RegExp emailE = RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

      String stremail = _emailController.text.trim();

      if (emailE.hasMatch(stremail)) {
        String res = "some error occured";
        try {
          _auth.sendPasswordResetEmail(email: _emailController.text);
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
        showSnackBar("Email address is badly formatted", context);
      }
    } else {
      showSnackBar("Email field is empty.", context);
    }

    setState(() {
      _isLoading = false;
    });
  }

  void navigateToLogin() {
    if (screenName == 'Reset page') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const UserResetPasswordScreen(),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
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
              Flexible(
                child: Container(),
                flex: 2,
              ),
              //reset image
              const Icon(
                Icons.lock_reset_outlined,
                size: 80,
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 14),
              //text field input for email
              TextFieldInput(
                textEditingController: _emailController,
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 24,
              ),

              //button for reset password
              InkWell(
                onTap: resetPassword,
                child: Container(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : const Text('Send Request'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      color: blueColor),
                ),
              ),
              const SizedBox(
                height: 12,
              ),

              Flexible(
                child: Container(),
                flex: 2,
              ),

              //Transitioning to signup
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Back to "),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                  ),
                  GestureDetector(
                    onTap: navigateToLogin,
                    child: Container(
                      child: Text(
                        screenName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
