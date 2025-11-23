import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:chat_application/route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://zutiqrctwqybbfuosvgp.supabase.co',
    anonKey: 'sb_publishable_Qo8cB1VtQuEcPnTBgLbNPg_GgeAYRzH',
  );
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

Future<void> alreadyLoggedIn(BuildContext context) async {
  bool login;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  login = prefs.getBool('isLoggedIn') ?? false;
  if (login) {
    context.push('/mainChat');
  } else {
    await Future.delayed(const Duration(seconds: 5));
    context.push('/createAccount');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    alreadyLoggedIn(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
