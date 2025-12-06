import 'dart:convert';
import 'package:flutter/material.dart';
import '../API/user.dart';

class Createconversation extends StatefulWidget {
  const Createconversation({super.key});

  @override
  State<Createconversation> createState() => _CreateconversationState();
}

Future<List<dynamic>> fetchUsers() async {
  UserAPI userAPI = UserAPI();
  final response = await userAPI.listAllUsers();

  if (response.statusCode == 200) {
    final users = jsonDecode(response.body);
    print('$users');
    return users;
  } else {
    throw Exception('Failed to load users');
  }
}

class _CreateconversationState extends State<Createconversation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Conversation'),
        automaticallyImplyLeading: false, // Removes the back button by default
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  FutureBuilder<List<dynamic>>(
                    future: fetchUsers(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Text('No users found');
                      } else {
                        final users = snapshot.data!;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            final imageUrl =
                                (users[index]["profile_picture"] != null &&
                                    users[index]["profile_picture"].isNotEmpty)
                                ? users[index]["profile_picture"]
                                : 'https://ui-avatars.com/api/?name=${users[index]["username"]}&background=random&format=png';
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(imageUrl),
                                radius: 30,
                              ),
                              title: Text(users[index]["username"].toString()),
                              subtitle: Text(users[index]["status"].toString()),
                              onTap: () {
                                // Handle user selection
                                print(
                                  'Selected user: ${users[index]["username"]}',
                                );
                              },
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
