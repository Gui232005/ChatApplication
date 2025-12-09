import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserAPI {
  final baseUrl = 'https://chat-application-noie.onrender.com/users';

  Future<http.Response> createUser(String username, String password) async {
    final url = Uri.parse('$baseUrl/adduser/$username/$password');
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

  Future<bool> loginUser(String username, String password) async {
    final url = Uri.parse('$baseUrl/login/$username/$password');
    final response = await http.post(url);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      print("Response JSON: $jsonResponse");

      if (jsonResponse['message'] == 'Login successful') {
        return true;
      }
    }
    return false;
  }

  Future<String> getUserImage(String username) async {
    final url = Uri.parse('$baseUrl/getuserImage/$username');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      print("====================User Image URL: ${jsonResponse['profile_picture']}====================");
      return jsonResponse['profile_picture'];
    } else {
      throw Exception('Failed to load user image');
    }
  }
}
