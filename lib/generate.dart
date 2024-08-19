import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQR extends StatefulWidget {
  const GenerateQR({super.key});

  @override
  State<GenerateQR> createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate QR"),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (controller.text.isNotEmpty)
              QrImageView(
                data: controller.text.trim(),
                size: 200,
                foregroundColor: Colors.white,
              ),
            const SizedBox(height: 24),
            TextField(
              controller: controller,
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    controller.text = '';
                  }
                });
              },
              decoration: InputDecoration(
                labelText: "enter text to generate QR",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text("generate"),
            ),
          ],
        ),
      ),
    );
  }
}
