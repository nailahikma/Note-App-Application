import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:possapp/core/constants/variables.dart';
import 'package:possapp/data/datasource/auth_local_datasource.dart';
import 'package:possapp/data/models/response/auth_respon_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource{
  Future<Either<String, AuthResponseModel>> login(
    String email, 
    String password,
  ) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/login'),
      body: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(json.decode(response.body)));
    } else {
      return left(response.body);
    }
  }

  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/logout'),
      headers: {
        'Authorization': 'Bearer ${authData.token}',
      },
    );
    if (response.statusCode == 200) {
      return right(response.body);
    } else {
      return left(response.body);
    }
  }
}