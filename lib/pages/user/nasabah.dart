import 'package:flutter/material.dart';

import '../../model/list_users_model.dart';

class Nasabah extends StatelessWidget {
  final ListUsersModel user;
  const Nasabah({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.lightBlueAccent),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              user.nama.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Saldo'),
            Text(user.saldo.toString()),
          ],
        ),
      ),
    );
    // return ListTile(
    //   title: Text(Data),
    //   subtitle: Text(NamaNasabah),
    //   trailing: IconButton(onPressed: (){}, icon: Icon(Icons.refresh)),
    // );
  }
}
