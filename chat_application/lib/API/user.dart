import 'dart:convert';
import 'package:http/http.dart' as http;

class UserAPI {
  final baseUrl = 'https://chat-application-noie.onrender.com/users';

  Future<http.Response> createUser(String username, String password) async {
    final url = Uri.parse('$baseUrl/adduser/$username');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );
    return response;
  }

  Future<http.Response> listAllUsers() async {
    final url = Uri.parse('$baseUrl/list_client');
    final response = await http.get(url);
    return response;
  }

  Future<bool> getUser(String username) async {
    final url = Uri.parse('$baseUrl/getuser/$username');
    final response = await http.get(url);
    return response.statusCode == 200;
  }
}