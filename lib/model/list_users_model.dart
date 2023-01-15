class ListUsersModel {
  // ignore: non_constant_identifier_names
  String? user_id;
  String? username;
  String? password;
  String? nama;
  String? saldo;
  // ignore: non_constant_identifier_names
  String? nomor_rekening;

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
        saldo: json["saldo"],
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
