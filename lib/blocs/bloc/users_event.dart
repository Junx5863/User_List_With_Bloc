part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class UsersLoading extends UsersEvent {}

class UserLoaded extends UsersEvent {}
