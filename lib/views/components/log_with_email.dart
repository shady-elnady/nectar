import 'package:flutter/material.dart';

class LogInWithEmail extends StatelessWidget {
  const LogInWithEmail({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    String error = "error";
    return SafeArea(
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: error.isNotEmpty,
                child: MaterialBanner(
                  backgroundColor: Colors.white,
                  content: Text(error),
                  actions: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'dismiss',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                  contentTextStyle: const TextStyle(color: Colors.white),
                  padding: const EdgeInsets.all(10),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value != null && value.isNotEmpty ? null : 'Required',
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value != null && value.isNotEmpty ? null : 'Required',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
