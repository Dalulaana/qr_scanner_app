import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner_app/qr_scan.dart';
import 'package:flutter/services.dart';

class OutputScreen extends StatelessWidget {
  final String code;
  final Function() closeScreen;
  const OutputScreen({super.key, required this.closeScreen, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          closeScreen();
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black,),),
        centerTitle: true,
        title: const Text(
          "QR scanner",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // show qr
            QrImageView(data: code, size: 150, version: QrVersions.auto,),

            const Text(
              "scanned QR"
            ),
            const SizedBox(
              height: 7,
            ),
            Text(code, textAlign: TextAlign.center,),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width-100,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 98, 150),
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: code));
                }, 
                child: const Text(
                  "copy",
                  style: TextStyle(
                    color: Colors.white,
                  ),
              )),
            )
          ],
          ),
      ),
    );
  }
}