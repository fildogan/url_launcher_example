import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

// Open site in in-app browser
Future<void> launchUrlSite({required String url}) async {
  final Uri urlParsed = Uri.parse(url);

  if (await canLaunchUrl(urlParsed)) {
    await launchUrl(urlParsed);
  } else {
    throw 'Could not launch $url';
  }
}

// Open site in external browser app
Future<void> launchUrlSiteBrowser({required String url}) async {
  final Uri urlParsed = Uri.parse(url);

  if (await canLaunchUrl(urlParsed)) {
    await launchUrl(urlParsed, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

// Open default phone app with dialed number
Future<void> launchCall({required String phoneNumber}) async {
  final Uri urlParsed = Uri.parse('tel:$phoneNumber');

  if (await canLaunchUrl(urlParsed)) {
    await launchUrl(urlParsed);
  } else {
    throw 'Could not launch call to: $phoneNumber';
  }
}

// Open default mail app with subject and body
Future<void> launchEmail() async {
  final String email = Uri.encodeComponent("filip.doganowski@gmail.com");
  final String subject = Uri.encodeComponent("Hello!");
  final String body = Uri.encodeComponent("Nice to meet you!");
  final Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");

  try {
    final bool launched = await launchUrl(mail);
    if (launched) {
      // email app opened
    } else {
      // email app is not opened
      throw Exception('Could not launch email app');
    }
  } on PlatformException catch (e) {
    throw Exception('Error launching email: $e');
  }
}

// Open default mail app without subject and body
Future<void> launchEmailWithoutSubject() async {
  final String email = Uri.encodeComponent("filip.doganowski@gmail.com");
  final Uri mail = Uri.parse("mailto:$email");

  try {
    final bool launched = await launchUrl(mail);
    if (launched) {
      // email app opened
    } else {
      // email app is not opened
      throw Exception('Could not launch email app');
    }
  } on PlatformException catch (e) {
    throw Exception('Error launching email: $e');
  }
}

// Open default messages app with selected phone number
Future<void> launchSMS({required String phoneNumber}) async {
  final Uri urlParsed = Uri.parse('sms:$phoneNumber');

  if (await canLaunchUrl(urlParsed)) {
    await launchUrl(urlParsed);
  } else {
    throw 'Could not launch sms to: $phoneNumber';
  }
}
