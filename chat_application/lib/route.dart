import 'package:chat_application/account_management/create_account.dart';
import 'package:chat_application/main.dart';
import 'package:chat_application/user_screens/mainchat.dart';
import 'package:go_router/go_router.dart';
import 'package:chat_application/user_screens/createconversation.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const MyHomePage()),
    GoRoute(path: '/createAccount', builder: (context, state) => const CreateAccount()),
    GoRoute(path: '/mainChat', builder: (context, state) => const MainChat()),
    GoRoute(path: '/createConversation', builder: (context, state) => const Createconversation()),
  ],
);