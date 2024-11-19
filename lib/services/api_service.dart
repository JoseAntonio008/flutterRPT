import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import 'package:provider/provider.dart';

class ApiService {
  final String baseUrl = 'http://10.10.10.122:4000';

  Future<User> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/api/user/login');
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final user = User.fromJson(data['data']);

      return user;
    } else {
      throw Exception('failed to login: ${response.body}');
    }
  }
}
