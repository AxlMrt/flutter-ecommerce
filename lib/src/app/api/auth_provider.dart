import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pizza/src/app/api/api_urls.dart';
import 'package:pizza/src/app/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final String baseUrl = APIUrls().pizzaUrl;
  final Dio _dio = Dio();
  String? _token;

  String? get token => _token;

  AuthProvider() {
    _loadToken();
  }

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');

    notifyListeners();
  }

  Future<bool> register(String email, String password) async {
    final url = '$baseUrl/users';
    try {
      final response = await _dio.post(
        url,
        data: {
          'role': 'bad526d9-bc5a-45f1-9f0b-eafadcd4fc15',
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        if (kDebugMode) {
          print('Registration failed with status code: ${response.statusCode}');
          print('Response data: ${response.data}');
        }
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during registration: $e');
        if (e is DioException) {
          print('Dio error message: ${e.message}');
          if (e.response != null) {
            print('Dio error response data: ${e.response?.data}');
          }
        }
      }
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    final url = '$baseUrl/auth/login';
    try {
      final response = await _dio.post(
        url,
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      if (response.statusCode == 200) {
        final auth = Auth.fromJson(response.data['data']);

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', auth.access_token);
        _token = auth.access_token;
        notifyListeners();
        return true;
      } else {
        if (kDebugMode) {
          print('Login failed with status code: ${response.statusCode}');
          print('Response data: ${response.data}');
        }
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during login: $e');
        if (e is DioException) {
          print('Dio error message: ${e.message}');
          if (e.response != null) {
            print('Dio error response data: ${e.response?.data}');
          }
        }
      }
      return false;
    }
  }

  Future<bool> isAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('token');
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    _token = null;
    notifyListeners();
  }
}
