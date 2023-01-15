import 'package:dio/dio.dart';

import '../model/list_users_model.dart';

class ListUsersService {
  Dio dio = Dio();
  Future<List<ListUsersModel>?> getDataUsers() async {
    String url = 'http://apikoperasi.rey1024.com/users';
    final Response response;
    try {
      response = await dio.get(url);
      if (response.statusCode == 200) {
        var json = response.data;
        //boleh dipakai sesuai kondisi data json
        if (json is Map && json.keys.contains('data')) {
          var data = json['data'];
          if (data is List) {
            return data
                .map<ListUsersModel>((u) => ListUsersModel.fromJson(u))
                .toList();
          }
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  postRegister(String username, String password, String nama) async {
    String url = 'http://apikoperasi.rey1024.com/register';
    final Response response;
    FormData formData = FormData.fromMap(
        {"username": username, "password": password, "nama": nama});
    // {"username": username, "password": password};

    // dio.options.headers['Authentication'] = 'Bearer $token'
    // dio.options.headers['Content type'] = 'aplication/json'
    response = await dio.post(
      url,
      data: formData,
    );
    print(username);
    if (response.statusCode == 200) {
      final data = response.data;
      print(data['Berhasil']);
    } else {
      return postRegister(username, password, nama);
    }
  }

  postLogin(String username, String password) async {
    String url = 'http://apikoperasi.rey1024.com';
    final Response response;
    FormData formData =
        FormData.fromMap({"username": username, "password": password});

    try {
      response = await dio.post(
        url,
        data: formData,
      );
      print(username);
      // ignore: unrelated_type_equality_checks
      if (response.statusCode == 200) {
        final data = response.data;
        print(data.toList());
        return ListUsersModel(
          user_id: data[0]['user_id'],
          username: username,
          password: password,
          nama: data[0]['nama'],
          saldo: data[0]['saldo'],
          nomor_rekening: data[0]['nomor_rekening'],
        );
      } else {
        return ErrorInterceptorHandler();
      }
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  getoneuser() async {
    String url = 'http://apikoperasi.rey1024.com/getsingleuser';
    final Response response;
    response = await dio.get(url);

    if (response.statusCode == 200) {
      final data = response.data;
      print(data.toList());
      return ListUsersModel(
        user_id: data[0]['user_id'],
        username: data[0]['usename'],
        password: data[0]['password'],
        nama: data[0]['nama'],
        saldo: data[0]['saldo'],
        nomor_rekening: data[0]['nomor_rekening'],
      );
    }
  }

  postPenarikan(int user_id, double jumlah_setoran) async {
    String url = 'https://koperasiundiksha.000webhostapp.com/tarikan';
    final Response response;
    FormData formData = FormData.fromMap(
        {"user_id": user_id, "jumlah_setoran": jumlah_setoran});
    try {
      response = await dio.post(
        url,
        data: formData,
      );
      print('Berhasil');
    } catch (e) {
      print('Gagal');
    }
  }
}
