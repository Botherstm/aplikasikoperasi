class ListUsersModel {
  // ignore: non_constant_identifier_names
  final String user_id;
  final String username;
  final String password;
  final String nama;
  late double saldo;
  // ignore: non_constant_identifier_names
  final String nomor_rekening;
  ListUsersModel({
    // ignore: non_constant_identifier_names
    required this.user_id,
    required this.username,
    required this.password,
    required this.nama,
    required this.saldo,
    // ignore: non_constant_identifier_names
    required this.nomor_rekening,
  });

  factory ListUsersModel.fromJson(Map<String, dynamic> json) => ListUsersModel(
        user_id: json["user_id"],
        username: json["username"],
        password: json["password"],
        nama: json["nama"],
        saldo: double.parse(json['saldo']),
        nomor_rekening: json["nomor_rekening"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": user_id,
        "username": username,
        "password": password,
        "nama": nama,
        "saldo": saldo,
        "nomor_rekening": nomor_rekening,
      };
}
