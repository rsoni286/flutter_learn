import 'dart:convert';

import 'package:flutter_learn/network/api_client.dart';
import 'dart:async';
import 'package:flutter_learn/models/user.dart';

class UserRepo {
  final ApiClient _apiClient = ApiClient();

  Future<List<User>> getUsers() async {
    final response = await _apiClient.getUsers();
    if (response.statusCode == 200) {
      final users = jsonDecode(response.body);
      final List<User> _userList = [];
      for (Map<String, dynamic> userMap in users) {
        _userList.add(User.fromMap(userMap));
      }
      return _userList;
    }

    throw Exception("Something went wrong");
  }
}
