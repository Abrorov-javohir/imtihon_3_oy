import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:imtihon_3_oy/admin/models/user_model.dart';

class UserServices {
  Future<List<UserModel>> getUsers() async {
    Uri url = Uri.parse("https://exam-9ceb8-default-rtdb.firebaseio.com/.json");
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    List<UserModel> loadedUsers = [];
    if (data != null) {
      data.forEach(
        (key, value) {
          value["userId"] = key;
          loadedUsers.add(UserModel.fromJson(value));
        },
      );
    }
    return loadedUsers;
  }
}
