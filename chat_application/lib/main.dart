import 'package:chat_application/API/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:chat_application/route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Chat Application',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

Future<void> remeberMe(BuildContext context) async {
  bool login;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  login = prefs.getBool('isLoggedIn') ?? false;
  if (login) {
    context.push('/mainChat');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool isPasswordVisible = false;
  @override
  void initState() {
    super.initState();
    remeberMe(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Container(
            width: double.infinity,
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/app_icon.png', width: 150, height: 150),
                const SizedBox(height: 10),
                const Text(
                  'Welcome to Chatio',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                TextField(
                  decoration: const InputDecoration(labelText: 'Username'),
                  controller: _usernameController,
                ),
                const SizedBox(height: 20),
                TextField(
                      controller: _passwordController,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                      ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    bool success = await UserAPI().loginUser(
                      _usernameController.text,
                      _passwordController.text,
                    );
                    if (success) {
                      context.push('/mainChat');
                    } else {
                      print("==============================$success==============================");
                      print("==============================LOGIN FAILED==============================");
                    }
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () async {
                    context.push('/createAccount');
                  },
                  child: const Text(
                    'New here? Create an account',
                    style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
