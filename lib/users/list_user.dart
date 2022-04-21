import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_info/blocs/bloc/users_bloc.dart';
import 'package:users_info/widgets/menu_bar.dart';

class ListUsers extends StatelessWidget {
  const ListUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UsersBloc>(context).add(UsersLoading());
    return Scaffold(
      drawer: MenuBar(),
      appBar: AppBar(
        title: Text('Users List'),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
        if (state is UserGetInfo) {
          return ListView.builder(
            itemCount: state.list,
            itemBuilder: (context, index) => ListTile(
              leading: Image.network(state.usersinfo[index].avatar),
              title: Text('${state.usersinfo[index].firstName} ${state.usersinfo[index].lastName}'),
              subtitle: Text(state.usersinfo[index].email),
            ),
          );
        } else if (state is ErroGetInfoUser) {
          return Container();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}


