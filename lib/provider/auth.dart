import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _expiryDate;
  late String _userId;

  Future<void> signup(String email, String password) async {
    final url =
        Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyD_h42jfTHtU572uv_BxTHIjoKFfag6GVo');
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(json.decode(response.body));
  }
  Future<void> signin(String email, String password) async {
    final url =
    Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyD_h42jfTHtU572uv_BxTHIjoKFfag6GVo');
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    // final extractedData = json.decode(response.body) as Map<String, dynamic>;
    // if (extractedData.isEmpty) {
    //   return;
    print(json.encode(response.body));
  }
}
