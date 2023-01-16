import 'package:dio/dio.dart';

class NasabahService {
  Dio dio = Dio();
  transfer(
    // ignore: non_constant_identifier_names
    int id_pengirim,
    // ignore: non_constant_identifier_names
    double jumlah_transfer,
    // ignore: non_constant_identifier_names
    String nomor_rekening,
  ) async {
    String url = 'http://apikoperasi.rey1024.com/transfer';
    final Response response;

    FormData formData = FormData.fromMap({
      "id_pengirim": id_pengirim,
      "jumlah_trasfer": jumlah_transfer,
      "nomor_rekening": nomor_rekening,
    });

    try {
      response = await dio.post(url, data: formData);
      print(response);
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
    }
  }

  penarikan(int user_id, double jumlah_tarikan) async {
    String url = 'http://apikoperasi.rey1024.com/tarikan';
    final Response response;
    FormData formData = FormData.fromMap(
        {"user_id": user_id, "jumlah_setoran": jumlah_tarikan});
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

  setoran(int user_id, int jumlah_setoran) async {
    String url = 'http://apikoperasi.rey1024.com/setoran';

    FormData formData = FormData.fromMap(
        {"user_id": user_id, "jumlah_setoran": jumlah_setoran});
    // ignore: unused_local_variable
    final Response response;
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
