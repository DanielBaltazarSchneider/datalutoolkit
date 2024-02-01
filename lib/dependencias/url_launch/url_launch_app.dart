import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

class UrlLaunchApp {
  static UrlLaunchApp instance = UrlLaunchApp();

  final String _phoneNumber = "+5545988293359";
  Future<void> whatsApp(String message) async {
    String url = "whatsapp://send?phone=$_phoneNumber&text=${Uri.encodeComponent(message)}";
    try {
      launchUrl(Uri.parse(url));
    } catch (e, s) {
      log("$e\n\n$s");
    }
  }

  Future<void> searchWeb(String search) async {
    String url = "https://www.google.com/search?q=$search";
    try {
      launchUrl(Uri.parse(url));
    } catch (e, s) {
      log("$e\n\n$s");
    }
  }

  Future<void> launchURL(String url) async {
    try {
      launchUrl(Uri.parse(url));
    } catch (e, s) {
      log("$e\n\n$s");
    }
  }
}
