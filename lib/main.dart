import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


//Routes
import 'package:users_info/Routes/routes.dart';

//Importaciones Bloc
import 'package:users_info/blocs/bloc/users_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UsersBloc(),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'listUsers',
        routes: appRouter,
      ),
    );
  }
}
