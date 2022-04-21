import 'dart:convert';

//modelos
import 'package:users_info/model/contentModel.dart';
import 'package:users_info/model/user_list.dart';

//importaciones de consumo de serivicios
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiServiceUser {
  var dio = Dio();

  // Get Info User List
  Future<ResultInfoUser?> getUsersList(int countPage) async {
    ResultInfoUser resultadoValidacion = ResultInfoUser();
    try {
      GetUserList getUsersList;
      var response;
      try {
        response =
            await http.get(Uri.parse('https://reqres.in/api/users?page=$countPage'));
      } on DioError catch (e) {
        print(e);
        return resultadoValidacion;
      }
      if (response != null) {
        if (response?.statusCode == 200) {
          getUsersList = GetUserList.fromJson(jsonDecode(response.body));
          resultadoValidacion.resultado = true;
          resultadoValidacion.usersInfo = getUsersList;
          resultadoValidacion.infoDetail = getUsersList.data;
          print('Dio response!');
          print('STATUS: ${response?.statusCode}');
          print('DATA: ${response?.body}');
          return resultadoValidacion;
        }
      }
    } catch (e) {
      print(e);
      return resultadoValidacion;
    }
    return null;
  }
}
