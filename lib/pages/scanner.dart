import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  static String _data = "";
  Uri _url = Uri.parse(_data);

  _scan() async {
    return await FlutterBarcodeScanner.scanBarcode(
            "#000000", "Cancel", true, ScanMode.BARCODE)
        .then(
      (value) => setState(
        () {
          _data = value;
          _url = Uri.parse(_data);
        },
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ElevatedButton(onPressed: () => _scan(), child: Text('scan')),
        // ElevatedButton (child: Text ("Scan Barcode")),
        // onPressed: ()=>_scan(),
        TextButton(
          onPressed: () {
            _launchUrl();
          },
          child: Text(_data),
        )
        // Text(_data)
      ]),
    );
  }
}
