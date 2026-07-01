import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dating_app/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await client.get(
      Uri.parse('https://randomuser.me/api/?results=20'),
    );

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      final List<dynamic> results = jsonMap['results'];
      return results.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
