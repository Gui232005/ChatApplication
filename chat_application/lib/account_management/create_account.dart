import 'package:flutter/material.dart';
import 'package:chat_application/API/user.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
         behavior: HitTestBehavior.translucent, // Ensures taps on empty space are detected
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                margin: const EdgeInsets.only(bottom: 20),
                child: Image.asset('assets/app_icon.png'),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: const Text(
                  'Create Account',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Username'),
                controller: _usernameController
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Password'),
                controller: _passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  print('Creating account for ${_usernameController.text}');
                  if (_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Account created successfully!')),
                    );
                    UserAPI().createUser(_usernameController.text, _passwordController.text);
                    _usernameController.clear();
                    _passwordController.clear();
                    // Functionality to store the new account in the database
                    await SharedPreferences.getInstance().then((prefs) {
                      prefs.setBool('isLoggedIn', true);
                    });
                    context.go('/mainChat');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter both username and password')),
                    );
                  }
                },
                child: const Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
