import 'package:flutter/material.dart';
import '../../../Constants/global_variables.dart';
import '../Components/signin_component.dart';
import '../Components/signup_component.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-signin';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final signInKey = GlobalKey<FormState>();
  final signUpKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
                ListTile(
                    onTap: () => setState(() => _auth = Auth.signup),
                    tileColor: _auth == Auth.signup
                        ? GlobalVariables.backgroundColor
                        : GlobalVariables.greyBackgroundCOlor,
                    title: const Text(
                      "Create Account",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    leading: Radio(
                      activeColor: GlobalVariables.secondaryColor,
                      groupValue: _auth,
                      value: Auth.signup,
                      onChanged: ((Auth? val) => setState(() => _auth = val!)),
                    )),
                if (_auth == Auth.signup)
                  SignUpComponent(
                      emailController: _emailController,
                      nameController: _nameController,
                      passwordController: _passwordController,
                      signUpKey: signUpKey),
                ListTile(
                  onTap: () => setState(() => _auth = Auth.signin),
                  tileColor: _auth == Auth.signin
                      ? GlobalVariables.backgroundColor
                      : GlobalVariables.greyBackgroundCOlor,
                  title: const Text(
                    "Sign-In.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    groupValue: _auth,
                    value: Auth.signin,
                    onChanged: ((Auth? val) => setState(() => _auth = val!)),
                  ),
                ),
                if (_auth == Auth.signin)
                  SignInComponent(
                    emailController: _emailController,
                    passwordController: _passwordController,
                    signInKey: signInKey,
                    context: context,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
