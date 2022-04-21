import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:users_info/blocs/bloc/users_bloc.dart';
import 'package:users_info/widgets/menu_bar.dart';

class ListUsers extends StatefulWidget {
  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  int countpage = 1;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UsersBloc>(context).add(UsersLoading(countPage: countpage));
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
              leading: ClipOval(
                child: Image.network(
                  state.usersinfo[index].avatar,
                  width: 60,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                  '${state.usersinfo[index].firstName} ${state.usersinfo[index].lastName}'),
              subtitle: Text(state.usersinfo[index].email),
            ),
          );
        } else if (state is ErroGetInfoUser) {
          return Container();
        } else {
          return getShimmerLoading();
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (countpage == 1) {
            BlocProvider.of<UsersBloc>(context).add(UsersLoading(countPage: 2));
            setState(() {
              countpage = 2;
            });
          } else {
            BlocProvider.of<UsersBloc>(context).add(UsersLoading(countPage: 1));
            setState(() {
              countpage = 1;
            });
          }
        },
        backgroundColor: Colors.red,
        child: countpage == 1
            ? Icon(Icons.arrow_forward)
            : Icon(Icons.arrow_back_rounded),
      ),
    );
  }

  Shimmer getShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) => ListTile(
          leading: ClipOval(
            child: Container(width: 60, height: 90, color: Colors.white),
          ),
          title: Container(
            width: double.infinity,
            height: 18.0,
            color: Colors.white,
          ),
          subtitle: Container(
            width: double.infinity,
            height: 14.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
