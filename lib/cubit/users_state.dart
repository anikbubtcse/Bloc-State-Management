part of 'users_cubit.dart';

@immutable
abstract class UsersState extends Equatable {}

class UsersInitial extends UsersState {
  @override
  List<Object?> get props => [];
}

class UsersLoading extends UsersState {
  @override

  List<Object?> get props => [];
}

class UsersResponse extends UsersState {
  List<UsersModel> usersModel;

  UsersResponse(this.usersModel);

  @override
  List<Object?> get props => [usersModel];
}

class UsersError extends UsersState {
  final String message;

  UsersError(this.message);

  @override
  List<Object?> get props => [message];
}
