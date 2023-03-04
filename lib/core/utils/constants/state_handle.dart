import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../error/exceptions.dart';

void stateErrorHandle({
  required http.Response res,
  required VoidCallback onSuccess,
}) {
  switch (res.statusCode) {
    case 200:
      onSuccess();
    break;
    case 400:
    throw ServerException(messageError: jsonDecode(res.body)['msg']);
    case 500:
    throw ServerException(messageError: jsonDecode(res.body)['error']);
    default:
    throw ServerException(messageError: jsonDecode(res.body)['error']);
  }
}
