import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';

class QrGenerator {
  static const _secretKey = 'Diun07xxyTn6I2SvyUMVNZaX2I2lJoKm';
  //  qr data genarating function
  static String generateQr() {
    final dateToday = DateTime.now();
    final formatter = DateFormat('dd-MM-yyyy');
    final dateAndKey = formatter.format(dateToday) + _secretKey;

    final bytes = utf8.encode(dateAndKey);
    final qrKey = sha256.convert(bytes);

    return qrKey.toString();
  }

  // date structuring function
  static String getDate() {
    return DateFormat('dd-MM-yyyy').format(DateTime.now());
  }
}
