import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/list_users_model.dart';
import '../model/userpreference.dart';

class Service {
  Dio dio = Dio();
  ChangeNotifier changeNotifier = ChangeNotifier();
  UserReferences userReferences = UserReferences();

  String baseUrl = 'http://apikoperasi.rey1024.com/';
  Future<List<ListUsersModel>?> getAllsers() async {
    String url = baseUrl;
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
    }
  }

  Future<List<ListUsersModel?>> getUser({required String user_id}) async {
    Dio dio = Dio();
    String url = '${baseUrl}getsingleuser';

    final Response response;

    try {
      response = await dio.post(
        url,
        data: {
          "user_id": user_id,
        },
      );

      // mengecek apakah berhasil dengan mengecek status code
      if (response.statusCode == 200) {
        var json = response.data;
        var data = json;

        if (data[0]['nama'] != null && data[0]['nama'] != '') {
          if (data is List) {
            List<ListUsersModel> user = data
                .map<ListUsersModel>((u) => ListUsersModel.fromJson(u))
                .toList();

            // print(user[0].nama);
            // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
            changeNotifier.notifyListeners();
            return user;
          }
        } else {
          return [null];
        }
      }
      return [null];
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  Future<List<ListUsersModel?>> loginUser(
      {required String username, required String password}) async {
    Dio dio = Dio();
    String url = baseUrl;

    final Response response;

    try {
      response = await dio.post(
        url,
        data: {
          "username": username,
          "password": password,
        },
      );

      // mengecek apakah berhasil dengan mengecek status code
      if (response.statusCode == 200) {
        var json = response.data;
        var data = json;

        if (data[0]['nama'] != null && data[0]['nama'] != '') {
          if (data is List) {
            dynamic user = data
                .map<ListUsersModel>((u) => ListUsersModel.fromJson(u))
                .toList();

            // simpan data user ke shared preferences
            userReferences.setUserId(user[0].user_id);
            userReferences.setUserName(user[0].username);
            userReferences.setNama(user[0].nama);
            userReferences.setSaldo(user[0].saldo);
            userReferences.setPassword(user[0].password);
            userReferences.setNomorRekening(user[0].nomor_rekening);

            // print(data);

            // print(user[0].nama);
            // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
            changeNotifier.notifyListeners();
            print(user.toList());
            return user;
          }
        } else {
          return [null];
        }
      }
      return [null];
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  Future<List<ListUsersModel?>> getsingelUser({required String user_id}) async {
    Dio dio = Dio();
    String url = '${baseUrl}getsingleuser';

    final Response response;

    try {
      response = await dio.post(
        url,
        data: {
          "user_id": user_id,
        },
      );

      // mengecek apakah berhasil dengan mengecek status code
      if (response.statusCode == 200) {
        var json = response.data;
        var data = json;

        if (data[0]['nama'] != null && data[0]['nama'] != '') {
          if (data is List) {
            List<ListUsersModel> user = data
                .map<ListUsersModel>((u) => ListUsersModel.fromJson(u))
                .toList();

            // print(user[0].nama);
            // print(user[0].nama);
            // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
            changeNotifier.notifyListeners();

            return user;
          }
        } else {
          return [null];
        }
      }
      return [null];
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  Future<List<ListUsersModel?>> getAllUser() async {
    Dio dio = Dio();
    String url = '${baseUrl}users';

    final Response response;

    try {
      response = await dio.get(url);

      // mengecek apakah berhasil dengan mengecek status code
      if (response.statusCode == 200) {
        var json = response.data;
        var data = json;

        if (data[0]['nama'] != null && data[0]['nama'] != '') {
          if (data is List) {
            dynamic user = data
                .map<ListUsersModel>((u) => ListUsersModel.fromJson(u))
                .toList();

            // print(data);
            // print(user[0].nama);
            // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
            changeNotifier.notifyListeners();
            return user;
          }
        } else {
          return [null];
        }
      }
      return [null];
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  Future<bool?> setoran(
      {required String user_id, required String nominal}) async {
    String url = '${baseUrl}setoran';

    final Response response;

    try {
      response = await dio.post(
        url,
        data: {
          "user_id": user_id,
          "jumlah_setoran": nominal,
        },
      );

      // mengecek apakah berhasil dengan mengecek status code
      if (response.statusCode == 200) {
        var json = response.data;
        var data = json;

        if (data['status'] != null && data['status'] == 'success') {
          // UserModel user = UserModel.fromJson(data);

          // simpan data user ke shared preferences
          // userReferences.setUserId(user.userId);
          // userReferences.setUserName(user.username);
          // userReferences.setNama(user.nama);
          // userReferences.setSaldo(user.saldo);
          // userReferences.setNomorRekening(user.nomorRekening);

          // print(user[0].nama);
          // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
          changeNotifier.notifyListeners();
          return true;
        } else {
          throw false;
        }
      }
      throw false;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  Future<bool?> transfer(
      {required String user_id,
      required String nominal,
      required String rekeningTujuan}) async {
    Dio dio = Dio();
    String url = '${baseUrl}transfer';

    final Response response;

    try {
      response = await dio.post(
        url,
        data: {
          "id_pengirim": user_id,
          "jumlah_transfer": nominal,
          "nomor_rekening": rekeningTujuan,
        },
      );

      // mengecek apakah berhasil dengan mengecek status code
      if (response.statusCode == 200) {
        var json = response.data;
        var data = json;

        if (data['status'] != null && data['status'] == 'success') {
          // UserModel user = UserModel.fromJson(data);

          // simpan data user ke shared preferences
          // userReferences.setUserId(user.userId);
          // userReferences.setUserName(user.username);
          // userReferences.setNama(user.nama);
          // userReferences.setSaldo(user.saldo);
          // userReferences.setNomorRekening(user.nomorRekening);

          // print(user[0].nama);
          // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
          changeNotifier.notifyListeners();
          return true;
        } else {
          throw false;
        }
      }
      throw false;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  Future<bool?> tarikan(
      {required String user_id, required String nominal}) async {
    Dio dio = Dio();
    String url = '${baseUrl}tarikan';

    final Response response;

    try {
      response = await dio.post(
        url,
        data: {
          "user_id": user_id,
          "jumlah_tarikan": nominal,
        },
      );

      // mengecek apakah berhasil dengan mengecek status code
      if (response.statusCode == 200) {
        var json = response.data;
        var data = json;

        if (data['status'] != null && data['status'] == 'success') {
          // UserModel user = UserModel.fromJson(data);

          // simpan data user ke shared preferences
          // userReferences.setUserId(user.userId);
          // userReferences.setUserName(user.username);
          // userReferences.setNama(user.nama);
          // userReferences.setSaldo(user.saldo);
          // userReferences.setNomorRekening(user.nomorRekening);

          // print(user[0].nama);
          // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
          changeNotifier.notifyListeners();
          return true;
        } else {
          throw false;
        }
      }
      throw false;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }
}
