part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class UserGetInfo extends UsersState {
  final List usersinfo;
  final int list;

  UserGetInfo(
      {
      required this.usersinfo,
      required this.list,});
}

class ErroGetInfoUser extends UsersState {}
