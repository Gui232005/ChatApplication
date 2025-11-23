import 'package:chat_application/account_management/create_account.dart';
import 'package:chat_application/main.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const MyHomePage()),
    GoRoute(path: '/createAccount', builder: (context, state) => const CreateAccount()),
  ],
);