import 'package:shared_preferences/shared_preferences.dart';

class UserReferences {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  SharedPreferences? _prefs;

  // Future<SharedPreferences> init() async {
  //   return _prefs = await SharedPreferences.getInstance();
  // }

  // ignore: non_constant_identifier_names
  void setUserId(String user_id) async {
    _prefs = await _pref;
    _prefs!.setString('user_id', user_id);
  }

  Future<String?> getUserId() async {
    _prefs = await _pref;
    return _prefs!.getString('user_id');
  }

  void setUserName(String userName) async {
    _prefs = await _pref;
    _prefs!.setString('userName', userName);
  }

  Future<String?> getUserName() async {
    _prefs = await _pref;
    return _prefs!.getString('userName');
  }

  void setNama(String nama) async {
    _prefs = await _pref;
    _prefs!.setString('nama', nama);
  }

  Future<String?> getNama() async {
    _prefs = await _pref;
    return _prefs!.getString('nama');
  }

  void setSaldo(double saldo) async {
    _prefs = await _pref;
    _prefs!.setDouble('saldo', saldo);
  }

  Future<double?> getSaldo() async {
    _prefs = await _pref;
    return _prefs!.getDouble('saldo');
  }

  void setPassword(String password) async {
    _prefs = await _pref;
    _prefs!.setString('password', password);
  }

  Future<String?> getPassword() async {
    _prefs = await _pref;
    return _prefs!.getString('password');
  }

  // ignore: non_constant_identifier_names
  void setNomorRekening(String nomor_rekening) async {
    _prefs = await _pref;
    _prefs!.setString('nomorRekening', nomor_rekening);
  }

  Future<String?> getNomorRekening() async {
    _prefs = await _pref;
    return _prefs!.getString('nomorRekening');
  }

  // setting null all data
  void setNullAllData() async {
    _prefs = await _pref;
    _prefs!.setString('user_id', '');
    _prefs!.setString('username', '');
    _prefs!.setString('nama', '');
    _prefs!.setDouble('saldo', 0.0);
    _prefs!.setString('password', '');
    _prefs!.setString('nomorRekening', '');
  }

  // QR scan result
  void setQrScanResult(String qrScanResult) async {
    _prefs = await _pref;
    _prefs!.setString('qrScanResult', qrScanResult);
  }

  Future<String?> getQrScanResult() async {
    _prefs = await _pref;
    return _prefs!.getString('qrScanResult');
  }
}
