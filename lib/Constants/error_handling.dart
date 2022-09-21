import 'dart:convert';

import 'package:amasona_clone/Constants/untlis.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHander(
    {required http.Response response,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context: context, text: jsonDecode(response.body)['msg']);
      break;
    case 401:
      print("Error message => " + jsonDecode(response.body)['msg']);
      showSnackBar(context: context, text: jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnackBar(context: context, text: jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(context: context, text: jsonDecode(response.body));
      break;
  }
}
