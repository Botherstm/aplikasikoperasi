import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

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

  static var cookiemanager = CookieManager(CookieJar());

  // static Dio getDio() {
  //   Dio dio = Dio();
  //   dio.interceptors.add(cookiemanager);
  //   return dio;
  // }

  // Future<String> cookieDemo() async {
  //   String url = 'http://apikoperasi.rey1024.com/';
  //   Response response = await dio.get(url);
  //   print(response);
  //   return response.data;
  // }

  postRegister(String username, String password, String nama) async {
    String url = 'http://apikoperasi.rey1024.com/register';
    final Response response;
    FormData formData = FormData.fromMap(
        {"username": username, "password": password, "nama": nama});

    response = await dio.post(
      url,
      data: formData,
    );
    if (response.statusCode == 200) {
      final data = response.data;
      // ignore: avoid_print
      print(data);
    } else {
      // ignore: avoid_print
      return print(response.data);
      ;
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
      // ignore: avoid_print
      print(username);
      // ignore: unrelated_type_equality_checks
      if (response.statusCode == 200) {
        final data = response.data;
        print(data.toList());
        Dio dio = Dio();
        dio.interceptors.add(cookiemanager);
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

  // transfer(
  //     // ignore: non_constant_identifier_names
  //     int id_pengirim,
  //     // ignore: non_constant_identifier_names
  //     double jumlah_setoran,
  //     // ignore: non_constant_identifier_names
  //     String nomor_rekening) async {
  //   String url = 'https://koperasiundiksha.000webhostapp.com/tarikan';
  //   final Response response;
  //   FormData formData = FormData.fromMap({
  //     "id_pengirim": id_pengirim,
  //     "jumlah_setoran": jumlah_setoran,
  //     "nomor_rekening": nomor_rekening
  //   });
  //   try {
  //     response = await dio.post(url, data: formData);
  //     print(response);
  //   } on DioError catch (e) {
  //     print(e);
  //   }
  // }

  // postPenarikan(int user_id, double jumlah_setoran) async {
  //   String url = 'https://koperasiundiksha.000webhostapp.com/tarikan';
  //   final Response response;
  //   FormData formData = FormData.fromMap(
  //       {"user_id": user_id, "jumlah_setoran": jumlah_setoran});
  //   try {
  //     response = await dio.post(
  //       url,
  //       data: formData,
  //     );
  //     print('Berhasil');
  //   } catch (e) {
  //     print('Gagal');
  //   }
  // }
}
