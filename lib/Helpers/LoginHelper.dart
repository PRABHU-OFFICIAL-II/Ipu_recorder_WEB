import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ipu_record/Helpers/Constants.dart';

import '../Model/User.dart';

class LoginHelper {


  static Future<User> makeLoginCall(String username, String password) async {
    print("USER NAME  : " + username);
    print("Password : " + password);
    var response = await http.post(
      Constants.USW1_AWS_POD1_LoginURL,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: jsonEncode(
        {
          "type": "login",
          "username": username,
          "password": password,
        },
      ),
    );
    print(response.body);
    Map<String, dynamic> jsonMap = json.decode(response.body);

    User currUser =  User.fromJson(jsonMap);

    print("Current User Name: "+currUser.firstName.toString());

    return currUser;

  }

}
