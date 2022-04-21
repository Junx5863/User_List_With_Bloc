import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
//importaciones de modelos
import 'package:users_info/model/contentModel.dart';
// importaciones serivicios
import 'package:users_info/pages/users/services/api_services.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<UsersLoading>((event, emit) async {
      ResultInfoUser? resultado = await ApiServiceUser().getUsersList(
        event.countPage
      );

      if (resultado!.resultado) {
          emit(UserGetInfo(
              usersinfo: resultado.usersInfo!.data,
              list: resultado.usersInfo!.data.length));
      } else {
        emit(ErroGetInfoUser());
      }
    });
  }
}
