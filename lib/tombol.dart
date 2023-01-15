import 'package:flutter/material.dart';

class tombolkategori extends StatelessWidget {
  var jenis_icon;
  final String title;
  final VoidCallback? onPressed;
  tombolkategori(this.jenis_icon, this.title, this.onPressed);

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 10,
      child: Container(
        height: heightScreen * 0.13,
        width: heightScreen * 0.13,
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                jenis_icon,
                size: 40,
                color: Colors.blue,
              ),
              Text(title)
            ],
          ),
        ),
      ),
    );
  }
}
