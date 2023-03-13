import 'package:flutter/material.dart';
import 'package:model_test/pages/register/register_page.dart';
import 'package:model_test/view_models/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              TextField(
                controller: context.watch<LoginViewModel>().usernameController,
              ),
              TextField(
                controller: context.watch<LoginViewModel>().passwordController,
              ),
              TextButton(
                  onPressed: () {
                    context.read<LoginViewModel>().login();
                    print(context.read<LoginViewModel>().usernameController.text);
                  },
                  child: const Text("login")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(text: const TextSpan(text: "Kayıtlı değil misin", style: TextStyle(color: Colors.black))),
                  TextButton(
                    child: const Text("Kayıt Ol"),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ));
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
