import 'package:flutter/cupertino.dart';
import 'package:users_info/users/list_user.dart';

//In this file we define all pages that we need it

final Map<String, Widget Function(BuildContext)> appRouter = {
  'listUsers': (_) => ListUsers(),
};
