import 'package:amasona_clone/Features/Auth/Services/auth_service.dart';
import 'package:flutter/cupertino.dart';

import '../../../Common/Widgets/custom_button.dart';
import '../../../Common/Widgets/custom_textfield.dart';
import '../../../Constants/global_variables.dart';

class SignUpComponent extends StatelessWidget {
  const SignUpComponent({
    Key? key,
    required TextEditingController emailController,
    required TextEditingController nameController,
    required TextEditingController passwordController,
    required this.signUpKey,
  })  : _emailController = emailController,
        _nameController = nameController,
        _passwordController = passwordController,
        super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _nameController;
  final TextEditingController _passwordController;
  final GlobalKey<FormState> signUpKey;

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    void signupUser() {
      print("SIGN UP");
      authService.signUp(
          context: context,
          email: _emailController.text,
          name: _nameController.text,
          password: _passwordController.text);
    }

    return Container(
      color: GlobalVariables.backgroundColor,
      padding: const EdgeInsets.all(8),
      child: Form(
        // ignore: sort_child_properties_last
        child: Column(
          children: [
            CustomTextField(
              controller: _nameController,
              hintText: "Enter your Name",
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: _emailController,
              hintText: "Enter your Email",
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: _passwordController,
              hintText: "Enter your Password",
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                text: "Sing Up",
                ontap: () => {
                      if (signUpKey.currentState!.validate()) {signupUser()}
                    })
          ],
        ),
        key: signUpKey,
      ),
    );
  }
}
