import 'package:flutter/material.dart';
import 'package:model_test/view_models/register_view_model.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(hintText: "mail"),
                controller: context.watch<RegisterViewModel>().emailController,
              ),
              TextField(
                decoration: const InputDecoration(hintText: "passsword"),
                controller: context.watch<RegisterViewModel>().passwordController,
              ),
              TextButton(
                  onPressed: () {
                    context.read<RegisterViewModel>().register();
                    print("text${context.read<RegisterViewModel>().emailController.text}");
                    print("text${context.read<RegisterViewModel>().passwordController.text}");
                  },
                  child: const Text("register")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(text: const TextSpan(text: "Kayıtlı  misin", style: TextStyle(color: Colors.black))),
                  TextButton(
                    child: const Text("giriş yap"),
                    onPressed: () {
                      Navigator.of(context).pop();
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
