import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  String scanResult = "scan result will appear here";

  Future<void> scanCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        "#ff0000",
        "cancel",
        true,
        ScanMode.QR,
      );
      if (!mounted) return;
      setState(() {
        scanResult = qrCode;
      });
    } on PlatformException {
      throw Exception('failed to get platform version');
    } catch (eerror) {
      print(eerror);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(scanResult),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: scanCode,
              child: const Text("scan now "),
            ),
          ],
        ),
      ),
    );
  }
}
