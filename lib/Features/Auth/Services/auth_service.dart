// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:amasona_clone/Constants/error_handling.dart';
import 'package:amasona_clone/Constants/untlis.dart';
import 'package:amasona_clone/Features/Auth/Services/client_service.dart';
import 'package:amasona_clone/Models/user_model.dart';
import 'package:amasona_clone/Providers/user_provider.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  ClientService client = ClientService();

  void signUp(
      {required BuildContext context,
      required String email,
      required String name,
      required String password}) async {
    try {
      User _user = User(
          id: '',
          name: name,
          address: '',
          email: email,
          password: password,
          token: '',
          type: '');

      http.Response res =
          //  http.Response res = await http.post(
          //   Uri.parse('$uri/api/signup'),
          //   body: _user.toJson(),
          //   headers: <String, String>{
          //     'Content-Type': 'application/json; charset=UTF-8',
          //   },
          // );
          await client.post(url: '/api/signup', body: _user.toJson());
      httpErrorHander(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context: context,
                text: "Account created! Login whit the same currential");
          });
      // ignore: empty_catches
    } catch (e) {
      print("Error when trying SignUp => ${e.toString()}");
      showSnackBar(context: context, text: e.toString());
    }
  }

  void signInUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      http.Response res = await client.post(
        url: '/api/signin',
        body: jsonEncode(
          {"email": email, "password": password},
        ),
      );
      print('res.statusCode' + res.body.toString());
      if (res.statusCode == 200) {
        httpErrorHander(
            response: res,
            context: context,
            onSuccess: () async {
              SharedPreferences _prefs = await SharedPreferences.getInstance();
              Provider.of<UserProvider>(context, listen: false)
                  .setUser(res.body);
              await _prefs.setString(
                  "x-auth-token", jsonDecode(res.body)['token']);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/actual-home', (route) => false);
            });
      } else {
        showSnackBar(context: context, text: jsonDecode(res.body)['msg']);
      }
    } catch (e) {
      // ignore: avoid_print
      print("Error when trying Signin ! ${e.toString()}");
      showSnackBar(context: context, text: e.toString());
    }
  }

  Future<bool> getUserDetail(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      // ignore: avoid_print
      print("token : $token");
      // ignore: unused_local_variable
      http.Response res = await client.get(url: '/api/token', token: token);
      http.Response detailUser = await client.get(url: '/api', token: token);
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUser(detailUser.body);
      return true;
    } catch (e) {
      // ignore: avoid_print
      print("error Auth_service authlization => ${e.toString()}");
      showSnackBar(context: context, text: e.toString());
      return false;
    }
  }
}
