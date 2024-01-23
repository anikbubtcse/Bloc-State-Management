import 'dart:convert';

import 'package:bloc_state_management/model/users_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../service/users_service.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersService usersService;

  UsersCubit(this.usersService) : super(UsersInitial());

  Future<void> fetchUsers() async {
    emit(UsersLoading());

    final response = await usersService.UserDetails();
    response.fold((l) {
      if (l.statusCode == 200) {
        final usersModel = List<UsersModel>.from(
            json.decode(l.body).map((x) => UsersModel.fromJson(x)));
        emit(UsersResponse(usersModel));
      } else {
        UsersError('Something went wrong');
      }
    }, (r) {
      emit(UsersError(r.errorMessage));
    });
  }
}
