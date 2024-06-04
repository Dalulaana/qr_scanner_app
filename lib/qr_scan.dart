import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_app/output.dart';

const bgColor = Color(0xfffafafa);

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  bool isScanCompleted = false;
  void closeScreen() {
    isScanCompleted = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "place the QR code in the area",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text("scanning will be started automatically"),
                ],
              ),
            ),
          
            Expanded(
              flex: 4,
              child: MobileScanner(
                onDetect: (BarcodeCapture barcodeCapture) {
                  if (!isScanCompleted) {
                    final List<Barcode> barcodes = barcodeCapture.barcodes;
                    for (final barcode in barcodes) {
                      String code = barcode.rawValue ?? '---';
                      isScanCompleted = true;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OutputScreen(closeScreen: closeScreen, code: code,)),
                      );
                    }
                  }
                }
              )
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Kuljanova and Bekuzakov"
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}