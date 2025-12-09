import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border(
          top: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.chat_sharp, color: Colors.grey[600], size: 30)),
            SizedBox(width: MediaQuery.of(context).size.width / 4.85), // Spacing between icons
            IconButton(onPressed: (){}, icon: Icon(Icons.phone, color: Colors.grey[600], size: 30)),
            SizedBox(width: MediaQuery.of(context).size.width / 4.85),
            IconButton(onPressed: (){}, icon: Icon(Icons.person, color: Colors.grey[600], size: 30)), // Profile icon, can be replaced with user's avatar
          ],
        ),
      ),
    );
  }
}