import 'package:chat_application/API/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Seetings extends StatefulWidget {
  const Seetings({Key? key}) : super(key: key);

  @override
  State<Seetings> createState() => _SeetingsState();
}

class _SeetingsState extends State<Seetings> {
  @override
  void initState() {
    super.initState();
    loadUsername();
    loadProfileImage();
  }

  Future<void> loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? 'User';
    });
  }

  Future<void> loadProfileImage() async {
    final url = await UserAPI().getUserImage(username);
    setState(() {
      imageURL = url;
    });
  }

  Future<void> loadDescription() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
  }

  String imageURL = '';
  late String username;
  late String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button by default
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.shade300,
                          width: 2.0,
                        ),
                        top: BorderSide(
                          color: Colors.grey.shade300,
                          width: 2.0,
                        ),
                        right: BorderSide(
                          color: Colors.grey.shade300,
                          width: 2.0,
                        ),
                        left: BorderSide(
                          color: Colors.grey.shade300,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            imageURL != ''
                                ? imageURL
                                : 'https://ui-avatars.com/api/?name=${username}&background=random&format=png',
                          ),
                        ),
                        SizedBox(width: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                            children: [
                              Text(
                                username,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                description != '' ? description : '',
                              )
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
