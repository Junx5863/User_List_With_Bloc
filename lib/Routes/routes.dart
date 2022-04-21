import 'package:flutter/cupertino.dart';
//importaciones pages
import 'package:users_info/pages/users/screen/list_user.dart';

//In this file we define all pages that we need it

final Map<String, Widget Function(BuildContext)> appRouter = {
  'listUsers': (_) => ListUsers(),
};
