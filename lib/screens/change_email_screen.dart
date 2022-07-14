//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/settings_screen.dart';
import 'package:instagram_flutter/utills/global_variables.dart';

class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen({Key? key}) : super(key: key);

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: MediaQuery.of(context).size.width > webScreenSize
              ? EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 3)
              : const EdgeInsets.symmetric(horizontal: 19),
          width: double.infinity,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.clear_rounded,
                      size: 35,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'Change Email',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Flexible(child: Container()),
                  IconButton(
                    onPressed: () {},
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
                    ''' Notifications regarding your account will be send 
 on given email address,make sure it will be in 
 daily use.You can allways change the email
 address in future. ''',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'New password',
                  border: UnderlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
