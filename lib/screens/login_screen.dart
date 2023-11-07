import 'package:auth/components/diaglog_box.dart';
import 'package:auth/components/image_container.dart';
import 'package:auth/components/input_button.dart';
import 'package:auth/components/text_input.dart';
import 'package:auth/screens/dashboard.dart';
import 'package:auth/screens/forgot_pass.dart';
import 'package:auth/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  void singInAction() {
    var pass = _passController.text;
    var email = _emailController.text;
    if (email == 'example@gmail.com' && pass == 'admin123') {
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
              contentText: 'OOPS! Email or Password Incorrect',
              btnText: 'Retry',
              onPressed: Navigator.of(context).pop);
        },
      );
    }
    _passController.clear();
    _emailController.clear();
  }

  void goRegister() {
    debugPrint('goRegister');
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      ),
    );
  }

  void forgotPass() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ForgotPassScreen(),
      ),
    );
  }

  void loginWithApple() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertBox(
            contentText: 'Can\'t login with apple account at the moment.',
            btnText: 'Got it',
            onPressed: Navigator.of(context).pop);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
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
                'Welcome Back you\'ve missed!',
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
                placeholder: 'Eamil or username',
                obscureText: false,
              ),
              const SizedBox(
                height: 20,
              ),
              TextInput(
                controller: _passController,
                placeholder: 'Password',
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: forgotPass,
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InputButton(
                btnText: 'Sign In',
                onPress: singInAction,
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black38,
                        thickness: 0.5,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black38,
                        thickness: 0.5,
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
                    onPressed: loginWithApple,
                    child: ImageContainer(
                      child: Image.asset(
                        'assets/images/apple.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  TextButton(
                    onPressed: loginWithApple,
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: goRegister,
                    child: const Text(
                      'Register Now',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
