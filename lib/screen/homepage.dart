import 'package:attantance_qr_code/Services/Qr_generator.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String qrData;
  late String today;

  // init state
  @override
  void initState() {
    super.initState();
    _generateqr();
  }

  // generate qr code function
  void _generateqr() {
    qrData = QrGenerator.generateQr();
    today = QrGenerator.getDate();
  }

  // refresh qr code function
  Future<void> _Refresh() async {
    setState(() {
      _generateqr();
    });
  }

  // screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Today\'s QR Code',
            style: TextStyle(fontSize: 24, color: Colors.black)),
      ),
      body: RefreshIndicator(
        onRefresh: _Refresh,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 40),
          children: [
            SizedBox(
              height: 80,
            ),
            Center(
              child: SizedBox(
                  height: 320,
                  width: 320,
                  child: PrettyQrView.data(data: qrData)),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                today,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: 320,
                child: Text(
                  'scan now for marking attendance',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
