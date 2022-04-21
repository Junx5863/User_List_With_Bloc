part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class UsersLoading extends UsersEvent {
   final int countPage;

  UsersLoading({required this.countPage});

}

class UserLoaded extends UsersEvent {}
