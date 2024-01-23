import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class UsersService {
  Future<Either<http.Response, Failure>> UserDetails() async {
    try {
      const url = 'https://jsonplaceholder.typicode.com/users';
      Uri uri = Uri.parse(url);
      final response = await http.get(uri);
      return Left(response);
    } catch (e) {
      return Right(Failure(errorMessage: e.toString()));
    }
  }
}

class Failure {
  String errorMessage;

  Failure({required this.errorMessage});
}
