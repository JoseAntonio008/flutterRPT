import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_app/models/candidate_model.dart';
import '../models/user_model.dart';
import 'package:provider/provider.dart';

class ApiService {
  static String baseUrl = 'http://192.168.1.9:3000';

  Future<User> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/api/user/login');
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}));
    final Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final user = User.fromJson(data['data']);

      return user;
    } else {
      throw data['error'];
    }
  }

 static Future<Map<String, List<Candidate>>> fetchCandidate() async {
  final url = Uri.parse('$baseUrl/api/candidate/fetchCandidates');
  final response = await http.get(url, headers: {'Content-Type': 'application/json'});

  if (response.statusCode == 200) {
    final Map<String, dynamic> json = jsonDecode(response.body);
    final data = json['data'];

    // Parse each candidate list
    final List<Candidate> presCandidates =
        (data['pres'] as List).map((item) => Candidate.fromJson(item)).toList();

    final List<Candidate> secCandidates =
        (data['sec'] as List).map((item) => Candidate.fromJson(item)).toList();

    final List<Candidate> tresCandidates =
        (data['tres'] as List).map((item) => Candidate.fromJson(item)).toList();

    // Return a map of candidates
    return {
      'pres': presCandidates,
      'sec': secCandidates,
      'tres': tresCandidates,
    };
  } else {
    throw Exception('Failed to fetch candidates');
  }
}
}
