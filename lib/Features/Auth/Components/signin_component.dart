import 'package:amasona_clone/Features/Auth/Services/auth_service.dart';
import 'package:flutter/cupertino.dart';

import '../../../Common/Widgets/custom_button.dart';
import '../../../Common/Widgets/custom_textfield.dart';
import '../../../Constants/global_variables.dart';

class SignInComponent extends StatelessWidget {
  const SignInComponent({
    Key? key,
    required TextEditingController emailController,
    required BuildContext context,
    required TextEditingController passwordController,
    required this.signInKey,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final GlobalKey<FormState> signInKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalVariables.backgroundColor,
      padding: const EdgeInsets.all(8),
      child: Form(
        // ignore: sort_child_properties_last
        child: Column(
          children: [
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
                text: "Sing In",
                ontap: () => {
                      if (signInKey.currentState!.validate())
                        {
                          AuthService().signInUser(
                              email: _emailController.text,
                              password: _passwordController.text,
                              context: context)
                        }
                    })
          ],
        ),
        key: signInKey,
      ),
    );
  }
}
