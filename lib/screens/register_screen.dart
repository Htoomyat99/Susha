import 'package:auth/components/diaglog_box.dart';
import 'package:auth/components/image_container.dart';
import 'package:auth/components/input_button.dart';
import 'package:auth/components/text_input.dart';
import 'package:auth/screens/dashboard.dart';
import 'package:auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  void goRegister() {
    var email = _emailController.text;
    var pass = _passController.text;
    if (email.isNotEmpty && pass.isNotEmpty) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const Dashbord(),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertBox(
              onPressed: Navigator.of(context).pop,
              btnText: 'Got it',
              contentText: 'Email or Password can\'t be empty');
        },
      );
    }
    _emailController.clear();
    _passController.clear();
  }

  void signInWithApple() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertBox(
          onPressed: Navigator.of(context).pop,
          btnText: 'Got it',
          contentText: 'Can\'t login with apple account at the moment.',
        );
      },
    );
  }

  void goLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Icon(
              Icons.lock,
              size: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Welcome you\'ve missed!',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            TextInput(
                controller: _emailController,
                placeholder: 'Email or username',
                obscureText: false),
            const SizedBox(
              height: 20,
            ),
            TextInput(
                controller: _passController,
                placeholder: 'Password',
                obscureText: true),
            const SizedBox(
              height: 40,
            ),
            InputButton(btnText: 'Register', onPress: goRegister),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.black38,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Or continue with',
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: signInWithApple,
                  child: ImageContainer(
                    child: Image.asset(
                      'assets/images/apple.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: signInWithApple,
                  child: ImageContainer(
                    child: Image.asset(
                      'assets/images/google.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Alerady a member',
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
                TextButton(
                  onPressed: goLogin,
                  child: const Text(
                    'Log In',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
