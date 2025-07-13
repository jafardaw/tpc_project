import 'dart:convert';
import 'dart:developer';
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tcp/core/util/hive_helper.dart';
import 'package:tcp/view_models/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> logIn() async {
    emit(Loading());
    try {
      log(email.text);
      final url = Uri.parse("http://10.0.2.2:8000/api/login");
      log('2');
      final response = await http.post(
        url,
        body: {
          "email": email.text,
          "password": password.text,
        },
      );
      log('statuscode ${response.statusCode}');
      final decodedResponse = json.decode(response.body);
      //

      //
      log('statuscode2 ${decodedResponse["status"]}');
      if (decodedResponse["status"] == 200) {
        final token = decodedResponse["token"];
        StorageService.saveToken(token);
        log(token);
        log(decodedResponse.toString());
        emit(LoginSucces());
      } else {
        log('=====================00===');
        emit(LoginError(error: "${decodedResponse["message"]}"));
      }
    } catch (e) {
      log("===============${e.toString()}");
    }
  }

  Future<void> register({required String userRole}) async {
    emit(Loading());
    try {
      log(email.text);
      final url = Uri.parse("http://10.0.2.2:8000/api/register");

      log(password.text);
      log(name.text);
      log(phone.text);
      final response = await http.post(
        url,
        body: {
          "name": name.text,
          "email": email.text,
          "password": password.text,
          "phone": phone.text,
          "user_role": userRole,
        },
        headers: {"Accept": "application/json"},
      );
      log('statuscode ${response.statusCode}');
      final decodedResponse = json.decode(response.body);
      log('statuscode2 ${decodedResponse["status"]}');
      if (decodedResponse["status"] == 201) {
        final token = decodedResponse["token"];
        StorageService.saveToken(token);
        log(token);
        log(decodedResponse.toString());
        emit(SignUpSucces());
      } else {
        log('========================');
        emit(SignUpError(error: "${decodedResponse["message"]}"));
      }
    } catch (e) {
      log("==============000000=${e.toString()}");
    }
  }
}
