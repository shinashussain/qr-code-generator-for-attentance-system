# Daily QR Attendance App 

This Flutter app generates a secure, **date-based QR code** every day.  
It's perfect for use cases like **daily attendance systems**, where the QR changes every 24 hours for added security.

---

##  Features

- Generates a secure QR code using SHA256 and a secret key
- Auto-updated every day using the system date
- Pull-to-refresh support (swipe down to regenerate QR)
- Lightweight and offline-capable
- Easy to integrate with scanners or APIs

---

##  How It Works

- The app combines today’s date (`dd-MM-yyyy`) with a secret key
- It hashes that string using **SHA256**
- The result is converted into a QR code using the `pretty_qr_code` package
- A scanner app or backend service can regenerate and compare the same QR to verify

---

##  Technologies Used

- Flutter
- Dart
- [pretty_qr_code](https://pub.dev/packages/pretty_qr_code)
- [crypto](https://pub.dev/packages/crypto)
- [intl](https://pub.dev/packages/intl)

---

##  File Structure

```bash
lib/
├── main.dart
├── screens/
│   └── home_screen.dart
├── services/
│   └── qr_generator.dart
└── widgets/
    └── qr_viewer.dart
