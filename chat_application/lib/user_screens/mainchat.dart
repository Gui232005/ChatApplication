import 'package:flutter/material.dart';
import 'package:chat_application/components/footer.dart';

class MainChat extends StatefulWidget {
  const MainChat({Key? key}) : super(key: key);

  @override
  State<MainChat> createState() => _MainChatState();
}

class _MainChatState extends State<MainChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button by default
        title: const Text('Messages', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print('Search button pressed');
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 25.0, right: 25.0),
          child: Column(children: [
            Text(
              'No messages yet',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
